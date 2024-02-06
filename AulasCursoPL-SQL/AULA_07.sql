set serveroutput on
set verify off
accep pemployee_id prompt 'Digite o ID do empregado :'
declare 
    vfirst_name employees.fisrt_name%type;
    vlast_name employees.last_name%type;
    vjob_id employees.job_id%type;
    vemployee_id employees.employee_id%type := &pemployee_id;
    epresident exception;
begin
    select first_name,last_name, job_id
    into vfirst_name, vlast_name, vjob_id
    from employees
    where employee_id = vemployee_id;
    
        if  vjob_id = 'AD_PRES'
        then 
            raise epresident;
        end if;
    exception
        when NO_DATA_FOUND
        then
            update 
                RAISE_APPLICATION_ERROR(-20001, 'Empregado não encontrado, id = ' ||
                                        to_char(vemployee_id));
        when epresident
        then
            update employees
            set salary = salary * 1.5
            where employee_id = vemployee_id;
            --commit;
        when others
        then 
            raise_application_error(-20002, 'Erro Oracle' || SQLCODE || SQLERRM);
    
end;


