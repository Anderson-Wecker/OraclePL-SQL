describe employees;

desc departments;

desc jobs;

select * from employees;

select * from departments;

select job_id, min_salary from jobs;

select first_name, last_name, salary, salary * 1.15 from employees;

select first_name, last_name, salary, (salary + 100) * 1.15 from employees;

select first_name, last_name, salary, job_id, commission_pct from employees; 

select first_name, last_name, job_id, commission_pct, 200000 * commission_pct
from employees 
where commission_pct is NULL;

select first_name as nome, last_name sobrenome, salary sal�rio 
from employees;

select first_name as nome, last_name as primeiro, salary sal�rio 
from employees;

select first_name "Nome", last_name "Sobrenome", salary "Sal�rio (R$)", commission_pct "Percentual de comiss�o" 
from employees;

select first_name || ' ' || last_name || ',data de admiss�o:' || hire_date "Funcion�rios"
from employees;

select first_name || ' ' || last_name || ', ' || q'[ Sal�rio: ]' || salary || ', ' ||
q'[Data de admiss�o: ]' || hire_date "Dados"
from employees;

select department_name || q'[Departament's Manager Id:]'
|| manager_id "Departamento e Gerente"
from departments;

select department_id from employees;

select distinct department_id from employees;

select distinct first_name, last_name from employees;

