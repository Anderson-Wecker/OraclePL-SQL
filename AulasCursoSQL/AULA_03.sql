select e.first_name, e.salary, d.department_id, d.department_name, j.job_title, j.job_id
from employees e
    join departments d on(e.department_id = d.department_id)
    join jobs j on(e.job_id = j.job_id)
    where(e.salary BETWEEN 10000 and 15000);
    
create table job_grades(
    grade_level varchar2(2) not null,
    lowest_sal number(11,2),
    highest_sal number(11,2),
    constraint job_grades_pk primary key (grade_level)
);

INSERT INTO job_grades VALUES ('A',1000,2999); 
INSERT INTO job_grades VALUES ('B',3000,5999);
INSERT INTO job_grades VALUES ('C',6000,9999);
INSERT INTO job_grades VALUES ('D',10000,14999);
INSERT INTO job_grades VALUES ('E',15000,24999);
INSERT INTO job_grades VALUES ('F',25000,40000);
COMMIT;

select * from job_grades;

select last_name, department_name
from employees
    cross join departments;

select d.department_name, d.department_id, e.first_name, e.last_name, e.salary, 
        j.job_id, j.job_title, l.location_id, l.city, c.country_name, c.country_id,
        r.region_id, r.region_name
from employees e,
    departments d,
    jobs j,
    countries c,
    regions r,
    locations l
    where(e.department_id = d.department_id)
    and(d.location_id = l.location_id)
    and(e.job_id = j.job_id)
    and(c.country_id = l.country_id)
    and(r.region_id = c.region_id);
    
select e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
from employees e,
    departments d
where (e.department_id = d.department_id)
order by e.department_id;
    
select e.employee_id, j.job_title, d.department_name, l.city, l.state_province, l.country_id
from employees e,
    jobs j,
    departments d,
    locations l
where (e.job_id = j.job_id) and
        (d.department_id = e.department_id) and
        (d.location_id = l.location_id) AND
        (e.salary >= 1000)
order by e.employee_id;


select empregado.employee_id "Id empregado", empregado.last_name "Sobrenome empregdo",
        gerente.employee_id "Id gerente", gerente.last_name "Sobrenome gerente"
from employees empregado,
        employees gerente
where (empregado.manager_id = gerente.employee_id(+))
order by empregado.employee_id;

select e.employee_id, e.first_name, e.last_name, j.job_id, j.job_title
from employees e, jobs j;