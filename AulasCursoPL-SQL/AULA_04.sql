set serveroutput on
accept pnome prompt 'Digite algo :'
declare
    vnome varchar2(100);
    contador integer(3) := 1;
    cont integer(3) := 38;
begin
    vnome := '&pnome';
    while contador <= cont loop 
    dbms_output.put_line('Nome :' || vnome);
    contador := contador + 1;
    end loop;
end;

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pemployee_id PROMPT 'Digite o Id do empregado: '
DECLARE
TYPE  employee_record_type IS RECORD 
          (employee_id   employees.employee_id%type,
           first_name    employees.first_name%type,
           last_name     employees.last_name%type,
           email         employees.email%type,
           phone_number  employees.phone_number%type);
employee_record  employee_record_type; 

BEGIN
SELECT  employee_id, first_name, last_name, email, phone_number
INTO    employee_record
FROM    employees
WHERE   employee_id = &pemployee_id;
DBMS_OUTPUT.PUT_LINE(employee_record.employee_id || ' - ' || 
                     employee_record.first_name || ' - ' || 
                     employee_record.last_name || ' - ' || 
                     employee_record.phone_number);
END;

set serveroutput on
set verify off
accept pemployee_id prompt 'Digite o Id :'
declare 
type employee_record_type is record
                    (employee_id employees.employee_id%type,
                    first_name employees.first_name%type,
                    last_name employees.last_name%type,
                    salary employees.salary%type);
employee_record employee_record_type;

begin 
select employee_id, first_name, last_name, salary
into employee_record
from employees
where employee_id = &pemployee_id;
dbms_output.put_line(employee_record.employee_id || ' - ' ||
                    employee_record.first_name || ' - ' ||
                    employee_record.last_name || ' - ' ||
                    employee_record.salary);
end;

set serveroutput on
set verify off
accept pdepartment_id prompt 'Insira seu departamento :'
declare 
type department_record_type is record
                        (department_id departments.department_id%type,
                        department_name departments.department_name%type,
                        manager_id departments.manager_id%type,
                        location_id departments.location_id%type);
department_record department_record_type;

    begin
    select department_id, department_name, manager_id, location_id
    into department_record
    from departments
    where department_id = &pdepartment_id;
    dbms_output.put_line('Departamento ' || department_record.department_id || ' / ' ||
                        'Nome do Departamento ' || department_record.department_name || ' / ' ||
                        'Numero do Manager ' || department_record.manager_id || ' / ' ||
                        'Locação ' || department_record.location_id);
end;


SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pemployee_id PROMPT 'Digite o Id do empregado: '
DECLARE
employee_record   employees%rowtype;
vEmployee_id      employees.employee_id%type := &pemployee_id;
    BEGIN
    SELECT  * 
    INTO    employee_record
    FROM    employees
    WHERE   employee_id = vEmployee_id;
    DBMS_OUTPUT.PUT_LINE(employee_record.employee_id || ' - ' || 
                         employee_record.first_name || ' - ' || 
                         employee_record.last_name || ' - ' || 
                         employee_record.phone_number || ' - ' ||
                         employee_record.job_id);
END;

set serveroutpu on
set verify off
accept pemployee_id prompt 'Id do empregado :'
declare 
employee_record employees%rowtype;
vemployee_id employees.employee_id%type := &pemployee_id;
    begin
    select *
    into employee_record
    from employees 
    where employee_id = vemployee_id;
    dbms_output.put_line(employee_record.employee_id || ' - ' || 
                         employee_record.first_name || ' - ' || 
                         employee_record.last_name || ' - ' || 
                         employee_record.phone_number || ' - ' ||
                         employee_record.job_id);
end;

set serveroutput on
set verify off 
accept pdepartment_id prompt 'Qual o departamento'
declare 
    department_record departments%rowtype;
    vdepartment_id departments.department_id%type := &pdepartment_id;
    begin 
    select *
    into department_record
    from departments
    where department_id = vdepartment_id;
    dbms_output.put_line(department_record.department_id || ' - ' ||
                        department_record.department_name || ' - ' ||
                        department_record.location_id);
end;


set serveroutput on
set verify off
declare 
    type numero_table_type is table of number(2)
    index by binary_integer;
    numero_table numero_table_type;
begin
    
    for i in 1..10
    loop
        numero_table(i) := i;
    end loop;
    
        for i in 1..10
        loop
            dbms_output.put_line('Associative array : Indice = ' || to_char(1) || ', Valor = ' || to_char(numero_table(i)));
        end loop;
end;

set serveroutput on 
set verify off
declare 
    type valor_table_type is table of number(2)
    index by binary_integer;
    valor_table valor_table_type;
begin
    for i in 1..30
    loop
        valor_table(i) := i;
    end loop;
    
        for i in 1..30
        loop
            dbms_output.put_line('Valor do Índice : ' || to_char(i) || ', Valor : ' || to_char(valor_table(i)));
        end loop;
end;

set serveroutput on
set verify off
declare 
 type employees_table_type is table of employees%rowtype
 index by binary_integer;
    employees_table employees_table_type;
begin
    select *
        bulk collect into employees_table
    from employees;
    for i in employees_table.first..employees_table.last
    loop
        DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' || 
                         employees_table(i).first_name || ' - ' || 
                         employees_table(i).last_name || ' - ' ||
                         employees_table(i).phone_number || ' - ' ||
                         employees_table(i).job_id || ' - ' ||
                         TO_CHAR(employees_table(i).salary,'99G999G999D99'));   
    end loop; 
end;

set serveroutput on
set verify off
declare 
    type departments_table_type is table of departments%rowtype
    index by binary_integer;
    departments_table departments_table_type;
begin
    select *
        bulk collect into departments_table
    from departments;
        for i in departments_table.first..departments_table.last
            loop
                dbms_output.put_line(departments_table(i).department_id || ' - ' ||
                                    departments_table(i).department_name || ' - ' ||
                                    departments_table(i).manager_id || ' - ' ||
                                    departments_table(i).location_id);
            end loop;
end;

set serveroutput on
set verify off
declare 
    type employees_table_type is table of employees%rowtype
    index by binary_integer;
    employees_table employees_table_type;
begin
    select *
        bulk collect into employees_table 
    from employees;    
        for i in employees_table.first..employees_table.last
            loop
                dbms_output.put_line(employees_table(i).employee_id || ' - ' ||
                                    employees_table(i).first_name || ' - ' ||
                                    employees_table(i).last_name || ' - ' ||
                                    employees_table(i).job_id || ' - ' ||
                                    employees_table(i).salary || ' - ' ||
                                    employees_table(i).email || ' - ' ||
                                    employees_table(i).commission_pct);
            end loop;
end;
