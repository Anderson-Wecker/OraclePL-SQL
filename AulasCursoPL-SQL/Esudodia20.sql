SET SERVEROUTPUT ON 
DECLARE 
    tipo_numero VARCHAR2(100);
    j INTEGER;
BEGIN
    FOR j IN 1..10 LOOP
        IF MOD(j, 2) = 0 THEN
            tipo_numero := 'Numero par';
            GOTO mensagem;
            ELSE 
                tipo_numero := 'Numero impar';
                GOTO mensagem;
        END IF;
        <<mensagem>>
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(j) || tipo_numero);
    END LOOP;
END;

SET SERVEROUTPUT ON 
DECLARE 
    divpor5 VARCHAR2(100);
    x INTEGER;
BEGIN
    FOR x IN 1..35 LOOP
        IF MOD(x, 5) = 0 THEN
            divpor5 := 'Numero divisivel por 5';
            GOTO msg;
        ELSE 
            divpor5 := 'Numero não divisivel por 5';
            GOTO msg;
        END IF;
        <<msg>>
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(x) || ' ' || divpor5);
    END LOOP;
END;

ACCEPT v_num PROMPT 'Entre com um numero'
DECLARE 
    v_tab INT;
BEGIN
    v_tab := &v_num;
    FOR SEQ IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(SEQ || ' X ' || v_tab || ' = ' || SEQ * v_tab);
    END LOOP;
END;


ACCEPT v_digito PROMPT 'Entre com qualquer valor:'
DECLARE 
    v_num INTEGER;
BEGIN
    v_num := &v_digito;
    FOR SEQ IN 1..20 LOOP
        DBMS_OUTPUT.PUT_LINE(SEQ || ' X ' || v_num || ' = ' || SEQ * v_num);
    END LOOP;
END;

CREATE TABLE teste_for(
    numero1 INT,
    numero2 INT
);

BEGIN 
    FOR valor IN 1..10 LOOP
        INSERT INTO teste_for (numero1) VALUES(valor);
    END LOOP;
END;

SELECT * FROM teste_for;

CREATE TABLE meu_teste(
    id_num INT,
    nome VARCHAR2(30)
);

BEGIN 
    FOR seq IN 1..10 LOOP
        INSERT INTO meu_teste(id_num, nome) VALUES (seq, 'Anderson');
    END LOOP;
END;

SELECT * FROM meu_teste;

BEGIN 
    FOR valor IN 1..10 LOOP
        UPDATE teste_for SET numero2 = numero1 * valor
        WHERE numero1 = valor;
    END LOOP;
END;

BEGIN
    FOR X IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Ordem crescente ' || TO_CHAR(X));
    END LOOP;
    
    FOR Y IN REVERSE 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Ordem descrecente ' || TO_CHAR(Y));
    END LOOP;
END;

SET SERVEROUTPUT ON 
ACCEPT v_digitado PROMPT 'Digite a tabuada:'
DECLARE 
    v_tab INT;
    v_limit INT DEFAULT 1;
BEGIN
    v_tab := &v_digitado;
    WHILE v_limit <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE(v_limit || ' X ' || v_tab || ' = ' || v_limit * v_tab);
        v_limit := v_limit + 1;
    END LOOP;
END;