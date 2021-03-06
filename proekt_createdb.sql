CREATE DATABASE fitness
GO
USE fitness
GO


----- Create Tables -----

CREATE TABLE PRODUCTS (
 ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 NAME VARCHAR(64) NOT NULL,
 DESCRIPTION VARCHAR(MAX),
 PRICE FLOAT NOT NULL,
 QUANTITY INT,
 EXPIRYDATE DATE
);

CREATE TABLE CLIENTS (
 ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 NAME VARCHAR(MAX) NOT NULL,
 EMAIL VARCHAR(64),
 PHONENUMBER VARCHAR(16),
 TOTALPURCHASEVALUE FLOAT DEFAULT 0,
 DISCOUNTONBAR FLOAT DEFAULT 0
);

DROP TABLE PURCHASES

CREATE TABLE PURCHASES (
 ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 PRODUCTID INT NOT NULL,
 CLIENTID INT NOT NULL,
 QUANTITY int DEFAULT 1,
 PRICE FLOAT DEFAULT 0,
 PLACEDATE DATETIME DEFAULT GETDATE()
);



CREATE TABLE SUBSCRIPTIONTYPES (
 ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 NAME VARCHAR(64) NOT NULL,
 PRICE FLOAT NOT NULL,
 DURATION INT,
 
);

CREATE TABLE SUBSCRIPTIONS (
 ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 TYPEID INT NOT NULL,
 CLIENTID INT NOT NULL,
 INSTRUCTORID INT,
 EXPIRATIONDATE DATETIME not null
);

CREATE TABLE EMPLOYEES (
 ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 NAME VARCHAR(MAX) NOT NULL,
 EMAIL VARCHAR(64),
 PHONENUMBER VARCHAR(16),
 ADDRESS VARCHAR(255),
 EMPLOYEETYPEID INT NOT NULL,
 HIREDATE DATETIME DEFAULT GETDATE(),
 WORKINGHOURS INT DEFAULT 8,
 BONUSSALARY FLOAT DEFAULT 0 
);


CREATE TABLE EMPLOYEETYPES (
 ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 NAME VARCHAR(32) NOT NULL,
 SALARY FLOAT NOT NULL 
);

create table invoices(
 id int not null identity(1,1) primary key,
 productid int not null,
 supplier VARCHAR(64) not null,
 quantity int not null,
 price float not null default 0
);

------Constraints-----
Alter table invoices
add constraint invoices_productid_fk foreign key(productid) references products(id)
Alter table employees
add constraint employees_typeid_fk foreign key(employeetypeid) references employeetypes(id);

Alter table purchases
add constraint purchases_clientid_fk foreign key(clientid) references clients(id);

Alter table purchases
add constraint purchases_productid_fk foreign key(productid) references products(id);

Alter table subscriptions
add constraint subs_clientid_fk foreign key(clientid) references clients(id);

Alter table subscriptions
add constraint subs_instructorid_fk foreign key(instructorid) references employees(id);

Alter table subscriptions
add constraint subs_typeid_fk foreign key(typeid) references subscriptiontypes(id);

ALTER TABLE products
ADD CONSTRAINT products_positive_quantity CHECK (quantity>0)

ALTER TABLE INVOICES
ADD CONSTRAINT invoices_positive_quantity CHECK (quantity>0)

------------Fill tables -------------------------

USE fitness

INSERT INTO PRODUCTS (NAME, DESCRIPTION, PRICE, QUANTITY, EXPIRYDATE)
  VALUES ('SAN Performance Glutamine 600gr', 'Excellent choice for everyone' , 54.00, 10, '2021/3/3');

INSERT INTO PRODUCTS (NAME, DESCRIPTION, PRICE, QUANTITY, EXPIRYDATE)
  VALUES ('OPTIMUM NUTRITION Essential Amino Energy 558', NULL, 36.00, 16, '2021/8/3');

INSERT INTO PRODUCTS (NAME, DESCRIPTION, PRICE, QUANTITY, EXPIRYDATE)
  VALUES ('YAMAMOTO NUTRITION Amino 120pcs', 'Tablets', 52.80, 30, '2022/1/22');

