alter table projects 
add department_id number(3);

desc projects;

alter table projects 
drop column department_id;

alter table projects 
modify project_code varchar2(6);

drop table projects;
create table projects(
    project_id number(6)not null,
    project_code varchar2(10)not null,
    project_name varchar2(100)not null,
    department_id number(4)not null,
    creation_date date default sysdate not null,
    start_date date,
    end_date date,
    status varchar2(20)not null,
    priority varchar2(10)not null,
    budget number(11,2)not null,
    description varchar2(400)not null,
    constraint projects_project_id_pk primary key (project_id),
    constraint projects_department_id_fk foreign key(department_id)references departments (department_id),
    constraint projects_budget_ck check (budget > 0)
);

select uid, userenv('language'), user, sysdate
from dual;
 drop table projects;
 
insert into projects(project_id, project_code, project_name, department_id, creation_date, start_date, end_date, status, 
                    priority, budget, description)
            values(1, 'ERPIMP', 'ERP Implementation', 60, sysdate, null, null, 'Aproved', 'HIGH', 1000000.00, 
                    'Oracle ERP Implementation');
                    
select * from projects;


commit;
