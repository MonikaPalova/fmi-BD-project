use fitness
go

select name,phonenumber
from employees
where id in (select instructorid
			 from subscriptions)

select *
from products
where datediff(Day, Convert(date, getdate()),expirydate )<10 
	and 
	  id not in (select productid from purchases where datediff(Day, Convert(date, getdate()),placedate )<30)

select name,phonenumber
from clients
where id in (select clientid 
			 from subscriptions join subscriptiontypes on subscriptions.typeid=SUBSCRIPTIONTYPES.id
			 where name!='Daily' and datediff(Day, Convert(date, getdate()),expirationdate)<3)

select supplier
from invoices
where productid in (select products.id
					from products
					where quantity<5)

select productid
from purchases
where clientid in (select clients.id
					from clients join (subscriptions join subscriptiontypes on subscriptions.typeid=SUBSCRIPTIONTYPES.id) on clients.id=subscriptions.id
					where subscriptiontypes.name='Yearly')