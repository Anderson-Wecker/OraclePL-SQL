SET SERVEROUTPUT ON 
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE PRC_COD_SENSO_CURSOR
    (pcod_uf    IN senso.cod_uf%TYPE DEFAULT NULL,
    pcod_mun    IN senso.cod_mun%TYPE DEFAULT NULL)
AS 
    TYPE senso_cursor_type IS REF CURSOR;
        senso_cursor   senso_cursor_type;
        vsenso_record   senso%ROWTYPE;
        vsql    VARCHAR2(600) := 'SELECT *
                                FROM senso
                                WHERE 1 = 1';
BEGIN
    IF pcod_uf IS NOT NULL THEN
        vsql := vsql || 'AND cod_uf = :cod_uf';
    END IF;
    IF pcod_mun IS NOT NULL THEN 
        vsql := vsql || 'AND cod_mun = :cod_mun';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(vsql);
    
    CASE
        WHEN pcod_uf IS NOT NULL AND pcod_mun IS NOT NULL THEN
            OPEN senso_cursor FOR vsql USING pcod_uf, pcod_mun;
        WHEN pcod_uf IS NOT NULL AND pcod_mun IS NULL THEN 
            OPEN senso_cursor FOR vsql USING pcod_uf;
        WHEN pcod_mun IS NOT NULL AND pcod_uf IS NULL THEN
            OPEN senso_cursor FOR vsql USING pcod_mun;
        ELSE 
            OPEN senso_cursor FOR vsql;
    END CASE;
    
    LOOP 
        FETCH senso_cursor
        INTO vsenso_record;
        
        EXIT WHEN senso_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(vsenso_record.cod_uf || ' || ' ||
                            vsenso_record.cod_mun || ' || ' ||
                            vsenso_record.estado || ' || ' ||
                            vsenso_record.regiao || ' || ' ||
                            vsenso_record.nome_mun || ' || ' ||
                            vsenso_record.populacao);
    END LOOP;

    CLOSE senso_cursor;
    EXCEPTION
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20001, 'ERROR ORACLE' || SQLCODE || SQLERRM);
END;

exec PRC_COD_SENSO_CURSOR(pcod_uf => 11);

exec PRC_COD_SENSO_CURSOR(pcod_meso_mun => 1102)
COMMIT;