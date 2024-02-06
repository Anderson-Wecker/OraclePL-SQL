desc countries;

select c.country_id, c.country_name, l.location_id, l.postal_code, l.city,
        r.region_id, r.region_id, d.department_name
from countries c,
    locations l,
    regions r,
    departments d
where (c.country_id = l.country_id) and
        (l.location_id = d.location_id) and
        (c.region_id = r.region_id);


        
select c.country_id, c.country_name, l.location_id, l.postal_code, l.city,
        r.region_id, r.region_id, d.department_name, e.job_id
from countries c
    join locations l on(c.country_id = l.country_id)
    join regions r on(c.region_id = r.region_id)
    join departments d on(d.location_id = l.location_id)
    join jobs j on(e.employee_id = j.job_id);
    

select first_name, last_name, job_id, salary
from employees
where salary >
            (select avg(nvl(salary,0))
            from employees);
            
select e1.department_id, max(e1.salary)
from employees e1
group by e1.department_id
having max(salary) < (select AVG(e2.salary)
                        from employees e2);
                        
select el.employee_id, min(el.salary)
from employees el
group by el.employee_id
having min(salary) < 
                    (select avg(eu.salary)
                    from employees eu);
                    
select salary from employeess;

select j.job_id, j.job_title, j.min_salary
from jobs j
where min_salary < 
                        (select avg(jo.min_salary)
                        from jobs jo);
                        
select employee_id, first_name, last_name
from employees
where salary in 
                (select avg(nvl(salary, 0))
                from employees
                group by department_id);
                
select employee_id, first_name, last_name
from employees
where first_name in 
                    (select first_name
                    from employees
                    where first_name like 'a%');
                    
select first_name from employees;

select employee_id, salary
from employees 
where salary > 3000;

select emp.employee_id, emp.last_name
from employees emp
where emp.employee_id not in (select mgr.manager_id
                            from employees mgr);

select d.department_id, d.department_name
from departments d
where d.department_id in (select e.department_id
                            from employees e);
                        
select d.department_id, d.department_name
from departments d
where exists(select e.department_id
                            from employees e
                            where d.department_id = e.department_id);

select e1.employee_id, e1.first_name, e1.job_id, e1.salary
from employees e1 
where(e1.job_id, e1.salary) in (select e2.job_id, max(e2.salary)
                                from employees e2
                                group by e2.job_id);

select employee_id, job_id, hire_date, salary
from employees 
where department_id in (60, 90 , 100)
union
select employee_id, job_id, hire_date, salary
from employees 
where job_id = 'IT_PROG'
order by employee_id;

select employee_id, nvl(commission_pct,0), first_name, salary
from employees 
where last_name like '%a'
union 
select employee_id, nvl(commission_pct, 0), first_name, salary
from employees 
where job_id = 'IT_PROG'
order by employee_id;

select employee_id, job_id
from employees 
where job_id = 'IT_PROG'
intersect 
select employee_id, job_id
from employees
where department_id in (60, 80 ,100)
order by employee_id;

select e.employee_id, e.first_name, e.salary,
        d.department_id, d.manager_id, d.department_name
from employees e
        join departments d on(d.department_id = e.department_id)
union
select c.country_id, c.country_name, c.region_id, 
        l.city, l.state_province, l.postal_code
from countries c
        join locations l on(l.country_id = c.country_id);
       