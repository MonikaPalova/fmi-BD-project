use fitness
go

-------------------views-----------------------

create view monthly_subscribed_clients
as
select subscriptions.clientid, clients.name, clients.phonenumber
from subscriptions, clients
where subscriptions.clientid=clients.id and subscriptions.typeid in (select id from subscriptiontypes where duration=30);

create view instructors_info
as
select employees.id, employees.name, employees.phonenumber, employees.workinghours
from employees,employeetypes
where employeetypeid=employeetypes.id and employeetypes.name = 'Instructor';


create view products_needing_restock
as
select ID, name, quantity 
from PRODUCTS
where QUANTITY<10;


create view expired_subscriptions
as
select clientid,TYPEid,expirationdate
from SUBSCRIPTIONS
where EXPIRATIONDATE<GETDATE();

create view loyal_clients
as
select id,name,phonenumber,discountonbar
from CLIENTS
where DISCOUNTONBAR>0;

-------------------------indexes-------------------------

create index idx_clients_info
on clients(id,phonenumber);

create unique index idx_subscription_types
on subscriptiontypes(name);

create index idx_employees
on employees(id,employeetypeid);

create index idx_employeetypes
on employeetypes(name);

