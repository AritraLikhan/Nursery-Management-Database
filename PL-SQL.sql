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
close dept_cursor;
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
    plant_price NUMBER(5, 2) := 10.0;
BEGIN
    IF plant_price < 5.0 THEN
        DBMS_OUTPUT.PUT_LINE('This plant is cheap.');
    ELSIF plant_price < 15.0 THEN
        DBMS_OUTPUT.PUT_LINE('This plant is moderately priced.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('This plant is expensive.');
    END IF;
END;
/
  

--creating a procedure to insert a new supply into the Supply table
  
CREATE OR REPLACE PROCEDURE insert_supply (
    p_SupplyID IN NUMBER,
    p_PlantID IN NUMBER,
    p_SupplierID IN NUMBER,
    p_SupplyDate IN DATE,
    p_Quantity IN NUMBER
) AS
BEGIN
    INSERT INTO Supply (supplyID, plantID, supplierID, supplyDate, quantity)
    VALUES (p_SupplyID, p_PlantID, p_SupplierID, p_SupplyDate, p_Quantity);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END insert_supply;


--Calculating the total price of all plants in the Plants table using function

CREATE OR REPLACE FUNCTION calculate_total_price RETURN NUMBER AS
    total_price NUMBER(7, 2);
BEGIN
    SELECT SUM(price) INTO total_price FROM Plants;
    RETURN total_price;
END calculate_total_price;


--Creating a trigger to automatically update the stock of the Plants when a new order is placed

CREATE OR REPLACE TRIGGER update_stock
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Plants SET stock = stock - :NEW.quantity WHERE plantID = :NEW.plantID;
END update_stock;


