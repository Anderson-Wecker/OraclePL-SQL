set serveroutput on
declare 
    vNumero number(11,2) := 1200.50;
begin 
    dbms_output.put_line('Numero = ' || vNumero);
end;

set serveroutput on
declare 
    vteste char(2):= 'PR';
    vteste2 varchar2(100) := 'Curitiba, PR, 32';
begin
    dbms_output.put_line('Variável de tamanho fixo = ' || vteste);
    dbms_output.put_line('Variável de tamanho vatiável = ' || vteste2);
end;

declare 
    vdata1 date := '29/04/20';
    vdata2 date := '29/04/2020';
begin
    dbms_output.put_line('Data 1 = ' || vdata1);
    dbms_output.put_line('Data 2 = ' || vdata2);
end;

set serveroutput on
declare 
    vpi constant number(38,15) := 3.141592653589793;
begin
    dbms_output.put_line('Pi = ' || vpi);
end;

set serveroutput on
declare 
    vfixo constant char(2) := 'PR';
    vvariavel constant varchar2(100) := 'Curitiba, PR';
BEGIN
    dbms_output.put_line('Valor fixo = ' || vfixo);
    dbms_output.put_line('Valor variavel = ' || vvariavel);
end;

set serveroutput on
declare 
    vtexto long := 'CAR'; 
    vvar long raw := hextoraw(43||41||52);
begin
    dbms_output.put_line(vtexto);
    dbms_output.put_line(vvar);
end;

SET SERVEROUTPUT ON
DECLARE
  vNumero              NUMBER(11,2) := 1200.50;
  vCaracterTamFixo     CHAR(100) := 'Texto de Tamanho Fixo de até 32767 bytes';
  vCaracterTamVariavel VARCHAR2(100) := 'Texto Tamanho variavel de até 32767 bytes';
  vBooleano            BOOLEAN := TRUE;
  vData                DATE := sysdate;
  vLong                LONG := 'Texto Tamanho variavel de até 32760 bytes';
  vRowid               ROWID;
  vTimestamp           TIMESTAMP := systimestamp;
  vTimestamptz         TIMESTAMP WITH TIME ZONE := systimestamp;
  vCaracterTamFixoUniversal     NCHAR(100) := 'Texto de Tamanho Fixo Universal de até 32767 bytes';
  vCaracterTamVariavelUniversal NVARCHAR2(100) := 'Texto Tamanho variÃ¡vel Universal de até 32767 bytes';
  vNumeroInteiro       BINARY_INTEGER := 1200;
  vNumeroFloat         BINARY_FLOAT := 15000000;
  vNumeroDouble        BINARY_DOUBLE := 15000000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Numero = ' ||   vNumero);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo );
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variavel = ' || vCaracterTamVariavel );
  IF  vBooleano = TRUE
  THEN 
    DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'TRUE');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'FALSE OR NULL');
  END IF;
  DBMS_OUTPUT.PUT_LINE('Data = ' || vData);
  DBMS_OUTPUT.PUT_LINE('Long = ' || vLong );
  SELECT rowid
  INTO   vRowid
  FROM   employees
  WHERE  first_name = 'Steven' AND last_name = 'King';
  DBMS_OUTPUT.PUT_LINE('Rowid = ' || vRowid );
  DBMS_OUTPUT.PUT_LINE('Timestamp = ' || vTimestamp);
  DBMS_OUTPUT.PUT_LINE('Timestamp with time zone= ' || vTimestamptz);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixoUniversal );
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variavel = ' || vCaracterTamVariavelUniversal );
  DBMS_OUTPUT.PUT_LINE('Numero Inteiro = ' || vNumeroInteiro);
  DBMS_OUTPUT.PUT_LINE('Numero Float = ' || vNumeroFloat);
  DBMS_OUTPUT.PUT_LINE('Numero Double = ' || vNumeroDouble);
END;