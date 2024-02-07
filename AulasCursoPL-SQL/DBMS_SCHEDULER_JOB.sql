CREATE TABLE agenda(
    id_agenda number,
    agenda_data DATE
);

CREATE SEQUENCE AGENDA_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE 
NOMAXVALUE 
NOCYCLE;

CREATE OR REPLACE PROCEDURE PRC_INSERE_DATA_AGENDA
IS 
BEGIN
    INSERT INTO hr.agenda VALUES(agenda_seq.NEXTVAL, sysdate);
    COMMIT;
END;


BEGIN
    DBMS_SCHEDULER.create_program(
            program_name => 'HR.PRC_INSERE_AGENDA',
            program_action => 'HR.PRC_INSERE_DATA_AGENDA',
            program_type => 'STORED_PROCEDURE',
            number_of_arguments => 0,
            comments => 'Insere dados na agenda',
            enabled => true);
END;


BEGIN
    DBMS_SCHEDULER.CREATE_SCHEDULE (
        schedule_name  => 'SCH_A_CADA_10_SEGUNDOS',
        start_date     => SYSTIMESTAMP,
        --start_date => TO_TIMESTAMP_TZ('2020-03-17 15:17:36.000000000 AMERICA/SAO_PAULO','YYYY-MM-DD HH24:MI:SS.FF TZR'),
        repeat_interval  => 'FREQ=SECONDLY;INTERVAL=10',
        end_date => TO_TIMESTAMP_TZ('2020-07-23 23:00:00.000000000 AMERICA/SAO_PAULO','YYYY-MM-DD HH24:MI:SS.FF TZR'),
        comments => 'A cada 10 segundos'
        );
END;


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE 
    vfile UTL_FILE.FILE_TYPE;
    CURSOR employees_c IS
    SELECT employee_id, first_name, last_name, job_id, salary
    FROM employees;
BEGIN
    vfile := UTL_FILE.FOPEN('ARQUIVO', 'employees.txt','w', 32767);
    FOR employees_r IN employees_c LOOP
        UTL_FILE.PUT_LINE(vfile, employees_r.employee_id || ';' ||
                             employees_r.first_name || ';' ||
                             employees_r.last_name || ';' ||
                             employees_r.job_id || ';' ||
                             employees_r.salary);
    END LOOP;
    UTL_FILE.FCLOSE(vfile);
    DBMS_OUTPUT.PUT_LINE('Arquivo texto employees.txt gerado com sucesso');
EXCEPTION
    WHEN UTL_FILE.INVALID_PATH THEN
        UTL_FILE.FCLOSE(vfile);
        DBMS_OUTPUT.PUT_LINE('Diretório inválido');
    WHEN UTL_FILE.INVALID_OPERATION THEN
        UTL_FILE.FCLOSE(vfile);
        DBMS_OUTPUT.PUT_LINE('Operação inválida no arquivo');
   WHEN UTL_FILE.WRITE_ERROR THEN
        UTL_FILE.FCLOSE(vfile);
        DBMS_OUTPUT.PUT_LINE('Erro de gravção do arquivo');
    WHEN UTL_FILE.INVALID_MODE THEN
        UTL_FILE.FCLOSE(vfile);
        DBMS_OUTPUT.PUT_LINE('Modo de acesso inválido'); 
    WHEN OTHERS THEN
        UTL_FILE.FCLOSE(vfile);
        DBMS_OUTPUT.PUT_LINE('ERROR ORACLE' || SQLCODE || SQLERRM);
END;
        