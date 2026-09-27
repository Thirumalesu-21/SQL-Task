create database Employee_Management;
use Employee_Management;
CREATE TABLE Employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
department VARCHAR(30),
salary DECIMAL(10,2),
city VARCHAR(30),
joining_date DATE
);
INSERT INTO Employee VALUES
(101,'John','IT',60000,'Chennai','2022-01-15'),
(102,'David','HR',45000,'Bangalore','2021-03-10'),
(103,'Smith','IT',70000,'Chennai','2020-07-12'),
(104,'Mary','Finance',55000,'Mumbai','2023-01-20'),
(105,'James','HR',48000,'Delhi','2022-05-05'),
(106,'Linda','Finance',65000,'Mumbai','2021-08-18');
select department,count(emp_id) as number_of_employees from Employee group by department;//-- 1
select department,avg(salary) from employee group by department;//-- 2
select department,count(emp_id) from employee group by department having count(emp_id) > 1;//-- 3
select department,max(salary) from employee group by department;//-- 4
select department, min(salary) from employee group by department;//-- 5
select department,avg(salary) from employee  group by department having avg(salary) > 50000;//-- 6
select department,sum(salary) from employee group by department;//-- 7
select * from employee order by salary desc;//-- 8
select * from employee order by department and salary desc;//-- 9
select city,count(emp_id) from employee group by city having count(emp_id) > 1;//-- 10
select city,sum(salary) from employee group by city;//-- 11
select department,sum(salary) from employee group by department order by sum(salary) desc;//-- 12
select department,count(emp_id) from employee where salary > 50000 group by department;//-- 13
select department,(max(salary)-min(salary))as salary_difference from employee group by department;//-- 14
select * from employee order by salary desc limit 3;//-- 15
create table customers (
customer_id int primary key,
customer_name varchar(50),
city varchar(30)
);
INSERT INTO Customers (customer_id, customer_name, city)
VALUES
(1, 'Arun', 'Chennai'),
(2, 'Priya', 'Bangalore'),
(3, 'Karthik', 'Hyderabad'),
(4, 'Meena', 'Chennai'),
(5, 'Rahul', 'Mumbai'),
(6, 'Anjali', 'Bangalore'),
(7, 'Suresh', 'Delhi'),
(8, 'Divya', 'Hyderabad');
create table orders (
order_id int primary key,
customer_id int,
amount decimal(10,2),
order_date date,
foreign key (customer_id) references customers(customer_id)
);
INSERT INTO Orders (order_id, customer_id, amount, order_date)
VALUES
(101, 1, 15000.00, '2026-01-10'),
(102, 1, 28000.00, '2026-01-15'),
(103, 2, 45000.00, '2026-02-05'),
(104, 3, 12000.00, '2026-02-10'),
(105, 3, 35000.00, '2026-02-18'),
(106, 4, 55000.00, '2026-03-01'),
(107, 5, 18000.00, '2026-03-12'),
(108, 5, 30000.00, '2026-03-20'),
(109, 6, 65000.00, '2026-04-02'),
(110, 7, 22000.00, '2026-04-10'),
(111, 8, 48000.00, '2026-04-15'),
(112, 2, 25000.00, '2026-04-20');
create table students(
student_id int primary key auto_increment,
student_name varchar(50),
department varchar(30),
marks int);
INSERT INTO Students
(student_id, student_name, department, marks)
VALUES
(1, 'Rahul', 'CSE', 85),
(2, 'Priya', 'CSE', 92),
(3, 'Arun', 'ECE', 76),
(4, 'Meena', 'ECE', 88),
(5, 'Karthik', 'IT', 95),
(6, 'Anjali', 'IT', 81),
(7, 'Suresh', 'CSE', 68),
(8, 'Divya', 'IT', 73),
(9, 'Vijay', 'ECE', 91),
(10, 'Sneha', 'CSE', 79);
select customer_name,sum(amount) from customers join orders on customers.customer_id = orders.customer_id group by customer_name; // -- 16
select customer_name,count(order_id) from customers join orders on customers.customer_id = orders.customer_id group by customer_name having count(order_id) > 3; // -- 17
select customer_name,avg(amount) from customers join orders on customers.customer_id = orders.customer_id group by customer_name;//-- 18
select customer_name,max(amount) from customers join orders on customers.customer_id = orders.customer_id group by customer_name;//-- 19
select customer_name,sum(amount) from customers join orders on customers.customer_id = orders.customer_id group by customer_name order by sum(amount) asc;//-- 20
select customer_name,sum(amount) from customers join orders on customers.customer_id = orders.customer_id group by  customer_name having sum(amount)>10000;//-- 21
select customer_name,count(order_id) from customers join orders on customers.customer_id = orders.customer_id group by customer_name;//-- 22
select customer_name,sum(amount) from customers join orders on customers.customer_id = orders.customer_id group by customer_name order by sum(amount) desc limit 1;//-- 23
select customer_name,count(order_id) from customers join orders on customers.customer_id = orders.customer_id group by customer_name order by count(order_id) desc limit 1;//-- 24
select customer_name,avg(amount) from customers join orders on customers.customer_id = orders.customer_id group by customer_name having avg(amount) > 2000;//-- 25
select customer_name,sum(amount) from customers join orders on customers.customer_id = orders.customer_id group by customer_name order by sum(amount) desc limit 5;//-- 26
select customer_name,min(amount) from customers join orders on customers.customer_id = orders.customer_id group by customer_name;//-- 27
select customer_name,sum(amount) from customers join orders on customers.customer_id = orders.customer_id group by customer_name having sum(amount) > 5000;//-- 28
select customer_name,count(order_id),sum(amount) from customers join orders on customers.customer_id = orders.customer_id group by customer_name;//-- 29
select customer_name,count(order_id),sum(amount) from customers join orders on customers.customer_id = orders.customer_id group by customer_name having sum(amount) > 8000;//-- 30
-- Students Table
select student_name,avg(marks) from students group by student_name; //-- 31
select department,avg(marks) from students group by department;//-- 32
select department,max(marks) from students group by department;//-- 33
select department,count(student_id) from students group by department;//-- 34
select department, count(student_id) from students group by department having count(student_id) > 5;//-- 35
select department,avg(marks) from students group by department order by avg(marks) desc;//-- 36
select department,avg(marks) from students group by department order by avg(marks) limit 3;//-- 37
select department,avg(marks) from students group by department having avg(marks) between 70 and 90;//-- 38
select department,sum(marks) from students group by department;//-- 39
select department,sum(student_id) from students group by department order by sum(student_id);//-- 40
select department,min(marks) from students group by department;//-- 41
select department,max(marks) from students group by department having max(marks) > 90;//-- 42
select department,count(*)as student_count  from students where marks > 80 group by department;//-- 43
select department,count(*)as student_count from students where marks > 75  group by department having count(*) > 3;//-- 44 
select department,max(marks) from students group by department order by max(marks) desc;//-- 45



