select * from senso
    where populacao > 50000
    and ano <> 2010
    and nome_mun like '%e';
    
select * from senso
    where populacao > 50000
    and ano > '2010'
    and regiao <> 'NULL';
    
select * from senso
    where populacao between 5000 and 10000
    and ano = '2010'
    and estado not in 'Acre';
    
select * from senso
    where nome_mun like 'A%o';
    
select * from senso
    where nome_mun not like 'A%o'
    and not populacao < 40000;
    
select cod_uf, estado, count(*)qtd
from senso
    where ano = '2014'
    group by cod_uf, estado having count (cod_mun) > 500;

select cod_uf, estado, count(*) as qunatidade 
from senso 
    where ano < '2014'
    and populacao between 5000 and 15000
    group by cod_uf, estado having count(cod_mun) < 300
    order by 3 asc;
    
select cod_uf, estado, count(cod_mun) qtd, sum(populacao)
from senso
    where ano = '2014'
    group by cod_uf, estado having sum(populacao) > 5000000;