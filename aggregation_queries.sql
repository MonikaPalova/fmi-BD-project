use fitness 
go


select clients.id
from clients join purchases on clients.id=purchases.clientid
group by clients.id
having count(placedate)>5

select clients.id
from clients join purchases on clients.id=purchases.clientid
group by clients.id
having max(purchases.price)>(select avg(price) from purchases)

select duration,count(*)
from subscriptions join subscriptiontypes on subscriptions.typeid=SUBSCRIPTIONTYPES.id
group by duration

select sum(price)
from purchases

select sum(price)
from invoices

select count(*)
from subscriptions join subscriptiontypes on subscriptions.typeid=SUBSCRIPTIONTYPES.id
where EXPIRATIONDATE>Convert(date, getdate())

select *
from products
where quantity = (select min(quantity) from products)

select *
from products
where quantity > (select avg(quantity) from products)

select employees.id,salary+bonussalary as total_salary
from employees join employeetypes on employees.employeetypeid=employeetypes.id
where salary+bonussalary>(select avg(salary+bonussalary)
						  from employees join employeetypes on employees.employeetypeid=employeetypes.id)


select clientid,name, avg(price) as avg_money
from purchases join clients on clients.id = purchases.clientid
group by clientid,name
