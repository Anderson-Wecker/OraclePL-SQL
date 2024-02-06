select first_name, last_name, job_id, salary
from employees
where salary > 
                (select avg(nvl(salary, 0))
                from employees);
                
select employee_id, first_name, last_name
from employees 
where salary in  
                (select avg(nvl(salary, 0))
                from employees
                group by department_id);
                
select employee_id, last_name, job_id, salary
from employees 
where salary < any
                    (select salary 
                    from employees
                    where job_id = 'IT_PROG');
                
select employee_id, last_name, job_id, salary
from employees 
where salary < all
                    (select salary 
                    from employees
                    where job_id = 'IT_PROG');

select emp.employee_id, emp.last_name
from employees emp
where emp.employee_id in (select mgr.manager_id
                            from employees mgr);
                            
select employee_id, last_name
from employees
where salary in 
                (select avg(nvl(salary, 0))
                from employees
                group by department_id);