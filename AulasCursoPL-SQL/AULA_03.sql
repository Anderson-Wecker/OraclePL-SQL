set serveroutput on 
variable gmedia number
declare 
    vnumero1 number(11,2) := 2000;
    vnumero2 number(11,2) := 5000;
begin
    :gmedia := (vnumero1 + vnumero2)/2;
    dbms_output.put_line('Media = ' ||(:gmedia));
exception
    when others
    then
        dbms_output.put_line('Erro Oracle:' || sqlcode || sqlerrm);
end;


set serveroutput on
variable soma number
declare 
    num1 number(11,2) := 12788390;
    num2 number(11,2) := 23277387;
begin
    :soma := num1 + num2;
    dbms_output.put_line('A soma é ' || To_char(:soma));
end;

set serveroutput on
declare 
    vnumero1 number(13,2);
    vnumero2 number(13,2);
    vmedia number(13,2);
begin
    vnumero1 := 5000;
    vnumero2 := 4000;
    vmedia := (vnumero1 + vnumero2)/2;
    dbms_output.put_line('vnumero1 = ' || vnumero1);
    dbms_output.put_line('vnumero2 = ' || vnumero2);
    dbms_output.put_line('Media = ' || vmedia);
end;

set serveroutput on
declare 
    vnumero1 number(13,4);
    vnumero2 number(13,4);
    vmedia number(13,4);
begin
    vnumero1 := 5000.8888;
    vnumero2 := 3000.4444;
    vmedia := round((vnumero1 + vnumero2)/2,2);
    dbms_output.put_line('vnumero1 = ' || vnumero1);
    dbms_output.put_line('vnumero2 = ' || vnumero2);
    dbms_output.put_line('Media = ' || to_char(vmedia,'99G99G999D99'));
end;

set serveroutput on
declare 
    vbloco1 varchar2(20) := 'Bloco 1';
begin
    dbms_output.put_line('Referencia variável do Bloco 1:' || vbloco1);
    declare
        vbloco2 varchar2(20) := 'Bloco 2';
    begin
        dbms_output.put_line('Referencia variável do Bloco 1:' || vbloco1);
        dbms_output.put_line('Referencia variável do Bloco 2:' || vbloco2);
    end;
        dbms_output.put_line('Referencia variável do Bloco 1:' || vbloco1);
        -- dbms_output.put_line('Referencia variável do Bloco 2:' || vbloco2); ERRO POIS O BLOCO 2 FOI ENCERRADO 
                                                                         -- NO END ACIMA
end;

set serveroutput on
declare 
    vbloco1 varchar2(20) := 'Bloco 1';
begin
    dbms_output.put_line('Referencia variável do Bloco 1:' || vbloco1);
    declare
        vbloco2 varchar2(20) := 'Bloco 2';
    begin
        dbms_output.put_line('Referencia variável do Bloco 1:' || vbloco1);
        dbms_output.put_line('Referencia variável do Bloco 2:' || vbloco2);
    end;
        dbms_output.put_line('Referencia variável do Bloco 1:' || vbloco1);
        -- dbms_output.put_line('Referencia variável do Bloco 2:' || vbloco2); ERRO POIS O BLOCO 2 FOI ENCERRADO 
                                                                         -- NO END ACIMA
end;

set serveroutput on
declare 
    vfirst_name employees.first_name%type;
    vlast_name employees.last_name%type;
    vsalary employees.salary%type;
    vemployee_id employees.employee_id%type := 121;
begin
   select first_name, last_name, salary
   into vfirst_name, vlast_name, vsalary
   from employees
   where employee_id = vemployee_id;
   dbms_output.put_line('Employee id: ' || vemployee_id);
   dbms_output.put_line('First Name: ' || vfirst_name);
   dbms_output.put_line('Last Name: ' || vlast_name);
   dbms_output.put_line('Salary: ' || vsalary);
end;

