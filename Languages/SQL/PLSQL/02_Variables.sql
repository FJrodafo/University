SET serveroutput ON

DECLARE
    greeting VARCHAR2(50) DEFAULT 'Hello everyone!';
    my_identifier INTEGER := 40;
    my_name VARCHAR2(25) := 'Francisco José';
    nickname CHAR(7) := 'Franchu';
    points NUMBER(5) := 10000;
    price DECIMAL(4,2) := 20.75;
    my_current_date DATE := (SYSDATE);
    another_date DATE := TO_DATE('2020/02/02','yyyy/mm/dd');
BEGIN
    dbms_output.put_line(greeting);
    dbms_output.put_line('The value of the variable is: ' || my_identifier);
    dbms_output.put_line('The username is: ' || my_name);
    dbms_output.put_line("The user's nickname is: " || nickname);
    dbms_output.put_line('The user has ' || points || ' points');
    dbms_output.put_line('The price of the item is: ' || price);
    dbms_output.put_line('The current date is: ' || my_current_date);
    dbms_output.put_line('Another date: ' || another_date);
END;
