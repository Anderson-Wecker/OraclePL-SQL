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
                                        employees_table(i).last_name);
                end loop;
end;

set serveroutput on
set verify off
accept pemployee_id prompt 'Digite seu Id:'
declare 
    employees_record employees%rowtype;
    vemployee_id employees.employee_id%type := &pemployee_id;
begin
    select *
    into employees_record
    from employees
    where employee_id = vemployee_id;
        dbms_output.put_line(employees_record.employee_id || ' ' ||
                            employees_record.first_name || ' ' ||
                            employees_record.last_name || ' ' ||
                            employees_record.salary);
end;

set serveroutput on
accept pnome prompt 'Digite seu nome'
declare 
    cont number(3) := 1;
    vnum number(3) := 38;
    vnome varchar2(100);
begin
    vnome := '&pnome';
    while cont <= vnum loop
        dbms_output.put_line('Seu Nome é : ' || vnome);
        cont := cont + 1;
    end loop;
end;

set serveroutput on
set verify off
declare
    type numero_table_type is table of integer(2);
    numero_table numero_table_type := numero_table_type();
begin
    for i in 1..10
    loop
        numero_table.extend;
        numero_table(i) := i;
    end loop;
    
        for i in 1..10
        loop
            dbms_output.put_line('Nested Table: Indice = ' || to_char(i) || ', Valor ' || to_char(numero_table(i)));
        end loop;
end;

set serveroutput on 
set verify off
declare 
    type numero_table_type is table of integer(2);
    numero_table numero_table_type := numero_table_type();
begin
    for i in 1..10
    loop
        numero_table.extend;
        numero_table(i) := i;
    end loop;
    
        for i in 1..10
        loop
            dbms_output.put_line('Indice : ' || to_char(i) || ', Valor : ' || to_char(numero_table(i)));
        end loop;
end;

set serveroutput on 
set verify off
declare
    type employees_table_type is varray (200)
    of employees%rowtype;
    
    employees_table employees_table_type := employees_table_type();
begin
    select *
        bulk collect into employees_table
    from employees;
        for i in employees_table.first..employees_table.last
        loop
            dbms_output.put_line(employees_table(i).employee_id || ' - ' ||
                                employees_table(i).first_name || ' - ' ||
                                employees_table(i).last_name || ' - ' ||
                                employees_table(i).phone_number || ' - ' ||
                                employees_table(i).job_id || ' - ' ||
                                to_char(employees_table(i).salary, '99G999G999D99'));
        end loop;
end;

commit;