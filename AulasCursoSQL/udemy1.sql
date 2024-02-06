select a.first_name, 
    substr(a.first_name,3,10)parte1,
    substr(a.last_name, 3,10)parte2 
from hr.employees a;

select c.id_carro, c.modelo, c.placa,
    substr(c.modelo, 2, 5)letras
from teste.carro c;

select e.employee_id, e.first_name, e.salary
from hr.employees e
union
select d.department_id, d.department_name, d.manager_id
from hr.departments d;

select e.employee_id, e.first_name, d.department_name
from hr.employees e 
left join hr.departments d
on e.department_id = d.department_id
order by e.employee_id;

select e.employee_id, e.first_name, d.department_name
from hr.employees e 
right join hr.departments d
on e.department_id = d.department_id
order by e.employee_id;

select s.cod_uf, s.estado, nvl(s.regiao, 0) regiao, u.sigla_uf
from aulas_udemy.senso s
left join aulas_udemy.uf u
on s.cod_uf = u.cod_uf;

select j.job_title, instr(j.job_title, 'r')posicao from hr.jobs j; 

select j.job_title, ltrim(j.job_title, 'A')posicao from hr.jobs j;
select j.job_title, ltrim(j.job_title, 'AFPS')posicao from hr.jobs j;

select 'Andre' com_espaco, ltrim('          Andre', ' ')sem_espaco
from dual;
select 'Andre' com_espaco, ltrim('          Andre', ' ')sem_espaco
from dual;

select j.job_title, translate(j.job_title, 'AEF', 'DBI') traducao from hr.jobs j;
select j.job_title, replace(j.job_title, 'Manager', 'Gerente')tradu from hr.jobs j;

select e.first_name, e.last_name, dump(e.first_name)dump, vsize(e.first_name)vsize_first_name, vsize(last_name)vsize_last_name
from hr.employees e;

select d.department_name, dump(d.department_name)"Dump de Departamento", vsize(d.department_name)"Vsize de Departamento"
from hr.departments d;

select e.first_name, e.salary, ntile(4) over(order by e.salary desc)faixa
from hr.employees e
order by e.salary desc;

select j.job_title, e.first_name, e.salary, ntile(3) over(order by j.max_salary)faixa 
from hr.jobs j
left join hr.employees e
on j.job_id = e.job_id
order by j.max_salary desc;

select e.first_name, e.salary,
case when e.salary < 5000 then 'Baixo'
    when e.salary < 10000 then 'Medio'
    when e.salary < 15000 then 'Medio Alto'
    else 'Alto' end faixa 
from hr.employees e 
order by e.salary desc;

select e.first_name, e.manager_id,
    case when e.manager_id is null then 'Gerente'
        else 'Subordinado' end HIERARQ
from hr.employees e;

select e.first_name, nvl(e.commission_pct, 0),
    case when e.commission_pct is not null then 'Vendedor'
        else 'Interno' end nos
from hr.employees e; 

select dbms_random.value from dual;

select trunc(dbms_random.value(1, 99), 0) X from dual;
select dbms_random.string('U', 5) X from dual;

select round(45.923,1)t1,
        round(45.923)t2,
        round(45.923,-1)t3
from dual;

select * from hr.employees a 
where rownum <= 5
order by a.salary desc;

select e.first_name, e.last_name, e.salary 
from hr.employees e
where rownum <= 10
order by e.salary desc;

select cast(1932.450 as integer) conversao from dual;
select cast(1932.650 as integer) conversao from dual;

select cast(e.employee_id as integer) teste
from hr.employees e;

select cast(e.employee_id as varchar2(3))teste from hr.employees e;

alter session set NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

select e.hire_date, 
    to_date(e.hire_date, 'yyyy-mm-dd hh24:mi:ss')aaaammdd
from hr.employees e;

select sysdate "Data do Servidor",
    to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')"Data Formatada",
    to_char(sysdate, 'SCC')"Século"
from dual;
select sysdate + 5 from dual;

select sysdate data_atual, add_months(sysdate, 2)add_meses from dual;

select e.hire_date, last_day(e.hire_date)utl_dia from hr.employees e;

select userenv('LANGUAGE') as language from dual;

select sys_context('USERENV', 'SESSION_USER')from dual;
select user,uid from dual;

select * from user_users;
select sys.database_name from dual;

commit;