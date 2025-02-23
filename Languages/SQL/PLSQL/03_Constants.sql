SET serveroutput ON

DECLARE
    my_message CONSTANT VARCHAR2(50) := "Good morning y'all!";
    my_number CONSTANT NUMBER(6) := 40000;
BEGIN
    my_message := 'See you soon!'; -- Error!

    dbms_output.put_line(my_message);
    dbms_output.put_line(my_number);
END;
