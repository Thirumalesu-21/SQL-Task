create database Railway;
use  Railway;
create table trains(
train_id int primary key auto_increment,
train_name varchar(50),
source varchar(50),
destination varchar(50)
);
insert into trains(train_name,source,destination) values('Express1','Chennai','Madurai'),
('Express2','Coimbatore','Salem'),
('Express3','Madurai','Chennai');
create table bookings(
booking_id int primary Key auto_increment,
train_id int,
passenger_name varchar(50),
fare decimal(10,2),
status varchar(20),
foreign key(train_id) references trains(train_id)
);
insert into bookings(train_id,passenger_name,fare,status) values
(1,'Janai',500,'Confirmed'),
(1,'Arun',500,'Waiting'),
(2,'Priya',300,'Confirmed'),
(3,'Karthik',450,'Cancelled'),
(2,'Meena',300,'Confirmed');
select * from bookings where fare > 400;// -- 41
select * from bookings where status <> 'Confirmed';//-- 42
select * from trains where source = 'Chennai';//-- 43
select * from bookings where fare between 300 and 500;//-- 44
select * from bookings where passenger_name like 'A%';//-- 45
select t.train_name,b.passenger_name from trains t join bookings b on t.train_id = b.train_id;//-- 46
select t.train_name,count(b.passenger_name)as number_of_bookings from trains t join bookings b on t.train_id = b.train_id group by t.train_name;//-- 47
select t.train_name,sum(b.fare)as total_fare from trains t join bookings b on t.train_id = b.train_id group by t.train_name;//-- 48
select * from bookings where fare = (select max(fare) from bookings);//-- 49
select t.train_name,count(b.passenger_name) as number_of_bookings from trains t join bookings b on t.train_id=b.train_id group by t.train_name having number_of_bookings > 1; 