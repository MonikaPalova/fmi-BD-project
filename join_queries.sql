use fitness 
go



select * from employeetypes
select * from EMPLOYEES
select * from subscriptions
select * from subscriptiontypes
select * from clients
select * from products
select * from purchases
select * from invoices



 
 --- 5 joins
select  (workinghours * salary) as daily_payment
from employees join employeetypes on employees.id = employeetypes.id

select employees.name,employeetypes.name as position,employees.phonenumber
from employees join employeetypes on employees.id = employeetypes.id
where email is null

select clients.name,clients.PHONENUMBER
from subscriptions join subscriptiontypes on subscriptions.id =  subscriptiontypes.id 
join clients on clients.id = subscriptions.clientid
where subscriptiontypes.name = 'Monthly' or subscriptiontypes.name = 'Yearly' 


select clients.name,clients.phonenumber,expirationdate,subscriptiontypes.name
from subscriptions join subscriptiontypes on subscriptions.id =  subscriptiontypes.id 
join clients on clients.id = subscriptions.clientid
where (DATEADD(month,-1,expirationdate) <= getdate() and subscriptiontypes.name = 'yearly') or( DATEADD(week,-1,expirationdate) <= getdate() and subscriptiontypes.name = 'monthly')

select name,products.price,products.quantity
from invoices join products on invoices.productid = products.id
where supplier = 'MyHealth'