set serveroutput on
declare 
    vcommission_pct employees.commission_pct%type;
    vfirst_name employees.first_name%type;
    vsalary employees.salary%type;
    vemployee_id employees.employee_id%type := 100;
begin
    select first_name, commission_pct, salary
    into vfirst_name, vcommission_pct, vsalary
    from employees
    where employee_id = vemployee_id;
    dbms_output.put_line('Employee id: ' || vemployee_id);
    dbms_output.put_line('First Name: ' || vfirst_name);
    dbms_output.put_line('Commission pct: ' || vcommission_pct);
    dbms_output.put_line('Salary : ' || vsalary);
end;

set serveroutput on
declare 
    vjob_id employees.job_id%type := 'IT_PROG';
    vavg_salary employees.salary%type;
    vsum_salary employees.salary%type;
begin
    select round(avg(salary), 2), round(sum(salary), 2)
    into vavg_salary, vsum_salary
    from employees
    where job_id = vjob_id;
    dbms_output.put_line('Cargo: ' || vjob_id);
    dbms_output.put_line('Média de salario : ' || vavg_salary);
    dbms_output.put_line('Soma do salario : ' || vsum_salary);
end; 

set serveroutput on
declare 
    vemployee_id employees.employee_id%type := 207;
    vpercentual number(3) := 10;
begin
    update employees
    set salary = salary * (1 + vpercentual / 100)
    where employee_id = vemployee_id;
    commit;
end;

set serveroutput on 
declare 
    vemployee_id employees.employee_id%type := 150;
begin
    update employees
    set salary = 15000
    where employee_id = vemployee_id;
    rollback;
end;

BEGIN
    INSERT INTO employees 
    (employee_id, first_name, last_name, email, phone_number, hire_date,
    job_id, salary, commission_pct, manager_id, department_id)
    VALUES 
    (employees_seq.nextval, 'Kobe', 'Bryant', 'KBRYANT', '515.123.45568', SYSDATE,
    'IT_PROG', 15000, 0.4, 103, 60);
    COMMIT;
END;

set serveroutput on
declare 
    vdepartment_id employees.department_id%type := 60;
    vpercentual number(3) := 10;
begin
    update employees 
    set salary = salary * (1 + vpercentual / 100)
    where department_id = vdepartment_id;
    dbms_output.put_line('Numero de empregados atualizado : ' || sql%rowcount);
    --commit;
end;

set serveroutput on 
declare 
    vnota1 number(11,2) := 7.0;
    vnota2 number(11,2) := 6.0;
    vnota3 number(11,2) := 9.0;
    vnota4 number(11,2) := 6.0;
    vmedia number(11,2);
begin 
    vmedia := (vnota1 + vnota2 + vnota3 + vnota4) / 4;
    dbms_output.put_line('Média : ' || vmedia);
end;

set serveroutput on
accept pdepartment_id prompt 'Digite o Id do departamento:'
declare 
    vpercentual number(3);
    vdepartment_id employees.employee_id%type := &pdepartment_id;
begin
    if vdepartment_id = 80
    then 
        vpercentual := 10;
    
    else 
        if vdepartment_id = 20
        then
            vpercentual := 15;
        else 
            if vdepartment_id = 60
            then
                vpercentual := 20;
            else 
                vpercentual := 5;
            end if;
        end if;
    end if;
    
    dbms_output.put_line('Id do Departamento: ' || vdepartment_id);
    dbms_output.put_line('Percentual : ' || vpercentual);
    
    update employees
    set salary = salary * (1 + vpercentual / 100)
    where department_id = vdepartment_id;
    --commit;
end;

set serveroutput on
accept pmenssagem char prompt 'Digite sua Frase:'
declare 
    vmsg varchar2(100);
begin
    vmsg := '&pmenssagem';
    dbms_output.put_line('Sua Menssagem: ' || vmsg);
end;

