--hometask
--task1
use W3Resource
select * from Inventory.Salesman
select * from Inventory.Customer
select s.name salesman_name, cust_name, s.city from Inventory.Salesman s
join Inventory.Customer c on s.city=c.city
--task2
select o.ord_no, o.purch_amt, c.cust_name, c.city from Inventory.Orders o
join Inventory.Customer c on c.customer_id = o.customer_id
where o.purch_amt between 500 and 2000
--task3
select cust_name, s.city, name, commission from Inventory.Customer c
join Inventory.Salesman s on s.salesman_id = c.salesman_id
order by city
--task4
select cust_name, c.city, name, commission from Inventory.Customer c
join Inventory.Salesman s on s.salesman_id = c.salesman_id
where commission > 0.12
--task5
select cust_name, c.city, name, s.city, commission from Inventory.Customer c
join Inventory.Salesman s on s.salesman_id = c.salesman_id
where c.city <> s.city and commission>0.12
--task6
select o.ord_no, o.ord_date, o.purch_amt, c.cust_name, c.grade, s.name salesman_name, s.commission from Inventory.Orders o
join Inventory.Customer c on o.customer_id = c.customer_id
join Inventory.Salesman s on s.salesman_id = o.salesman_id
--task7
select * from Inventory.Orders
 natural join Inventory.Customer 
 natural join Inventory.Salesman
 --task8
 select cust_name, c.city, grade, name, s.city from Inventory.Customer c
 join Inventory.Salesman s on s.salesman_id = c.salesman_id
 order by customer_id
 --task9
 select cust_name, c.city, grade, name, s.city from Inventory.Customer c
 join Inventory.Salesman s on s.salesman_id = c.salesman_id 
 where grade < 300
 --task10
 select cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt from Inventory.Customer c
 left join Inventory.Orders o on o.customer_id = c.customer_id
 --task11
 select cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt, s.name, commission from Inventory.Customer c
 left join Inventory.Orders o on c.customer_id=o.customer_id 
 left join Inventory.Salesman s on s.salesman_id=c.salesman_id
 --task12
 select b.cust_name, b.city, b.grade, a.name, a.city from Inventory.Salesman a
left join Inventory.Customer b on a.salesman_id=b.salesman_id
--task13
select s.name salesman_name, c.cust_name, c.city cust_city, grade, o.ord_no, o.ord_date, o.purch_amt from Inventory.Salesman s
left join Inventory.Customer c on s.salesman_id=c.salesman_id
left join Inventory.orders o on o.customer_id=c.customer_id
--task14
select * from Inventory.Customer
right join Inventory.Salesman on Inventory.Customer.salesman_id = Inventory.Salesman.salesman_id
left join Inventory.Orders on Inventory.Orders.customer_id = Inventory.Customer.customer_id
where purch_amt > 2000 and grade is not null
--task15
select cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt from Inventory.Customer c
right join Inventory.Orders o on o.customer_id=c.customer_id
--hr.employees table
--task1
select first_name, last_name, e.department_id, d.department_name from hr.Employees e
join hr.Departments d on d.department_id = e.department_id
--task3
select first_name, last_name, salary, grade_level from hr.Employees
join hr.Job_Grades on salary between lowest_sal and highest_sal 
--task6
select first_name, last_name, d.department_id, department_name from hr.Employees e
right join hr.Departments d on e.department_id = d.department_id
--task7
select first_name, last_name, salary from hr.Employees
where salary < (select salary from hr.Employees where employee_id=182)
--task8
select e.first_name, e1.first_name manager_name from HR.Employees e
 join hr.Employees e1 on  e.employee_id = e1.manager_id
--task9
select department_name, city, state_province from hr.Locations l
join hr.Departments d on d.location_id = l.location_id
--task10
select first_name, last_name, e.department_id, department_name from hr.Employees e
left join hr.Departments d on d.department_id=e.department_id
--task13
select j.job_title, d.department_name, e.first_name, h.start_date from hr.Employees e
join hr.Job_History h on e.employee_id=h.employee_id
join hr.Jobs j on j.job_id=h.job_id 
join hr.Departments d on d.department_id=h.department_id
where start_date between '1993-01-01' and '1997-08-31'
--task14 
select job_title, first_name, (max_salary - salary) as salary_difference from hr.Employees e
join hr.Jobs j on e.job_id=j.job_id
--task16
select job_title, first_name, (j.max_salary - salary) salary_difference from hr.Employees e
join hr.Jobs j on j.job_id=e.job_id
where department_id=80
--task17
select country_name, city, department_name from hr.Locations l
join hr.Countries c on c.country_id=l.country_id
join hr.Departments d on l.location_id = d.location_id
--task18
select department_name, e.first_name + ' ' + e.last_name name_of_manager from hr.Employees e
join hr.Departments d on d.manager_id=e.employee_id
--task19
select avg(salary) avgsalary, job_title from hr.Employees e
join hr.jobs j on j.job_id=e.job_id
group by job_title
--task21
select country_name, city, department_name, count(*) count from hr.Countries c
join hr.Locations l on c.country_id=l.country_id
join hr.Departments d on d.location_id=l.location_id
join hr.Employees e on e.department_id=d.department_id
group by country_name, city, department_name
having count(*) >=2

select country_name, city, department_name, count(department_id) from hr.Countries c
join hr.Locations l on l.country_id=c.country_id
join hr.Departments d on d.location_id=l.location_id
where department_id in (
select department_id from hr.Employees e
group by department_id
having count(department_id) >=2)
group by country_name, city, department_name
--task22
select department_name, first_name + '' + last_name fullname, city from hr.Employees e
join hr.Departments d on d.manager_id=e.employee_id
join hr.Locations l on l.location_id=d.location_id

