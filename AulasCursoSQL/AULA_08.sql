create table funcionario(
    matricula int not null primary key,
    nome varchar(50) not null,
    sobrenome varchar(50) not null,
    endereco varchar(50),
    cidade varchar(50),
    pais varchar(25),
    data_nasc DATE
);

create sequence id_func2
    start with 1
    increment by 1
    nocache;

create table salario(
    matricula int not null,
    salario decimal(10,2),
    FOREIGN key (matricula) REFERENCES funcionarios(matricula)
);

create table audit_salario(
    transacao int not null,
    matricula int not null,
    data_trans timestamp not null,
    sal_antigo decimal(10,2),
    sal_novo decimal(10,2),
    usuario varchar(20) not null, 
    primary key(transacao),
    foreign key(matricula) references funcionarios(matricula)
);

create sequence ID_TRAN
    start with 1
    increment by 1
    nocache;
    
create index ix_func1 on funcionario(data_nasc);

create index ix_func2 on funcionario(cidade, pais);

alter table funcionario add genero char(1);

commit;