select * from hr.employees;
select * from hr.job_history;
select * from hr.departments;
select * from hr.jobs;

select * from hr.employees a 
where a.employee_id in (select b.employee_id from hr.job_history b);

select * from hr.employees e
where e.manager_id = '100'
and e.employee_id in (select b.employee_id from hr.job_history b);

select a.employee_id, a.first_name, a.job_id,
        (select b.job_title from hr.jobs b where a.job_id = b.job_id)
        as cargo 
from hr.employees a;

select e.employee_id, e.first_name, e.job_id, j.job_title "Cargo"
from hr.employees e
        join hr.jobs j on(e.job_id = j.job_id);
                    