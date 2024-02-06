SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE PRC_EMPLOYEE_CURSOR
    (pemployee_id IN employees.employee_id%TYPE DEFAULT NULL,
    pmanager_id IN employees.manager_id%TYPE DEFAULT NULL)
AS 
    TYPE employees_cursor_type IS REF CURSOR;
        employees_cursor    employees_cursor_type;
        vemployees_record   employees%ROWTYPE;
        vnum    varchar2(600) := 'SELECT *
                                FROM employees
                                WHERE 1 = 1';
BEGIN
    IF pemployee_id IS NOT NULL THEN 
        vnum := vnum || 'AND employee_id = :employee_id';
    END IF;
    IF pmanager_id IS NOT NULL THEN 
        vnum := vnum || 'AND manager_id = :manager_id';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(vnum);

    CASE 
        WHEN pemployee_id IS NOT NULL AND pmanager_id IS NOT NULL THEN
            OPEN employees_cursor FOR vnum USING pemployee_id, pmanager_id;
        WHEN pemployee_id IS NOT NULL AND pmanager_id IS NULL THEN 
            OPEN employees_cursor FOR vnum USING pemployee_id;
        WHEN pmanager_id IS NOT NULL AND pemployee_id IS NULL THEN 
            OPEN employees_cursor FOR vnum USING pmanager_id;
        ELSE 
            OPEN employees_cursor FOR vnum;
    END CASE;
    
    LOOP
        FETCH employees_cursor
        INTO vemployees_record;
        
        EXIT WHEN employees_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(vemployees_record.employee_id || ' / ' ||
                            vemployees_record.first_name || ' / ' ||
                            vemployees_record.last_name || ' / ' ||
                            vemployees_record.email || ' / ' ||
                            vemployees_record.manager_id);                            
    END LOOP;
    CLOSE employees_cursor;
EXCEPTION
    WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001, 'ERROR ORACLE' || SQLCODE || SQLERRM);
END;

exec PRC_EMPLOYEE_CURSOR(pemployee_id => 101)
commit;