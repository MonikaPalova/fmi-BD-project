USE fitness
GO

Select * from PRODUCTS;

Select * from CLIENTS;

select * from PURCHASES;

select * from SUBSCRIPTIONTYPES;

select * from SUBSCRIPTIONS;

select * from EMPLOYEETYPES;

select * from EMPLOYEES;


Select * 
from EMPLOYEES
where EMAIL is null;

select ID, name, EXPIRYDATE
from PRODUCTS 
where DATEADD(DAY,-10,EXPIRYDATE)<=GETDATE();

select ID, name, quantity 
from PRODUCTS
where QUANTITY<20;

select CLIENTS.NAME as client_name,CLIENTS.PHONENUMBER as client_phone_number, TYPEid as subscription_type, EXPIRATIONDATE as expiration_date
from SUBSCRIPTIONS, CLIENTS
where CLIENTID=CLIENTS.ID and (typeid=3 or TYPEID=2) and DATEADD(DAY,-5,EXPIRATIONDATE)<=GETDATE();

(select id
from employees
where workinghours = 4)
intersect
(select instructorid
from subscriptions
where expirationdate>getdate());

select id,name,totalpurchasevalue
from CLIENTS
where DISCOUNTONBAR>0;

select EMPLOYEES.ID,EMPLOYEES.NAME,EMPLOYEETYPES.SALARY,EMPLOYEES.WORKINGHOURS
from EMPLOYEES,EMPLOYEETYPES
where EMPLOYEES.EMPLOYEETYPEID=EMPLOYEETYPES.ID and EMPLOYEES.BONUSSALARY=0
order by salary;

select ID,name
from CLIENTS
where TOTALPURCHASEVALUE>1000 and DISCOUNTONBAR=0;

select * 
from PURCHASES
where CLIENTID=3;

select *
from invoices
where price>2000;

select *
from SUBSCRIPTIONTYPES
where DURATION>7;
