--hometask
-- task1
use W3Resource
select * from inventory.Orders
select * from Inventory.Salesman
select ord_no, purch_amt, ord_date, customer_id, o.salesman_id from Inventory.Orders o
join Inventory.Salesman s on o.salesman_id=s.salesman_id and s.name='Nail Knite'
--task2
select * from Inventory.Orders o
join Inventory.Salesman s on o.salesman_id=s.salesman_id and s.city='london'
--task3
select distinct salesman_id from Inventory.Orders
where customer_id=3007
--task4
select * from Inventory.Orders
where purch_amt > (select avg(purch_amt) from Inventory.Orders
where ord_date = '2012-10-10')
--task5
select * from Inventory.Orders
where salesman_id in (select salesman_id from Inventory.Salesman
where city='new york')
--task6
select commission from Inventory.Salesman
where salesman_id in (select salesman_id from Inventory.Salesman
where city='paris')
--task7
select * from Inventory.Customer
where customer_id = (select salesman_id from Inventory.Salesman
where name='mc lyon')-2001
--task8
select grade, count(*) from Inventory.Customer
where grade> (select avg(grade) from inventory.Customer
where city='new york')
group by grade
--task9
select * from Inventory.Orders
where salesman_id in (select salesman_id from Inventory.Salesman
where commission=(select max(commission) from Inventory.Salesman))
--task10
select * from Inventory.Customer
where customer_id in (select customer_id from Inventory.Orders
where ord_date='2012-08-17')

select b.*, a.cust_name
from Inventory.Orders b, Inventory.Customer a
where a.customer_id=b.customer_id and b.ord_date='2012-08-17'
--task11
select distinct a.salesman_id, a.name from Inventory.Salesman a,
(select salesman_id, count(customer_id) as Noofclients from Inventory.Customer
group by salesman_id) b
where Noofclients>1 and a.salesman_id=b.salesman_id
--task12
select ord_no, purch_amt, ord_date, customer_id, salesman_id from Inventory.Orders
where purch_amt>(select avg(purch_amt) from Inventory.Orders)
--task13 (almost the same w 12)
--task14
select ord_date, sum(purch_amt) from Inventory.Orders
group by ord_date
having sum(purch_amt)-1000 >=all (select max(purch_amt) from Inventory.Orders
group by ord_date) 

select ord_date, sum(purch_amt) from Inventory.Orders o1
group by ord_date
having sum(purch_amt)>=(select 1000+max(purch_amt) from Inventory.Orders o2
where o1.ord_date=o2.ord_date)
--task15
select * from Inventory.Customer
where exists (select city from Inventory.Customer
where city='london')
--task16??
select * from (
select customer_id, salesman_id, count(customer_id) nofclients from Inventory.Customer c1
group by salesman_id) a
where a.nofclients>1 
--task17
select * from Inventory.Salesman
where salesman_id in (select salesman_id from Inventory.Customer
group by salesman_id
having count(*)=1)
--task18
select * from Inventory.Salesman
where salesman_id in 
(select salesman_id from Inventory.Orders
group by customer_id, salesman_id
having count(*)>=2)
--task19
use W3Resource
select s.salesman_id, c.customer_id, c.cust_name, c.city,
s.city from Inventory.Customer c
join Inventory.Salesman s on c.city=s.city
--select * from Inventory.Salesman

select * from Inventory.Salesman s
where city in (select distinct s1.city from Inventory.Customer c
join Inventory.Salesman s1 on c.city=s1.city)

select * from Inventory.Salesman
where city in (select city from Inventory.Customer)
--task20 the same w 19
--task21
select *
from (select customer_id, cust_name, c.salesman_id, name from Inventory.Customer c
join Inventory.Salesman s on s.salesman_id=c.salesman_id) a
where a.cust_name<a.name
--task22
select * from Inventory.Customer c1
where exists (select * from Inventory.Customer c2
where c1.grade>c2.grade and c2.cust_name<'new york')
--task23
select * from Inventory.Orders
where purch_amt > any (select purch_amt from Inventory.Orders
where ord_date='2012-09-10')
--task24
select * from Inventory.Orders o
where o.purch_amt< (select sum(purch_amt) from Inventory.Orders o
join Inventory.Customer c on c.customer_id=o.customer_id and city='london'
group by city)

select * from Inventory.Orders o
where o.purch_amt<any(select purch_amt from Inventory.Orders o1, 
Inventory.Customer c
where city='london' and c.customer_id=o1.customer_id) 
--task25