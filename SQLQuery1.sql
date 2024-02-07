create database practical;
use practical

create table customers (
CID int primary key,
FName varchar(255),
LName varchar (255),
email varchar (255),
PhoneNum int
);



create table orders (
OID int primary key,
CID int,
orderDate date,
Tamount varchar (255),
FOREIGN KEY (CID) REFERENCES customers(CID)
);

create table OrdersDetails (
ODID int primary key,
OID int,
PID int,
quantity int,
UnitPrice varchar (255),
FOREIGN KEY (OID) REFERENCES orders(OID),
FOREIGN KEY (PID) REFERENCES products(PID)
);

drop table products;

create table products( 
PID int primary key,
ProductName varchar(255),
unitprice varchar (255),
instockquantity varchar (255)
);


INSERT INTO customers (CID,FName, LName, email, PhoneNum )
VALUES
    (1, 'John', 'Doe','doe@gmail.com',015484 ),
    (2, 'Jane', 'Smith','jane@gmail.com',048945212 ),
    (3,'Mike', 'Johnson','mike@gmail.com',0487754 ),
    (4, 'Emily', 'Williams','emily@gmail.com',05421540),
    (5, 'David', 'Brown','brown@gmail.com',032421 ),
    (6, 'Sarah', 'Miller', 'miller@gmail.com',0451219),
    (7, 'Chris', 'Wilson','chirs@gmail.com',03545121),
    (8, 'Anna', 'Jones', 'anna@gmail.com',05454121),
    (9, 'Brian', 'Taylor', 'brian@gmail.com',0345421),
    (10, 'Laura', 'Anderson','laura@gmail.com',054212159);

	select * from customers;
	
INSERT INTO orders (OID, CID, orderdate, Tamount)
VALUES(3,1,'2022-1-11',400),(4,4,'2002-3-2',8900),(5,5,'2220-4-3',2800),
(6,6,'2220-6-7',4300),(7,7,'2220-5-3',3400),(8,8,'2220-3-2',9500),(9,9,'2220-7-3',2300),(10,10,'2052-9-3',5300);
select * from orders

INSERT INTO OrdersDetails (ODID, OID, PID ,quantity, unitprice)
values(1,1,1,1,'1'),(2,2,2,2,'12'),(3,3,3,21,'111'),(4,4,4,4,'4'),(5,5,5,5,'2'),
(6,6,6,6,'430'),(7,7,7,7,'400'),(8,8,8,8,'9'),(9,9,9,9,'300'),(10,10,10,10,'30');
select * from OrdersDetails;

INSERT INTO products (PID, ProductName, unitprice, instockquantity)
values(1,'lays','20','22'),(2,'cake','20','2'),(3,'bally','3','400'),(4,'paper','2','90'),(5,'dog','2','90'),
(6,'ball','1','11'),(7,'bat','3','11'),(8,'wicket','2','5'),(9,'shirt','3','3'),(10,'pant' ,'2','30');
select * from products;


--Question 1
create login order_clerk with password ='password';
 create user order_clerk for login order_clerk;
 grant insert,update on dbo.orders to order_clerk;

 --Question 2
	create trigger update_stock_audit on products
	for UPDATE
	as
	begin
	print'data insert'
	end

--Question 3
select FName,LName,orderdate,Tamount from customers as c inner join orders as o on c.CID=o.CID;


--Question 4
select count(Tamount), productname , quantity,Tamount from products as p inner join ordersdetails as o on p.PID=o.PID
inner join orders as oo on o.OID=oo.OID; 

--Question 5
create procedure OrderByCustomer
	@id varchar(255)
	as
	begin
	select * from customers where CID = @id;
	end

	exec OrderByCustomer @id = 3;

	--Question 6
	create view Summary as
	SELECT OID, CID, orderdate, Tamount 
from orders;
	select * from Summary;

	--Question 7
	create view Inventory as
	SELECT productname,instockquantity
from products;
	select * from Inventory;

	-- Question8	
	select FName,LName, OID, orderdate, Tamount from Summary as o inner join customers as c on o.CID=c.CID;