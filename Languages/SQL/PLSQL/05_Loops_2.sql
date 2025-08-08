SET serveroutput ON

DECLARE
    num NUMBER := 10;
BEGIN
    LOOP
        dbms_output.put_line(num);
        num := num + 10;

        EXIT WHEN num > 50;
    END LOOP;

    dbms_output.put_line('The value of num is: ' || num);
END;
