
 use banking;
create table customers (
customer_id int primary key auto_increment,
name varchar(50),
city varchar(50)
);
 insert into customers(name, city) values ('Janani', 'Chennai'),
 ('Arun','Coimbatore'),
 ('Priya', 'Madurai'),
 ('Karthik', 'Salem');

create table accounts (
account_id int primary key auto_increment,
customer_id int,
account_type varchar(20),
balance decimal(10,2),
foreign key (customer_id) references customers(customer_id)
);
insert into accounts(customer_id,account_type,balance) values
(1,'Saving',50000),
(1,'Current',20000),
(2,'Saving',30000),
(3,'Saving',15000),
(4,'Current',40000);

-- Banking Scenario -Questions--
select * from accounts where balance > 20000; //-- 1--
select customer_id,name from customers where city = 'Chennai'; //-- 2
select * from accounts where balance between 20000 and 50000;//-- 3
select * from customers where name like 'J%'; // -- 4
select * from accounts where account_type = 'Saving' or account_type = 'Current'; // -- 5
select * from accounts where account_type <> 'Saving'; // -- 6
select * from customers where name like '%a%'; // -- 7
select * from accounts where balance <= 30000; // -- 8
select * from customers where city <> 'Madurai'; // -- 9
select * from accounts where balance not between 10000 and 40000; // -- 10
select * from customers where name like '%i'; // -- 11
select * from accounts where balance = 50000; // -- 12
select * from customers where city = 'Chennai' or city = 'Salem'; //-- 13 
select * from accounts where balance > 10000 and balance < 40000; // -- 14
select * from accounts where account_type <> 'Current'; // -- 15
select * from accounts order by balance desc; // -- 16
select * from customers order by name asc; //-- 17
select * from accounts order by account_type and balance desc; // -- 18
select sum(balance) as total_balance from accounts; // -- 19
select avg(balance) as avg_balance from accounts; //-- 20
select max(balance) as max_balance from accounts; //-- 21
select min(balance) as min_balance from accounts; //-- 22
select count(*) from customers; //-- 23
select account_type,sum(balance) as total_balance from accounts group by account_type;//-- 24
select account_type,avg(balance) as avg_balance from accounts group by account_type;//-- 25
select account_type,avg(balance) as avg_balance from accounts group by account_type having avg_balance > 20000;//-- 26
select customer_id,count(account_type) from accounts group by customer_id; //-- 27
select customer_id, count(account_type)from accounts group by customer_id having count(account_type) > 1; //-- 28
select c.name,a.account_type,a.balance from customers c join accounts a on c.customer_id = a.customer_id; //-- 29
select c.name,a.account_type from customers c join accounts a on c.customer_id=a.customer_id;//-- 30
select c.customer_id,c.name,a.account_id,a.account_type from  customers c join accounts a on c.customer_id = a.customer_id;//-- 31
select c.name,a.account_type,a.balance from customers c join accounts a on c.customer_id=a.customer_id where balance > 20000;//-- 32
select c.name,a.balance from customers c join accounts a on c.customer_id = a.customer_id order by balance asc;//-- 34
select c.customer_id,c.name,sum(a.balance) as total_balance from customers c join accounts a on c.customer_id = a.customer_id  group by c.customer_id;//-- 33
select city,count(a.account_type) as number_of_accounts from customers c join accounts a on c.customer_id = a.customer_id group by c.city;//-- 35
select * from accounts where balance >(select avg(balance) from accounts);//-- 36
select * from accounts where balance = (select max(balance) from accounts);//-- 39
select customer_id,sum(balance) as total_balance from accounts group by customer_id having total_balance > 40000;//-- 40
select c.name,a.customer_id,a.account_id,a.account_type,a.balance from customers c join accounts a on c.customer_id = a.customer_id where account_type is not null;//-- 37
select c.name,a.customer_id,a.account_id,a.account_type,a.balance from customers c join accounts a on c.customer_id = a.customer_id where account_type is null;//-- 38
select * from accounts where account_type is not null;//-- 38 & 37
