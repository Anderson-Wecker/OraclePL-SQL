insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary,
                        commission_pct, manager_id, department_id)
            values (208, 'Vito', 'Corleone', 'VCORL', '525.342.237', TO_DATE('11/02/2020', 'DD/MM/YYYY'), 'IT_PROG',
                    20000, null, 103, 60);
select * from employees
where employee_id = 208;

insert into departments(department_id, department_name, location_id)
            values(&department_id, '&department_name', &location);
            
select * from departments
order by department_id desc;

commit;

create table sales_reps(
    id number(6,0),
    name varchar2(20),
    salary number(8,2),
    commission_pct number(2,2)
);

insert into sales_reps(id, name, salary, commission_pct)
            select employee_id, last_name, salary, commission_pct
            from employees
            where job_id = 'SA_REP';
            
COMMIT;

select * from sales_reps;

update employees set salary = salary * 1.2
where last_name = 'King';

select * from employees
where last_name = 'King';

update employees set job_id = (select job_id
                                from employees
                                where employee_id = 141),
                    salary = (select salary
                                from employees
                                where employee_id = 141)
                    where employee_id = 140;

select * from employees 
where employee_id = 140;

commit;

-- table
create table projects(
    project_id number(6)not null,
    project_code varchar2(10)not null,
    project_name varchar2(100)not null,
    creation_date date default sysdate not null,
    start_date date,
    end_date date,
    status varchar2(20)not null,
    priority varchar2(10)not null,
    budget number(11,2)not null,
    description varchar2(400)not null
);

select * from projects;

create table teams(
    project_id number(6) not null,
    employee_id number(6)not null
);

select employee_id, first_name, rowid, length(rowid)
from employees
where rowid = 'AAASe9AAMAAAADNAAA';
commit;

-- view
-- sequence
-- index
-- synonym