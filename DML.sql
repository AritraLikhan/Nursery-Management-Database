--Inserting data in database tables

INSERT INTO Plants VALUES (1, 'Rose', 'Flower', 10.00, 100);
INSERT INTO Plants VALUES (2, 'Tulip', 'Flower', 8.00, 200);
INSERT INTO Plants VALUES (3, 'Oak', 'Tree', 50.00, 50);
INSERT INTO Plants VALUES (4, 'Maple', 'Tree', 60.00, 40);
INSERT INTO Plants VALUES (5, 'Basil', 'Herb', 5.00, 300);
INSERT INTO Plants VALUES (6, 'Mint', 'Herb', 4.00, 400);
INSERT INTO Plants VALUES (7, 'Cactus', 'Succulent', 15.00, 150);
INSERT INTO Plants VALUES (8, 'Aloe Vera', 'Succulent', 12.00, 180);
INSERT INTO Plants VALUES (9, 'Orchid', 'Flower', 20.00, 120);
INSERT INTO Plants VALUES (10, 'Lily', 'Flower', 18.00, 130);

INSERT INTO Customers VALUES (1, 'Atif', 'Aslam', 'atif@gmail.com', 01514615949);
INSERT INTO Customers VALUES (2, 'Niharika', 'Dey', 'dey@gmail.com', 01210690150);
INSERT INTO Customers VALUES (3, 'Emon', 'Hasan', 'emon@gmail.com', 01736446000);
INSERT INTO Customers VALUES (4, 'Imran', 'Hossain', 'imran@gmail.com', 01700220094);
INSERT INTO Customers VALUES (5, 'Ariful', 'Islam', 'arif@gmail.com', 01332957887);
INSERT INTO Customers VALUES (6, 'Tasfia', 'Samiha', 'samiha@gmail.com', 01148118265);
INSERT INTO Customers VALUES (7, 'Jisan', 'Islam', 'jisan@gmail.com', 01184660671);
INSERT INTO Customers VALUES (8, 'Ashraf', 'Nirob', 'nirob@gmail.com', 01497078783);
INSERT INTO Customers VALUES (9, 'Rahi', 'Islam', 'rahi@gmail.com', 01975256817);
INSERT INTO Customers VALUES (10, 'Nila', 'Roy', 'nila@gmail.com', 01541786924);

