select * from employees 
where salary > 9000 and job_id = 'SA_REP'
order by salary asc;

select sum(salary) SALARIO_SOMADO 
from employees
where job_id = 'SA_REP';

select department_name from departments;

select e.first_name, e.salary,  d.department_name, nvl(e.commission_pct, 0),
        e.salary * e.commission_pct "Salario + Comissão"
from employees e
        join departments d on (d.department_id = e.department_id)
where job_id = 'IT_PROG';

select e.first_name, e.salary,  d.department_name, nvl(e.commission_pct, 0),
        (e.salary * e.commission_pct) + e.salary "Salario + Comissão"
from employees e
join departments d on (d.department_id = e.department_id)
where job_id = 'SA_REP';

    select job_id from employees;

    select count(job_id), sum(salary) "Dados"  
    from employees
    where job_id = 'IT_PROG';

select count(job_id), sum(salary) "Dados"  
from employees;

select sum(salary) from employees;

select * from employees 
    where job_id = 'IT_PROG'
    and salary > 3000
    and manager_id = 103;
    
select a.first_name,a.salary, a.salary+600 "Salario Novo"
from employees a;

CREATE TABLE senso
 (
ano INT NOT NULL,
cod_uf CHAR(2) NOT NULL,
estado VARCHAR2(50) NOT NULL,
cod_mun CHAR(7) NOT NULL,
nome_mun VARCHAR2(50) NOT NULL,
regiao VARCHAR2(150),
cod_meso_reg CHAR(4),
nome_meso_reg VARCHAR2(100) NOT NULL,
cod_mic_reg CHAR(5) NOT NULL,
nome_min_reg VARCHAR2(50) NOT NULL,
pib DECIMAL(12,3) NOT NULL,
populacao INTEGER NOT NULL,
pib_per_cap DECIMAL(12,3) NOT NULL
);


CREATE TABLE uf
(cod_uf CHAR(2) NOT NULL PRIMARY KEY,
 sigla_uf CHAR(2) NOT NULL,
 estado VARCHAR2(50) NOT NULL
);

select * from senso;

select * from uf;