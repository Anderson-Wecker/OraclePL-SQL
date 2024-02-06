set serveroutput on
set verify off
declare 
    cursor employees_cursor is
    select *
    from employees;
    
    employees_record employees_cursor%rowtype;
begin
    
    open employees_cursor;
    
        loop
            fetch employees_cursor
            into employees_record;
            
            exit when employees_cursor%notfound;
            
                dbms_output.put_line(employees_record.employee_id || ' - ' ||
                                    employees_record.first_name || ' - ' ||
                                    employees_record.last_name || ' - ' ||
                                    employees_record.department_id || ' - ' ||
                                    employees_record.job_id || ' - ' ||
                                    employees_record.phone_number || ' - ' ||
                                    ltrim(to_char(employees_record.salary, 'L99G999G999D99')));
        end loop;
    
    close employees_cursor;
end;

set serveroutput on
set verify off
declare 
    cursor departments_cursor is
        select * 
        from departments;
    departments_record departments_cursor%rowtype;
begin 
    open departments_cursor;
            loop
            fetch departments_cursor
            into departments_record;
            
            exit when departments_cursor%notfound;
                dbms_output.put_line(departments_record.department_id || ' - ' ||
                                    departments_record.department_name || ' - ' ||
                                    departments_record.manager_id);
            end loop;
    close departments_cursor;
end;

set serveroutput on
set verify off
declare
    cursor countries_cursor is
        select *
        from countries;
    countries_record countries_cursor%rowtype;
    
begin
    open countries_cursor;
    
        loop
        fetch countries_cursor
        into countries_record;
        
        exit when countries_cursor%notfound;
            dbms_output.put_line(countries_record.country_id || ' - ' ||
                                countries_record.country_name || ' - ' ||
                                countries_record.region_id);
        end loop;
    close countries_cursor; 
end;

set serveroutput on
set verify off
declare 
    cursor departments_cursor is
        select *
        from departments;
    departments_record departments_cursor%rowtype;
begin    
    open departments_cursor;
            loop
            fetch departments_cursor
            into departments_record;
            
            
                exit when departments_cursor%notfound;
                    dbms_output.put_line(departments_record.department_id || ' - ' ||
                                        departments_record.department_name);
            end loop;
    close departments_cursor;
end;

set serveroutput on
set verify off
declare 
    CURSOR employees_cursor is
    select * 
    from employees;
begin 
    for employees_record in employees_cursor
        loop
            dbms_output.put_line(employees_record.employee_id || ' - ' ||
                                        employees_record.first_name || ' - ' ||
                                        employees_record.last_name || ' - ' ||
                                        employees_record.department_id || ' - ' ||
                                        employees_record.job_id || ' - ' ||
                                        employees_record.phone_number || ' - ' ||
                                        ltrim(to_char(employees_record.salary, 'L99G999G999D99')));
        end loop;
end;

set serveroutput on
set verify off
declare 
    cursor departments_cursor is
    select *
    from departments;
begin 
    for departments_record in departments_cursor 
        loop
            dbms_output.put_line(departments_record.department_id || ' - ' ||
                                departments_record.department_name);
        end loop;
end;

set serveroutput on 
set verify off
begin 
    for countries_record in (select *
                            from countries)
        loop
            dbms_output.put_line(countries_record.country_id || ' - ' ||
                                countries_record.country_name || ' - ' ||
                                countries_record.region_id);
        end loop;
end;

set serveroutput on
set verify off
declare   
    cursor employees_cursor(pdepartment_id number, pjob_id varchar2)
    is select * from employees
    where department_id = pdepartment_id and job_id = pjob_id;
begin
    for employees_record in employees_cursor(60, 'IT_PROG')
    loop
        dbms_output.put_line(employees_record.employee_id || ' - ' ||
                                        employees_record.first_name || ' - ' ||
                                        employees_record.last_name || ' - ' ||
                                        employees_record.department_id || ' - ' ||
                                        employees_record.job_id || ' - ' ||
                                        employees_record.phone_number || ' - ' ||
                                        ltrim(to_char(employees_record.salary, 'L99G999G999D99')));
    end loop;
end;

set serveroutput on
set verify off
declare 
    cursor employees_cursor (pjob_id varchar2)
    is 
    select *
    from employees
    where job_id = pjob_id
    for update;
begin 
    for employees_record in employees_cursor('AD_VP')
    loop
        update employees
        set salary = salary * (1 + 10 /100)
        where current of employees_cursor;
    end loop;
        commit;
end;

set serveroutput on
set verify off
accept pemployee_id prompt 'Digite o id do empregado :'
declare
    vfirst_name employees.first_name%type;
    vlast_name employees.last_name%type;
    vemployee_id employees.employee_id%type := &pemployee_id;
begin
    select first_name, last_name
    into vfirst_name, vlast_name
    from employees
    where employee_id = vemployee_id;
        dbms_output.put_line('Empregado: ' || vfirst_name || ' ' || vlast_name);
    
    exception
        when no_data_found
        then
            raise_application_error(-20001, 'Empregado não encontrado, id = ' || to_char(vemployee_id));
        when others
        then
            raise_application_error(-20002, 'Erro Oracle - ' || sqlcode || sqlerrm);
end;
commit;