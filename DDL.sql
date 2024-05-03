-- creating database tables

Create table Plants (
    plantID number(20) unique not null,
    plantName varchar(50) not null,
    plantType varchar(50),
    price number(5,2),
    stock number(20) not null,
    primary key(plantID)
);

Create table Customers (
    customerID number(20) unique not null,
    firstName varchar(50) not null,
    lastName varchar(50) not null,
    email varchar(50) unique not null,
    phone number(20) unique not null,
    primary key(customerID)
);

Create table Orders(
     orderID number(20) unique not null,
     customerID number(20) not null,
     orderDate date not null,
     primary key(orderID),
     foreign key(customerID) references Customers(customerID)\
     on delete cascade
);   
 
Create table OrderDetails (
     orderDetailID number(20) unique not null,
     orderID number(20) unique not null,
     plantID number(20) not null,
     quantity number(20),
     primary key(orderDetailID),
     foreign key(orderID) references Orders(orderID) on delete cascade,
     foreign key(plantID) references Plants(plantID) on delete cascade
);

Create table Suppliers (
     supplierID number(20) unique not null,
     supplierName varchar(50) not null,
     contactName varchar(50) unique not null,
     email varchar(50) unique not null,
     phone number(20) unique not null,
     primary key(supplierID)
);

Create table Supply(
     supplyID number(20) unique not null,
     plantID  number(20)  not null,
     supplierID number(20) not null,
     supplyDate date not null,
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






