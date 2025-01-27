use Northwind
--hometask
--task1
select * from Shippers
--task2
select categoryname, description from Categories
--task3
select firstname +''+lastname, hiredate from Employees
where title = 'sales representative'
--task4
select firstname +''+lastname, hiredate from Employees
where title = 'sales representative' and Country='usa'
--task5
select * from Orders
where EmployeeID=5
--task6
select supplierid, contactname, contacttitle from Suppliers
where ContactTitle <> 'marketing manager'
--task7
select productid, productname from Products
where ProductName like '%queso%'
--task8
select orderid, customerid, shipcountry from Orders
where ShipCountry in ('france', 'belgium')
--task9
select * from Orders
where ShipCountry in ('brazil','mexico','argentina', 'venezuela')
--task10
select firstname, lastname, title, birthdate from Employees
order by birthdate 
--task11
select firstname, lastname, title, cast(birthdate as date) from Employees
order by birthdate 
--task12
select FirstName, lastname, firstname+' '+lastname fullname from Employees 
--task13
select orderid, productid, unitprice, quantity, unitprice*quantity totalprice from OrderDetails
order by OrderID, ProductID
--task14
select count(*) totalcustomers from Customers
--task15
select min(OrderDate) firstorder from Orders
--task16
select distinct Country customers_from from Customers
--select country from Customers
--group by country
--task17
select contacttitle, count(ContactTitle) from Customers
group by ContactTitle
--task18
select * from Suppliers
select productid, productname, companyname from Products p
join Suppliers s on p.SupplierID=s.SupplierID
--task19
select orderid, cast(orderdate as date), companyname from Orders o
join Shippers s on s.ShipperID=o.ShipVia and OrderID<10300
--task20
select CategoryName, count(*) from Products p
join Categories c on c.CategoryID=p.CategoryID
group by CategoryName
--task21
select distinct country, city, count(CustomerID) totalcustomer from Customers
group by country, city
--task22
select productid, ProductName, UnitsInStock, ReorderLevel from Products
where UnitsInStock<ReorderLevel
order by ProductID
--task23
select ProductID, ProductName, UnitsInStock, UnitsOnOrder, reorderlevel, Discontinued from Products
where UnitsInStock+UnitsOnOrder<=ReorderLevel
and Discontinued=0
--task24
select CustomerID, CompanyName, Region from Customers
order by case when region is null then 1 else 0 end,
region, CustomerID
--task25
select top 3 with ties shipcountry, avgfreight from 
(select shipcountry, avg(Freight) avgfreight from orders 
group by ShipCountry) a
order by avgfreight desc
--task26
select top 3 with ties shipcountry, avgfreight from 
(select shipcountry, avg(Freight) avgfreight from orders 
where year(orderdate)=2015
group by ShipCountry) a
order by avgfreight desc
--task27

--task28
select top 3 with ties shipcountry, avgfreight from 
(select shipcountry, avg(Freight) avgfreight from orders 
where orderdate >= (select dateadd(yy, -1,(select max(OrderDate)from Orders)))
group by ShipCountry) a
order by avgfreight desc
--task29
select * from Employees
select * from Orders
select * from Products
select * from OrderDetails

select e.EmployeeID, lastname, o.OrderID, productname, quantity from Employees e
join orders o on e.EmployeeID=o.EmployeeID
join OrderDetails od on o.OrderID=od.OrderID
join products p on p.ProductID=od.ProductID
--task30
select * from Customers c
left join Orders o on o.CustomerID=c.CustomerID
where OrderID is null
--task31
select c.CustomerID, EmployeeID from Orders o
right join Customers c on o.CustomerID=c.CustomerID and EmployeeID=4
where EmployeeID is null
order by CustomerID