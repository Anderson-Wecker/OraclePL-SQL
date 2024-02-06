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
COMMIT;