create or replace procedure PRC_INSERE_EMPREGADO
    (pfirst_name in varchar2,
    plast_name in varchar2,
    pemail in varchar2,
    pphone_number in varchar2,
    phire_date in date default sysdate,
    pjob_id in varchar2,
    psalary in number,
    pcommission_pct in number,
    pmanager_id in number,
    pdepartment_id in number)
is 
-- local para declaração de variáveis
begin
    insert into employees(employee_id, first_name, last_name, email, phone_number, 
                        hire_date, job_id, salary, commission_pct, manager_id, department_id)
                values(employees_seq.nextval, pfirst_name, plast_name , pemail , pphone_number ,
                        phire_date , pjob_id , psalary , pcommission_pct , pmanager_id , pdepartment_id);
exception
    when others then 
        raise_application_error(-20001, 'Error Oracle' || SQLCODE || SQLERRM);
end;

begin
    PRC_INSERE_EMPREGADO('David', 'Bowie', 'DBOWIE','515.127.4861', SYSDATE, 'IT_PROG', 15000, NULL, 103, 60);
    commit;
end;

SELECT * FROM employees
WHERE first_name = 'David' AND last_name = 'Bowie';

create or replace procedure PRC_AUMENTA_SALARIO_EMPREGADO
    (pemployee_id in number,
    ppercentual in number)
is

begin
    update employees
    set salary = salary * (1 + ppercentual / 100)
    where employee_id = pemployee_id;
exception
    when others 
        then
            raise_application_error(-20001, 'Erro Oracle' || SQLCODE || '- ' || SQLERRM);
end;

exec PRC_AUMENTA_SALARIO_EMPREGADO(109,10);

COMMIT;

create or replace procedure PRC_CONSULTA_EMPREGADO
    (pemployee_id in number,
    pfirst_name out varchar2,
    plast_name out varchar2,
    pemail out varchar2,
    pphone_number out varchar2,
    phire_date out date,
    pjob_id out varchar2,
    psalary out number,
    pcommission_pct out number,
    pmanager_id out number,
    pdepartment_id out number)
is

begin
    select 
    first_name ,
    last_name ,
    email ,
    phone_number ,
    hire_date ,
    job_id ,
    salary ,
    commission_pct ,
    manager_id ,
    department_id
    into
    pfirst_name ,
    plast_name ,
    pemail ,
    pphone_number ,
    phire_date ,
    pjob_id ,
    psalary ,
    pcommission_pct ,
    pmanager_id ,
    pdepartment_id
    from employees
    where employee_id = pemployee_id;
    
exception
    when NO_DATA_FOUND then
        raise_application_error(-20001, 'Empregado não encontrado: ' || pemployee_id);
    when others then
        raise_application_error(-20002, 'Erro Oracle ' || SQLCODE || SQLERRM);
end;
COMMIT;
    