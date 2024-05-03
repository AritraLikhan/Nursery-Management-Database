-- creating database tables

Create table Plants (
    plantID number(20),
    plantName varchar(50),
    plantType varchar(50),
    price number(5,2),
    stock number(20),
    primary key(plantID)
);

Create table Customers (
    customerID number(20),
    firstName varchar(50),
    lastName varchar(50),
    email varchar(50),
    phone number(20),
    primary key(customerID)
);

Create table Orders(
     orderID number(20),
     customerID number(20),
     orderDate date,
     primary key(orderID),
     foreign key(customerID) references Customers(customerID)\
     on delete cascade
);   
 
Create table OrderDetails (
     orderDetailID number(20),
     orderID number(20),
     plantID number(20),
     quantity number(20),
     primary key(orderDetailID),
     foreign key(orderID) references Orders(orderID) on delete cascade,
     foreign key(plantID) references Plants(plantID) on delete cascade
);

Create table Suppliers (
     supplierID number(20),
     supplierName varchar(50),
     contactName varchar(50),
     email varchar(50),
     phone number(20),
     primary key(supplierID)
);

Create table Supply(
     supplyID number(20),
     plantID  number(20),
     supplierID number(20),
     supplyDate date,
     quantity number(20),
     primary key(supplyID),
     foreign key(plantID) references Plants(plantID) on delete cascade,
     foreign key(supplierID) references Suppliers(supplierID) on delete cascade
);

--altering some tables

--adding a new column named address to the Customers table
ALTER TABLE Customers ADD (address VARCHAR(100));

--modifying the price column in the Plants table to increase its precision
ALTER TABLE Plants MODIFY (price NUMBER(10,3));

--removing the phone column from the Suppliers table
ALTER TABLE Suppliers DROP COLUMN phone;

--renaming the OrderDetails table to Order_Items
ALTER TABLE OrderDetails RENAME TO Order_Items;






