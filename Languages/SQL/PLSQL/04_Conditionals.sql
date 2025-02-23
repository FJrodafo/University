SET serveroutput ON

DECLARE
    a NUMBER(2) := 10;
    b NUMBER(2) := 20;
    num NUMBER(3) := 100;
BEGIN
    IF a > b THEN
        dbms_output.put_line(a || ' is greater than ' || b);
    ELSE
        dbms_output.put_line(b || ' is greater than ' || a);
    END IF;

    IF (num = 10) THEN
        dbms_output.put_line('The value of num is 10');
    ELSIF (num = 20) THEN
        dbms_output.put_line('The value of num is 20');
    ELSIF (num = 40) THEN
        dbms_output.put_line('The value of num is 40');
    ELSE
        dbms_output.put_line('None of the values ​​were found.');
        dbms_output.put_line('The value of num is: ' || num);
    END IF;
END;