INSERT INTO Orders VALUES (1, 3, TO_DATE('2024-05-01', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES (2, 10, TO_DATE('2024-05-02', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES (3, 4, TO_DATE('2024-05-03', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES (4, 5, TO_DATE('2024-05-04', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES (5, 9, TO_DATE('2024-05-05', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES (6, 1, TO_DATE('2024-05-06', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES (7, 8, TO_DATE('2024-05-07', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES (8, 2, TO_DATE('2024-05-08', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES (9, 6, TO_DATE('2024-05-09', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES (10, 7, TO_DATE('2024-05-10', 'YYYY-MM-DD'));

INSERT INTO OrderDetails VALUES (1, 1, 4, 2);
INSERT INTO OrderDetails VALUES (2, 2, 7, 3);
INSERT INTO OrderDetails VALUES (3, 3, 1, 1);
INSERT INTO OrderDetails VALUES (4, 4, 2, 2);
INSERT INTO OrderDetails VALUES (5, 5, 10, 3);
INSERT INTO OrderDetails VALUES (6, 6, 6, 1);
INSERT INTO OrderDetails VALUES (7, 7, 3, 2);
INSERT INTO OrderDetails VALUES (8, 8, 9, 3);
INSERT INTO OrderDetails VALUES (9, 9, 5, 1);
INSERT INTO OrderDetails VALUES (10, 10, 8, 2);

INSERT INTO Suppliers VALUES (1, 'Green Thumb', 'Hasan', 'hasan@greenthumb.com', 01542696778);
INSERT INTO Suppliers VALUES (2, 'Plant Lovers', 'Joy', 'joy@plantlovers.com', 01207077958);
INSERT INTO Suppliers VALUES (3, 'Nature Nurture', 'Anika', 'anika@naturenurture.com', 01196809250
);
INSERT INTO Suppliers VALUES (4, 'Bloom Buddy', 'Murata', 'murata@bloombuddy.com', 01716744776);
INSERT INTO Suppliers VALUES (5, 'Flora Friends', 'Sakib', 'sakib@florafriends.com', 01505223315
);
INSERT INTO Suppliers VALUES (6, 'Leafy Love', 'Meftaul', 'meftaul@leafylove.com', 01302670480);
INSERT INTO Suppliers VALUES (7, 'Blossom Buddy', 'Abir', 'abir@blossombuddy.com', 01113727686
);
INSERT INTO Suppliers VALUES (8, 'Garden Gurus', 'Eren', 'eren@gardengurus.com', 01407832948
);
INSERT INTO Suppliers VALUES (9, 'Plant Pals', 'Faysal', 'faysal@plantpals.com', 01570479877);
INSERT INTO Suppliers VALUES (10, 'Green Growers', 'Mahmud', 'mahmudf@greengrowers.com', 01184130690);

INSERT INTO Supply VALUES (1, 1, 1, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 100);
INSERT INTO Supply VALUES (2, 2, 2, TO_DATE('2024-05-02', 'YYYY-MM-DD'), 55);
INSERT INTO Supply VALUES (3, 3, 3, TO_DATE('2024-05-03', 'YYYY-MM-DD'), 83);
INSERT INTO Supply VALUES (4, 4, 4, TO_DATE('2024-05-04', 'YYYY-MM-DD'), 130);
INSERT INTO Supply VALUES (5, 5, 5, TO_DATE('2024-05-05', 'YYYY-MM-DD'), 220);
INSERT INTO Supply VALUES (6, 6, 6, TO_DATE('2024-05-06', 'YYYY-MM-DD'), 47);
INSERT INTO Supply VALUES (7, 7, 7, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 115);
INSERT INTO Supply VALUES (8, 8, 8, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 50);
INSERT INTO Supply VALUES (9, 9, 9, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 130);
INSERT INTO Supply VALUES (10, 10, 10, TO_DATE('2024-05-10', 'YYYY-MM-DD'), 170);

--displaying table data using select command

--Supply info of supplies greater than 100
select * from Supply where quantity > 100;

--updating the data in table

--changing phone number with a specified supplierID
UPDATE Suppliers SET phone = 1278789921 WHERE supplierID = 4;

UPDATE Suppliers SET phone = 1966013883 WHERE supplierID = 7;

--deleting row from table

--deleting order with a specified customerID
DELETE FROM Orders WHERE orderID IN ( SELECT orderID FROM Orders WHERE customerID = 2);

--union

--finding name of the customers that starts with 'A' in the firstName or has 'i' in the lastName
SELECT firstName FROM Customers WHERE firstName LIKE 'A%' UNION SELECT lastName FROM Customers WHERE lastName LIKE '%i%'; 

--intersect

--finding name of the customers that starts with 'A' and has an 'i' in the firstName
SELECT firstName from Customers where firstName like 'A%' intersect select firstName from Customers where firstName like '%i%';

--with clause

--finding info of the orders with the highest quantity using with clause
WITH maximum AS (SELECT MAX(quantity) AS max_quantity FROM OrderDetails) SELECT max_quantity FROM maximum;


--sum: aggregate function

--finding the total quantity of all supplies in the nursery
SELECT SUM(quantity) FROM Supply;

--max: aggregate function

--finding the price of the most expensive plant in the nursery
SELECT MAX(price) FROM Plants;

--min: aggregate function

--finding the price of the cheapest plant in the nursery
SELECT MIN(price) FROM Plants;

--avg: aggregate function

--finding the average price of plants
select avg(price) from Plants;

--count: aggregate function

--finding the number different types of plants available
SELECT COUNT(DISTINCT plantType) FROM Plants;

--group by

--finding the total quantity of each type of plant in the nursery
SELECT plantType, SUM(stock) FROM Plants GROUP BY plantType;

--having

--finding types of plants have a total quantity in stock greater than 100
SELECT plantType, SUM(stock) FROM Plants GROUP BY plantType HAVING SUM(stock) > 150;

--join

--finding the orderID, orderDate, and firstName of the customer for each order in the Orders and Customers tables
SELECT Orders.orderID, Orders.orderDate, Customers.firstName FROM Orders JOIN Customers ON Orders.customerID = Customers.customerID;

--natural join

--finding all the details from the OrderDetails and Plants tables for each order detail
SELECT * FROM OrderDetails NATURAL JOIN Plants;

--set membership(and,or,not)

--finding supplies that include either the plant with supplierID=1 or the plant with supplierID=4
SELECT supplyID FROM Supply WHERE  supplierID = 1 OR  supplierID = 4;


--finding customers that have not ordered the plant with a specific plantID
SELECT firstName, lastName FROM Customers WHERE customerID NOT IN (SELECT customerID FROM Orders WHERE orderID IN (SELECT orderID FROM OrderDetails WHERE plantID = 6));