INSERT INTO PRODUCTS (NAME, DESCRIPTION, PRICE, QUANTITY, EXPIRYDATE)
  VALUES ('Protein Cookie 75gr', NULL, 3.97, 100, '2020/10/15');

INSERT INTO PRODUCTS (NAME, DESCRIPTION, PRICE, QUANTITY, EXPIRYDATE)
  VALUES ('Bezzo protein bar 80gr', 'Choco flavour', 2.40, 70, '2021/2/1');

INSERT INTO PRODUCTS (NAME, DESCRIPTION, PRICE, QUANTITY, EXPIRYDATE)
  VALUES ('ANIMAL Animal Rage 44pack', NULL, 69.00, 7, '2023/1/3');

INSERT INTO PRODUCTS (NAME, DESCRIPTION, PRICE, QUANTITY, EXPIRYDATE)
  VALUES ('Protein shake', NULL, 69.00, 7, '2020/5/13');

INSERT INTO PRODUCTS (NAME,DESCRIPTION,PRICE,QUANTITY,EXPIRYDATE)
  VALUES ('Myprotein Impact Whey','A whey protein - chocolate brownie',34.00,15,'2024/1/1');

INSERT INTO PRODUCTS (NAME, DESCRIPTION, PRICE, QUANTITY, EXPIRYDATE)
  VALUES ('Pure nutrition - hydro 100', NULL, 72.00, 10, '2021/4/3');

INSERT INTO PRODUCTS (NAME, DESCRIPTION, PRICE, QUANTITY, EXPIRYDATE)
  VALUES ('SAN Performance Creatine 600gr', 'For muscle power and energy', 61.00, 7, '2021/3/10');

INSERT INTO PRODUCTS (NAME,DESCRIPTION,PRICE,QUANTITY,EXPIRYDATE)
  VALUES ('Xcore Hydro Fusion 1kg','Rich on vitamins',66.00,5,'2023/1/1');




INSERT INTO CLIENTS VALUES ('Georgi Georgiev', DEFAULT, '0817263612', DEFAULT, DEFAULT);

INSERT INTO CLIENTS VALUES ('Spas Naidenov', 'spas@abv.bg', '0815267612', DEFAULT, DEFAULT);

INSERT INTO CLIENTS VALUES ('Razvigor Stoyanov', 'rasto@mail.bg', '0873563612', DEFAULT, DEFAULT);

INSERT INTO CLIENTS VALUES ('Nataliya Simeonova', DEFAULT, '0817266612', DEFAULT, DEFAULT);

INSERT INTO CLIENTS VALUES ('Dimitar Popstoykov', DEFAULT, '0817526312', DEFAULT, 10);

INSERT INTO CLIENTS VALUES ('Gergana Marinova', 'geritO@gmail.com', '0803863612', DEFAULT, DEFAULT);

INSERT INTO CLIENTS VALUES ('Stoyanka Stoeva', DEFAULT, '0817263513', DEFAULT, DEFAULT);

INSERT INTO CLIENTS VALUES ('Angel Manahilov', 'achomustacho@gmail.com', '0817251612', DEFAULT, 7.5);






INSERT INTO PURCHASES(PRODUCTID,CLIENTID,QUANTITY,PRICE,PLACEDATE) VALUES (1, 2, 7, DEFAULT,DEFAULT);

INSERT INTO PURCHASES VALUES (1, 4, 2, DEFAULT);

INSERT INTO PURCHASES VALUES (5, 1, 3, DEFAULT);

INSERT INTO PURCHASES VALUES (3, 3, 3, DEFAULT);

INSERT INTO PURCHASES VALUES (2, 7, 5, DEFAULT);

INSERT INTO PURCHASES VALUES (4, 2, 1, DEFAULT);

INSERT INTO PURCHASES VALUES (5, 8, 4, DEFAULT);





INSERT INTO SUBSCRIPTIONTYPES VALUES ('Daily', 4.50, 1);

INSERT INTO SUBSCRIPTIONTYPES VALUES ('Weekly', 10, 7);

