SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE PRC_MANAGER_DEPARTMENT_CURSOR
    (pmanager_id IN employees.manager_id%TYPE DEFAULT NULL,
    pdepartment_id IN employees.department_id%TYPE DEFAULT NULL)
AS 
    TYPE employees_cursor_type IS REF CURSOR;
    employees_cursor employees_cursor_type;
    vemployees_record   employees%ROWTYPE;
    vsql    varchar(600) := 'SELECT *
                            FROM employees
                            WHERE 1 = 1';
BEGIN
    IF pmanager_id IS NOT NULL THEN 
        vsql := vsql || 'AND manager_id = :manager_id';
    END IF;
    IF pdepartment_id IS NOT NULL THEN 
        vsql := vsql || 'AND department_id = :department_id';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(vsql);
    
    CASE 
        WHEN pmanager_id IS NOT NULL AND pdepartment_id IS NOT NULL THEN 
            OPEN employees_cursor FOR vsql USING pmanager_id, pdepartment_id;
        WHEN pmanager_id IS NOT NULL AND pdepartment_id IS NULL THEN
            OPEN employees_cursor FOR vsql USING pmanager_id;
        WHEN pdepartment_id IS NOT NULL AND pmanager_id IS NULL THEN
            OPEN employees_cursor FOR vsql USING pdepartment_id;
        ELSE 
            OPEN employees_cursor FOR vsql;
    END CASE;
    
    LOOP 
        FETCH employees_cursor
        INTO vemployees_record;
        
        EXIT WHEN employees_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(vemployees_record.employee_id || ' - ' ||
                            vemployees_record.first_name || ' - ' ||
                            vemployees_record.last_name || ' - ' ||
                            vemployees_record.email || ' - ' ||
                            vemployees_record.manager_id || ' - ' ||
                            vemployees_record.department_id);
    END LOOP;
    CLOSE employees_cursor;
EXCEPTION
    WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001, 'ERROR ORACLE' || SQLCODE || SQLERRM);
END;

exec PRC_MANAGER_DEPARTMENT_CURSOR(pmanager_id => 103)

exec PRC_MANAGER_DEPARTMENT_CURSOR(pdepartment_id => 60)
commit;