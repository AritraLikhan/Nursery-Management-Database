--Declaring a variable of a row type that corresponds to the Plants table and select a row into it

SET SERVEROUTPUT ON
DECLARE
plant_row Plants%ROWTYPE;
BEGIN
SELECT * INTO plant_row FROM Plants WHERE plantID = 1;
END;
/
  

--Printing data from all records of Orders and find the total number of records

set serveroutput on
declare 
cursor orders_cursor is select * from Orders;
orders_row Orders%rowtype;
begin
open orders_cursor;
fetch orders_cursor into orders_row.orderID,orders_row.customerID,orders_row.orderDate;
while orders_cursor%found loop
dbms_output.put_line('orderID: '||orders_row.orderID|| ' customerID '||orders_row.customerID|| 'OrderDate ' ||orders_row.orderDate);
dbms_output.put_line('Row count: '|| orders_cursor%rowcount);
fetch orders_cursor into orders_row.orderID,orders_row.customerID,orders_row.orderDate;
end loop;
close orders_cursor;
end;
/
  

--Creating an array of strings, populating it with the names ‘Plant 1’ through ‘Plant 10’, and then printing each plant name to the console

SET SERVEROUTPUT ON
DECLARE
TYPE plant_array IS TABLE OF VARCHAR2(255);
plants plant_array := plant_array();
BEGIN
FOR i IN 1..10 LOOP
plants.EXTEND;
plants(i) := 'Plant ' || i;
END LOOP;
FOR i IN plants.FIRST..plants.LAST LOOP
DBMS_OUTPUT.PUT_LINE(plants(i));
END LOOP;
END;
/
  

--Declaring an array of customers' emails with a fixed size and print its contents

SET SERVEROUTPUT ON
DECLARE
 TYPE customer_array IS TABLE OF VARCHAR2(255) INDEX BY PLS_INTEGER;
 customers customer_array;
BEGIN
     customers(1) := 'atif@gmail.com';
     customers(2) := 'arif@gmail.com';
     customers(3) := 'samiha@gmail.com';
      FOR i IN 1..3 LOOP
            DBMS_OUTPUT.PUT_LINE(customers(i));
      END LOOP;
END;
/
  

--Printing a message based on the price of a plant: cheap, moderately priced or expensive

SET SERVEROUTPUT ON
DECLARE
    plant_price NUMBER(5, 2);
BEGIN
    SELECT price into plant_price FROM plants WHERE plantID=4;
    IF plant_price < 5.0 THEN
        DBMS_OUTPUT.PUT_LINE('This plant is cheap.');
    ELSIF plant_price < 20.0 THEN
        DBMS_OUTPUT.PUT_LINE('This plant is moderately priced.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('This plant is expensive.');
    END IF;
END;
/

  

--creating a procedure to insert a new order into the Orders table
  
CREATE OR REPLACE PROCEDURE insert_customers (
    p_customerID NUMBER,
    p_fName IN VARCHAR,
    p_lName IN VARCHAR,
    p_email IN VARCHAR,
    p_phone IN NUMBER
) AS
BEGIN
    INSERT INTO Customers (customerID, firstName, lastName, email, phone)
    VALUES (p_customerID, p_fName, p_lName, p_email, p_phone);
    COMMIT;
END insert_customers;
/


-- Calling the procedure(dummy code)
DECLARE
    v_customerID NUMBER;
    v_fName VARCHAR2(50);
    v_lName VARCHAR2(50);
    v_email VARCHAR2(50);
    v_phone NUMBER;
BEGIN
    v_customerID := 11; 
    v_fName := 'Sagor'; 
    v_lName := 'Roy'; 
    v_email := 'sagor@gmail.com'; 
    v_phone := 01294251829; 
    insert_customers(v_customerID, v_fName, v_lName, v_email, v_phone);
END;
/



--Calculating the total quantity of all supplies in the Supply table using function

CREATE OR REPLACE FUNCTION calculate_total_quantity RETURN NUMBER AS
    total_quantity NUMBER(7, 2);
BEGIN
    SELECT SUM(quantity) INTO total_quantity FROM Supply;
    RETURN total_quantity;
END calculate_total_quantity;
/

--Calling the function(dummy code)
DECLARE
    v_total_quantity NUMBER;
BEGIN
    -- Call the function
    v_total_quantity := calculate_total_quantity();

    DBMS_OUTPUT.PUT_LINE('Total Quantity: ' || v_total_quantity);
END;
/



--Creating a trigger to automatically update the stock of the Plants when an order quantity is updated

CREATE OR REPLACE TRIGGER update_stock
AFTER UPDATE ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Plants SET stock = stock - :NEW.quantity WHERE plantID = :NEW.plantID;
END update_stock;
/
  

--Dummy code for demonstration of trigger effect
DECLARE
    v_quantity NUMBER;
BEGIN
    v_quantity := 10; 

    -- Insert a record into OrderDetails
    UPDATE OrderDetails SET quantity=v_quantity WHERE plantID=4;
    COMMIT;
END;
/


