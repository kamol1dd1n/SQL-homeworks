

--Hometask
--Return people who get the 2nd highest salaries in each departments

/*
dep_id in employee.employees
dep_id in employee.departments

employee.employees.dep_id = employee.departments.dep_id

e.dep_id = e1.dep_id


select * from employee.employees e
where salary in (select max(salary) from employee.employees where e.dep_id = dep_id group by dep_id)

select * from employee.employees
where salary = (select distinct salary from employee.employees 
order by salary desc 
offset 1 row fetch next 1 row only)

--second highest salary
select * from Employee.employees e
where salary = (select max(salary) from employee.employees where salary < (select max(salary) from employee.employees) 
and dep_id = 1001 or dep_id=2001 and dep_id=3001)

select * from Employee.employees e
where salary = (select max(salary) from employee.employees where salary < (select max(salary) from employee.employees)) and e.dep_id=dep_id
group by dep_id
*/
--hometask1
--second highest salary
select * from Employee.employees e
where salary = (select max(salary) 
from employee.employees 
where salary < (select max(salary) from employee.employees where e.dep_id = dep_id) 
and e.dep_id=dep_id)



--highest salary
--where salary in (select max(salary) from employee.employees where e.dep_id = dep_id group by dep_id)

/*
select * from hr.Countries
select * from hr.Regions
select c.country_name, c.region_id, r.region_name
from hr.Countries c
join HR.Regions r on c.region_id = r.region_id
*/

--hometask2
select * from Inventory.customer
--task1
select sum(purch_amt) as total_purchase from Inventory.Orders
--task2
select avg(purch_amt) as average_purchase from Inventory.orders
--task3
select count(distinct salesman_id) from Inventory.orders
--task4
select count(cust_name) from inventory.customer
--task5
select count(case when grade is not null then grade else null end) from inventory.Customer
--select count(all grade) from inventory.customer
--task6
select max(purch_amt) max_purchase from Inventory.Orders
--task7
select min(purch_amt) min_purchase from Inventory.Orders
--task8
select city, max(grade) max from Inventory.Customer
group by city
order by max desc
--task9
select customer_id, max(purch_amt) as max from Inventory.Orders
group by customer_id
--task10
select customer_id, ord_date, max(purch_amt) as max from Inventory.Orders
group by customer_id, ord_date
order by customer_id
--task11
select salesman_id, max(purch_amt) as max from Inventory.orders
where ord_date = '2012-08-17'
group by salesman_id
--task12
select customer_id, ord_date, max(purch_amt) from Inventory.Orders
group by customer_id, ord_date
having max(purch_amt) > 2000
--task13
select customer_id, ord_date, max(purch_amt) max from Inventory.Orders
group by customer_id, ord_date
having max(purch_amt) between 2000 and 6000
--task14
select customer_id, ord_date, max(purch_amt) max from Inventory.Orders
group by customer_id, ord_date
having max(purch_amt) in ('2000', '3000', '5760', '6000')
--task15
select customer_id, max(purch_amt) max from Inventory.orders
where customer_id between 3002 and 3007
group by customer_id
--task16
select customer_id, max(purch_amt) from Inventory.orders
where customer_id between 3002 and 3007
group by customer_id
having max(purch_amt) > 1000
--task17
select salesman_id, max(purch_amt) max from Inventory.Orders
where salesman_id between 5003 and 5008
group by salesman_id
--task18
select count(case when ord_date = '2012-08-17' then ord_date else null end) count from Inventory.Orders
/*select count(*) count from Inventory.Orders
where ord_date = '2012-08-17'*/
/*select count(ord_date) count from Inventory.Orders
where ord_date = '2012-08-17'*/
--task19
select count(name) count from Inventory.Salesman
--task20
select ord_date, salesman_id, count(ord_no) count from Inventory.Orders
group by ord_date, salesman_id
--task21
select avg(pro_price) avgprice from item_mast
--task22
select count(case when pro_price >= 350 then pro_price else null end) count from item_mast
--select count(*) from item_mast where pro_price >= 350
--task23
select avg(pro_price) avgprice, pro_com as "Company ID" from item_mast
group by pro_com
--task24(no such table)
select sum(dpt_allotment) from [table_name]
--task25
select emp_dept, count(emp_dept) count from emp_details
group by emp_dept