set serveroutput on
accept pdepartment_id prompt 'Digite o Id do Departamento:'
declare 
    vpercentual number(3);
    vdepartment_id employees.employee_id%type := &pdepartment_id;
begin
    case vdepartment_id 
    when 80
    then 
        vpercentual := 10;
    when 20
    then
        vpercentual := 15;
    when 60
    then
        vpercentual := 20;
    else 
        vpercentual := 5;
    end case;
    dbms_output.put_line('Id do departamento :' || vdepartment_id);
    dbms_output.put_line('Percentual :' || vpercentual);
end;

set serveroutput on
accept pdepartment_id prompt 'Selecione seu departamento:'
declare
    vpercentual number(6);
    vdepartment_id employees.employee_id%type := &pdepartment_id;
begin
    case vdepartment_id
    when 80
    then
        vpercentual := 200;
    when 20
    then 
        vpercentual := 300;
    when 60
    then
        vpercentual := 400;
    else 
        vpercentual := 100;
    end case;
    dbms_output.put_line('Seu departamento : ' || vdepartment_id);
    dbms_output.put_line('Seu percetual : ' || vpercentual);
end;

set serveroutput on 
accept plimite prompt 'Digite um valor limite:'
declare
    vnumero number(38) := 1;
    vlimite number(38) := &plimite;
begin
    
loop
    dbms_output.put_line('Numero = ' || to_char(vnumero));
    exit when vnumero = vlimite;
    vnumero := vnumero + 1;
end loop;
end;

set serveroutput on
accept plimite prompt 'Digite um valor para limite:'
declare 
    vinicio number(38) := 1;
    vlimite number(38) := &plimite;
begin

loop
    dbms_output.put_line('Numero : ' || to_char(vinicio));
    exit when vinicio = vlimite;
    vinicio := vinicio + 1;
end loop;
end;

set serveroutput on
declare 
    contador number(38) := 1;
    limite number(38) := 100;
begin

loop
    dbms_output.put_line('Contador : ' || to_char(contador));
    exit when contador = limite;
    contador := contador + 1;
end loop;
end;

set serveroutput on
accept pdepartment_id prompt 'Qual o seu departamento'
declare 
    vdepartment_id employees.employee_id%type := &pdepartment_id;
    vpercentual number(3);
begin
    if vdepartment_id = 80
    then 
        vpercentual := 100;
    else
        if vdepartment_id = 20
        then
            vpercentual := 200;
        else
            if vdepartment_id = 60
            then
                vpercentual := 300;
            else 
                vpercentual := 5;
            end if;
        end if;
    end if;
    dbms_output.put_line('Departamento : ' || vdepartment_id);
    dbms_output.put_line('Percentual : ' || vpercentual);
end;

set serveroutput on
accept plimite prompt 'Digite o valor do limite'
declare 
    vinicio integer(3) := 1;
    vfim number(38) := &plimite;
begin
for i in vinicio..vfim loop
    dbms_output.put_line('Numero : ' || to_char(i));
end loop;
end;

set serveroutput on
accept plimite prompt 'Digite o valor do limite'
declare 
    vnumero integer(3) := 1;
    vlimite number(38) := &plimite;
begin
while vnumero <= vlimite loop
    dbms_output.put_line('Numero : ' || to_char(vnumero));
    vnumero := vnumero + 1;
end loop;
end;

set serveroutput on
declare 
    vtotal number(38) := 1;
begin
    <<LOOP1>>
for i in 1..8 loop
    dbms_output.put_line('I = ' || to_char(i));
    <<LOOP2>>
    for j in 1..8 loop
        dbms_output.put_line('J = ' || to_char(j));
        vtotal := vtotal * 2;
        dbms_output.put_line('Total = ' || to_char(vtotal, '99G999G999G999G999G999G999G999D99'));
    END LOOP;
END LOOP;
    dbms_output.put_line('Total Final = ' || to_char(vtotal, '99G999G999G999G999G999G999G999D99'));
END;
commit;