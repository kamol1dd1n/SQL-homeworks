
--homework for L4

--After restoring W3Resource Database, use employee.employees table to return a person(people) who get the 2nd highest salary.
use W3Resource


--1st method
--max(column_name) - returns integer type data with the biggest number 
select top 1 with ties * from Employee.employees
where salary < (select max(salary) from Employee.employees)
order by salary desc


--2nd method
select top 2 with ties * from 
(select * from employee.employees
order by salary desc
offset 1 rows fetch next 999999 rows only) as second_highest_salary
order by salary desc

--insert into Employee.employees (emp_id, salary) values(62801, null)

--3rd method
--count(*) - returns overall amount of rows in a table
select top 2 with ties * from
( select * from employee.employees
order by salary desc
offset 1 rows fetch next (select count(*) - 1 from Employee.employees) rows only) as second_highest
order by salary desc



--Retrieve data from table
--task1
select * from Employee.employees
--task2
select 'This is string' as string_column
--task3
select 3 as num1, 4 as num2, 5 as num3
--task4
select 10+15
--task5
select 3+(5-2)*6
--task6
select emp_name from Employee.employees
--task7
select manager_id, job_name, salary from Employee.employees
--task8
select distinct dep_id from Employee.employees
--task9
select emp_name, hire_date from Employee.employees
where hire_date like '1991%'
--task10
select * from Employee.employees
where dep_id = 2001
--task11
select * from Employee.employees
where manager_id = 66928
--task12
select year, subject, winner, country from nobel_win
where year = 1970
--task13
select winner from nobel_win
where subject = 'Literature' and year = 1971
--task14
select year, subject from nobel_win
where winner = 'Dennis Gabor'
--task15
select winner from nobel_win
where subject = 'Physics' and year >1950
--task16
select year, subject, winner, country from nobel_win
where subject= 'Chemistry' and year between 1965 and 1975
--task17
select * from nobel_win
where category = 'prime minister'
--task18
select * from nobel_win
where winner like 'louis%'
--task19
select * from nobel_win
where subject = 'physics' and year = 1970 or subject = 'economics' and year = 1971
--task20
select * from nobel_win
where year = 1970 and subject not in ('physiology', 'economics')
--task21
select * from nobel_win
where year <1971 and subject = 'physiology' or year >= 1974 and subject = 'peace'
--SELECT *
--FROM nobel_win
--WHERE (subject = 'Physiology' AND year < 1971)
--UNION
--(SELECT * FROM nobel_win WHERE (subject = 'Peace' AND year >= 1974));
--task22
select * from nobel_win
where winner = 'Johannes Georg Bednorz'
--task23
select * from nobel_win
where subject not like 'P%'
order by year desc, winner
--task24
select * from nobel_win
where year = 1970 
order by 
case 
when subject not in ('Chemistry', 'economics') then 0
else 1
end
asc, subject, winner
--task25
select * from hr.Employees
where salary between 10000 and 20000
--task26
select avg(salary) from hr.Employees
where department_id = 90
--task27
select year as date, subject as field, country as state, category as type from nobel_win
--task28
select * from hr.Employees
where salary >= 12000
order by salary desc, first_name asc
--task29
select avg(salary), department_id from hr.Employees
group by department_id
--task30
select min(salary) as least_salary from HR.Employees
--task31
select distinct last_name from HR.Employees 
--task32
select * from HR.Employees
where last_name = 'markle'
--task33
select * from hr.employees
where department_id= 50


--boolean and relational operators
--task1
select * from Inventory.Customer
where grade > 100
--task2
select * from Inventory.Customer
where city = 'New York' and grade>100
--task3
select * from Inventory.customer
where city = 'New York' or grade > 100
order by 
case when city = 'New York' then 1 else 0
end
desc, city
--task4
select * from Inventory.Customer
where city = 'New York' or grade<=100
--SELECT * FROM inventory.customer 
--WHERE city = 'New York' OR NOT grade > 100
--task5
select * from Inventory.Customer
where not city = 'New York' and NOT grade > 100
--select * from invetory.customer
--where not (city = 'New York' or grade > 100)
--task6
select * from Inventory.Orders
Where not ((ord_date = '2012-09-10' and 
salesman_id > 5005) or purch_amt > 1000)
--task7
Select * from Inventory.Salesman
Where commission between 0.10 and 0.12
--task8
Select * from Inventory.Orders
Where (purch_amt < 200 or NOT (ord_date >= '2012-02-10' and customer_id < 3009))
--task9
select * from Inventory.Orders
where not ((ord_date = '2012-08-17' or customer_id > 3005) and purch_amt <1000)
--task10
--select * from Inventory.Orders
--where purch_amt >= (select (0.5*6000))
select ord_no, purch_amt, 
((purch_amt * 100)/6000) as achieved_percentage,
(100-(purch_amt * 100)/6000) as unachieved_percentage
from Inventory.Orders
where ((purch_amt * 100)/6000) > 50
--task11
select * from emp_details
where emp_lname in ('dosni', 'mardy')
--task12
select * from emp_details
where emp_dept in (47, 63)
order by emp_dept


--wildcard and special operators
--task1
select * from Inventory.Salesman
where city in ('paris', 'rome')
--task3
select * from Inventory.Salesman
where city not in ('paris', 'rome')
--task4
select * from Inventory.Customer
where customer_id in (3007, 3008, 3009)
--task5
select * from Inventory.Salesman
where commission between 0.12 and 0.14
--task6
select * from Inventory.Orders
where ((purch_amt between 500 and 4000) and purch_amt not in (948.50, 1983.43))
--task7
select * from Inventory.Salesman
where name between 'A' and 'L'
--task8
select * from Inventory.Salesman
where not name between 'A' and 'M'
--task9
select * from Inventory.Customer
where cust_name like 'B%'
--task10
select * from Inventory.Customer
where cust_name like '%n'
--task11
select * from Inventory.Salesman
where name like 'n__l%'
--task12
select * from [table_name]
-- The ESCAPE clause is used 
--to escape the special character '/' in the pattern.
where col1 like '%/_%' escape '/'
--task13
select * from [yable_name]
where col1 not like '%/_%' escape '/'
--task14
select * from [table_name]
where col1 like '%//%' escape '/'
--task15
select * from [table_name]
where col1 not like '%//%' escape '/'
--task16
select * from [table_name]
where col1 like '%/_//%' escape '/'
--task17
select * from [table_name]
where col1 not like '%/_//%' escape '/'
--task18
select * from [table_name]
where col1 like '%/%%' escape '/'
--task19
select * from [table_name]
where col1 not like '%/%%' escape '/'
--task20
select * from Inventory.Customer
where grade = 0 or grade is null
--task21
select * from Inventory.Customer
where grade <> 0 or grade is not null
--task22
select * from emp_details
where emp_lname like 'D%'

--FINISH!!!