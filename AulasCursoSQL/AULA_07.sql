CREATE TABLE funcionarios(
    id int not null,
    nome varchar(50) not null,
    salario decimal(10,2),
    setor varchar(30),
    primary key(id)
);

create sequence id_func
    start with 1
    increment by 1
    nocache;
    
    
INSERT INTO funcionarios (ID,nome,salario) VALUES (ID_FUNC.NEXTVAL,'Pedro',1000);
INSERT INTO funcionarios (ID,nome,salario) VALUES (ID_FUNC.NEXTVAL,'Cleiton',1080);
INSERT INTO funcionarios (ID,nome,salario,setor) VALUES (ID_FUNC.NEXTVAL,'Joao',1000,'');
INSERT INTO funcionarios (ID,nome,salario,setor) VALUES (ID_FUNC.NEXTVAL,'Alexandre',3000,'');
INSERT INTO funcionarios (ID,nome,salario,setor) VALUES (ID_FUNC.NEXTVAL,'Ander',2000,'');

commit;
select * from funcionarios;

update funcionarios 
set id = 7
where id = 1;

rollback;

select * from funcionarios;

delete from funcionarios 
    where id between '12' and '16';
    
update funcionarios 
    set nome = 'Anderson'
where id = 11;

update funcionarios 
    set nome = 'Vitoria'
    where id = 10;

commit;

update funcionarios 
    set setor = 'Tecnologia da Informação'
    where id <> 7;