INSERT INTO SUBSCRIPTIONTYPES VALUES ('Monthly', 30, 30);

INSERT INTO SUBSCRIPTIONTYPES VALUES ('Yearly', 350.00, 365);

INSERT INTO SUBSCRIPTIONTYPES VALUES ('Daily(with instructor)',8,1)

INSERT INTO SUBSCRIPTIONTYPES VALUES ('Weekly(with instructor)',20,7)

INSERT INTO SUBSCRIPTIONTYPES VALUES ('Monthly(with instructor)',50.00,30)

INSERT INTO SUBSCRIPTIONTYPES VALUES ('Yearly(with instructor)',500,365)



INSERT INTO EMPLOYEETYPES VALUES ('Manager', 8.50);

INSERT INTO EMPLOYEETYPES VALUES ('Instructor', 6.50);

INSERT INTO EMPLOYEETYPES VALUES ('Janitor', 4.00);

INSERT INTO EMPLOYEETYPES VALUES ('Equipment support', 7.00);

INSERT INTO EMPLOYEETYPES VALUES ('Bartender', 5.00)




INSERT INTO EMPLOYEES VALUES ('Kiril Mutafchiev', 'kimut@gmail.com', '0861253713', 'Troyan, "Iglika" 8', 1, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO EMPLOYEES VALUES ('Samuil Krumov', 'samuil@abv.bg', '0861258922', 'Karnobat, "Plodorodie" 13', 2, DEFAULT, 6, DEFAULT);

INSERT INTO EMPLOYEES VALUES ('Asen Momchilov', DEFAULT, '0834292649', 'Sliven', 3, DEFAULT, 4, DEFAULT);

INSERT INTO EMPLOYEES VALUES ('Ivan Milev', 'vanko82@gmail.com', '0861926493', 'Krichim, "Bor" 5', 2, DEFAULT, 6, DEFAULT);

INSERT INTO EMPLOYEES VALUES ('Momchil Zapryanov', DEFAULT, '0861925481', 'Blagoevgrad, "Vazrajdane" 52', 4, DEFAULT, 4, DEFAULT);

INSERT INTO EMPLOYEES VALUES ('Penka Zikatanova', DEFAULT, '0873122121', 'Studentski grad 22B', 5, DEFAULT, 8, DEFAULT);




INSERT INTO SUBSCRIPTIONS VALUES (2, 1, DEFAULT, '2020/05/10');

INSERT INTO SUBSCRIPTIONS VALUES (1, 2, DEFAULT, '2021/05/7');

INSERT INTO SUBSCRIPTIONS VALUES (3, 3, DEFAULT, '2020/05/10');

INSERT INTO SUBSCRIPTIONS VALUES (3, 7, DEFAULT, '2020/05/10');

INSERT INTO SUBSCRIPTIONS VALUES (1, 5, DEFAULT, '2020/05/10');

INSERT INTO SUBSCRIPTIONS VALUES (4, 4, DEFAULT, '2020/05/10');

INSERT INTO SUBSCRIPTIONS VALUES (3, 4, DEFAULT,'2020/05/7');

INSERT INTO SUBSCRIPTIONS VALUES (3, 2, 5,'2020/08/7');

INSERT INTO SUBSCRIPTIONS VALUES (8, 2, 2, '2021/1/10')

INSERT INTO SUBSCRIPTIONS VALUES (6, 3, 2, '2020/10/10')


insert into invoices(productid,supplier,quantity) values(1,'ReadyForLife',30)
insert into invoices(productid,supplier,quantity) values(11,'ReadyForLife',15)
insert into invoices(productid,supplier,quantity) values(10,'ReadyForLife',20)
insert into invoices(productid,supplier,quantity) values(9,'ReadyForLife',10)
insert into invoices(productid,supplier,quantity) values(5,'MyHealth',100)
insert into invoices(productid,supplier,quantity) values(11,'MyHealth',80)
insert into invoices(productid,supplier,quantity) values(3,'FitneaHrani',20)
insert into invoices(productid,supplier,quantity) values(2,'FitnesHrani',28)