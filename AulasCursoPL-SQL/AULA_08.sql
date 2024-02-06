create or replace function FNC_CONSULTA_SALARIO_EMPREGADO
    (pemployee_id in number)
    return number
is
    vsalary employees.salary%type;
begin
    select salary
    into vsalary
    from employees
    where employee_id = pemployee_id;
    return(vsalary);
exception
    when NO_DATA_FOUND then 
        raise_application_error(-20001, 'Empregado inexistente');
    when others then
        raise_application_error(-20002, 'Erro Oracle' || SQLCODE || ' - '|| SQLERRM);
end;

set serveroutput on 
set verify off
accept pemployee_id prompt 'Digite o id do empregado'
declare 
    vemployee_id employees.employee_id%type := &pemployee_id;
    vsalary employees.salary%type;
begin
    vsalary := FNC_CONSULTA_SALARIO_EMPREGADO(vemployee_id);
    dbms_output.put_line('Salario :' || vsalary);
end;

CREATE OR REPLACE FUNCTION DPT_CONSULTA_DEPARTAMENTO
    (pdepartment_id in number)
    RETURN VARCHAR2
IS 
    vdepartment_name departments.department_name%TYPE;
BEGIN
    SELECT department_name
    INTO vdepartment_name
    FROM departments
    WHERE department_id = pdepartment_id;
    RETURN(vdepartment_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Departamento não existente');
    WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle' || SQLCODE || SQLERRM);
END;

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pdepartment_id PROMPT 'Insira o Id de seu departamento:'
DECLARE 
    vdepartment_id departments.department_id%TYPE := &pdepartment_id;
    vdepartment_name departments.department_name%TYPE;
BEGIN 
    vdepartment_name := DPT_CONSULTA_DEPARTAMENTO(vdepartment_id);
    dbms_output.put_line('Nome do Departamento:' || vdepartment_name);
END;

commit;