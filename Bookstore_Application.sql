create database Bookstore_Application
use Bookstore_Application

select * from sys.databases

create table Books
(
	book_id int identity(1,1) primary key,
	book_name varchar(50),
	author_name varchar(50),
	price int,
	rating float,
	quantity int,
	book_image varchar(250),
	registered_date date
)

select * from Books

insert into Books(book_name,author_name,price,rating,quantity,book_image,registered_date) values (
	'The Girl in Room 105',
	'Bhagat Chetan',
	137,
	4.5,
	15,
	'https://rukminim1.flixcart.com/image/416/416/kkec4280/book/2/b/8/the-girl-in-room-105-original-imafzr6nczgggedw.jpeg?q=70',
	'12-04-2012'
)
insert into Books(book_name,author_name,price,rating,quantity,book_image,registered_date) values (
	'400 Days',
	'Bhagat Chetan',
	170,
	4.6,
	12,
	'https://rukminim1.flixcart.com/image/416/416/kwpam4w0/book/r/a/r/-original-imag9bv6bzstsjgk.jpeg?q=70',
	'10-14-2013'
)
insert into Books(book_name,author_name,price,rating,quantity,book_image,registered_date) values (
	'Rich Dad Poor Dad',
	'Kiyosaki Robert T.',
	208,
	4.5,
	12,
	'https://rukminim1.flixcart.com/image/416/416/jwwffrk0/book/7/3/8/rich-dad-poor-dad-original-imafhh4kcjk5tkzb.jpeg?q=70',
	'03-24-2014'
)
insert into Books(book_name,author_name,price,rating,quantity,book_image,registered_date) values (
	'Attitude Is Everything',
	'Keller Jeff',
	165,
	4.5,
	18,
	'https://rukminim1.flixcart.com/image/416/416/khxqt8w0-0/book/x/o/v/attitude-is-everything-change-your-attitude-change-your-life-original-imafxtvesfbk8rje.jpeg?q=70',
	'05-14-2015'
)
insert into Books(book_name,author_name,price,rating,quantity,book_image,registered_date) values (
	'Something I Never Told You',
	'Bhinder Shravya',
	180,
	4.5,
	15,
	'https://rukminim1.flixcart.com/image/416/416/kwcfngw0/book/d/o/b/something-i-never-told-you-original-imag9ffkagwngwgv.jpeg?q=70',
	'06-16-2016'
)
insert into Books(book_name,author_name,price,rating,quantity,book_image,registered_date) values (
	'One Arranged Murder',
	'Bhagat Chetan',
	181,
	4.6,
	16,
	'https://rukminim1.flixcart.com/image/416/416/kdxfc7k0/book/1/3/9/one-arranged-murder-original-imafuqfpfthrvzsz.jpeg?q=70',
	'08-20-2017'
)
insert into Books(book_name,author_name,price,rating,quantity,book_image,registered_date) values (
	'TOPPERS STUDY HACKS',
	'Agarwal Avinash',
	199,
	4.5,
	17,
	'https://rukminim1.flixcart.com/image/416/416/kcz4rrk0/book/2/6/6/toppers-study-hacks-original-imaftzpwegagbhtu.jpeg?q=70',
	'04-10-2018'
)
insert into Books(book_name,author_name,price,rating,quantity,book_image,registered_date) values (
	'Think and Grow Rich',
	'Hill Napoleon',
	85,
	4.5,
	16,
	'https://rukminim1.flixcart.com/image/416/416/kiqbma80-0/book/2/k/w/think-and-grow-rich-original-imafygjyvfkywgma.jpeg?q=70',
	'07-28-2019'
)

select * from Books

create table Address
(
	address_id int identity(1,1) primary key,
	city varchar(50),
	state_name varchar(50)
)

insert into Address(city,state_name) values ('Hyderabad','AndraPradesh')
insert into Address(city,state_name) values ('Kolkata','WestBengal')
insert into Address(city,state_name) values ('Mumbai','Maharastra')
insert into Address(city,state_name) values ('Lucknow','Uttar Pradesh')
insert into Address(city,state_name) values ('Chandigarh','Punjab')
insert into Address(city,state_name) values ('Bangloru','Karnataka')
insert into Address(city,state_name) values ('Itanagar','Arunachal Pradesh')
insert into Address(city,state_name) values ('Patna','Bihar')

select * from Address

create table Payment
(
	payment_id int  primary key,
	account_id int,
	order_id int,
	order_placed_date date,
	order_delevered_date date
)

insert into Payment(payment_id,account_id,order_id,order_placed_date,order_delevered_date)values
(1,101,2000101,'04-04-2012','04-10-2012'),
(2,101,2000101,'06-20-2013','06-26-2013'),
(3,101,2000101,'08-02-2014','08-10-2014'),
(4,101,2000101,'03-06-2015','03-15-2015'),
(5,101,2000101,'09-04-2016','09-10-2016'),
(6,101,2000101,'02-11-2017','02-15-2017'),
(7,101,2000101,'10-12-2018','10-18-2019'),
(8,101,2000101,'12-04-2020','12-10-2020')

select * from Payment

create table Order_details 
(
	order_id int identity(1,1) primary key,
	order_PlacedDate datetime default cast(GETDATE() as date),
	order_DeliveredDate datetime, --default cast(DATEADD(day, 7, GETDATE()) as date),
	book_id int foreign key references Books(book_id),
	customer_id int foreign key references Customer(customer_id)
)

drop table Order_details
drop table Customer
drop table Order_details

create table Customer
(
	customer_id int identity(1,1) primary key,
	fname varchar(50),
	lname varchar(60),
	email varchar(250) unique,
	book_id int foreign key references Books(book_id),
	address_id int foreign key references Address(address_id),
	account_id int not null
	--order_id int foreign key references Order_details(order_id)
)

insert into Customer(fname,lname,email,book_id,address_id,payment_id) values
('Prakash','Mahata','prakash@gmail.com','1','1','1'),
('Akash','Saha','akash@gmail.com','2','2','2'),
('Subir','Ghosh','subir@gmail.com','3','3','3'),
('Tinku','Roy','tinku@gmail.com','4','4','4'),
('Soma','Dey','soma@gmail.com','5','5','5'),
('Abir','Singh','abir@gmail.com','6','6','6'),
('Laksh','Mahata','laksh@gmail.com','7','7','7'),
('Rakesh','Debnath','rakesh@gmail.com','8','8','8')

select * from Customer
select * from Order_details

alter procedure sp_OrderPlaced
(
	@book_id int,
	@customer_id int,
	@order_PlacedDate datetime
)
as
begin try
insert into Order_details(book_id,customer_id,order_PlacedDate,order_DeliveredDate) 
	values(@book_id,@customer_id,@order_PlacedDate,DATEADD(DAY,7,@order_PlacedDate))

end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

exec sp_OrderPlaced
1,1,'2022-03-06 00:00:00'

select * from Order_details
select * from Books


ALTER PROC sp_SearchTable
	@fname varchar(50) = null
as
begin try
	if @fname is not null
		select c.fname,
				c.lname,
				c.email,
				b.book_name,
				b.author_name,
				b.price
		from Customer c
		join Books b
		on c.customer_id = b.book_id
		where c.fname like '%' + @fname + '%'
	else
	begin 
		select c.fname,
				c.lname,
				c.email,
				b.book_name,
				b.author_name,
				b.price
		from Customer c
		join Books b
		on c.customer_id = b.book_id
	end 
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

exec sp_SearchTable 'D'

--curson in stored procedure
--clusterd and not clustered procedure

--SET ANSI_NULLS is ON -> a SELECT statement that uses WHERE column_name = NULL returns zero rows even if there are null values in column_name.

/*
SET QUOTED_IDENTIFIER must be ON when you are creating or changing indexes on computed columns or indexed views. If SET QUOTED_IDENTIFIER 
is OFF, then CREATE, UPDATE, INSERT, and DELETE statements will fail on tables with indexes on computed columns, or tables with indexed views.

When you use SET NOCOUNT ON, the message that indicates the number of rows that are affected by the T-SQL statement is not returned as part of 
the results. When you use SET NOCOUNT OFF; the count is returned. Using SET NOCOUNT ON can improve performance because network traffic can be reduced.
*/

set ansi_nulls on
go
set quoted_identifier on
go
alter proc PrintCustomerWithBooks_Cursor
as 
begin
	set nocount on
	declare @customerId int, @fname varchar(50),@lname varchar(60),@email varchar(250)
	--@bookName varchar(50),@authorName varchar(50),@price int
	
	declare @counter int
	set @counter = 1

	declare PrintCustomerWithBooks cursor read_only
	for
--	select c.fname,
--			c.lname,
--			c.email,
--			b.book_name,
--			b.author_name,
--			b.price
--	from Customer c
--	join Books b
--	on c.customer_id = b.book_id

select customer_id,fname,lname,email from Customer

	open PrintCustomerWithBooks

	fetch next from PrintCustomerWithBooks into @customerId, @fname,@lname,@email
	--@bookName,@authorName,@price

	while @@FETCH_STATUS = 0
	begin
		if @counter = 1
		begin
			print 'CustomerID' + char(9) + 'First Name' + char(9) + char(9) + char(9) + 'Last Name' + char(9) + char(9) + char(9) + 'Email'
			    --+ char(9) + char(9) + char(9)+char(9)+char(9)+char(9) + 'Book Name'+char(9)+char(9)+char(9)+char(9)+'Author Name'+char(9)+char(9)
				 -- +char(9)+char(9)+'Price'
			print '-------------------------------------------------------------------------------------------------------------------------------------------'
		end
		print cast(@customerId as varchar(10)) + char(9) + @fname + char(9) + char(9) + char(9) + @lname + char(9) + char(9) + char(9) + @email
		       --+ char(9) + char(9) + char(9)+char(9)+char(9)+char(9) + @bookName+char(9)+char(9)+char(9)+char(9)+@authorName+char(9)+char(9)
				-- +char(9)+char(9)+cast(@price as varchar)

		--set @counter = @counter + 1

		fetch next from PrintCustomerWithBooks into @customerId, @fname,@lname,@email
		--@bookName,@authorName,@price
	end
	--close PrintCustomerWithBooks
	--deallocate PrintCustomerWithBooks
end 
go

exec PrintCustomerWithBooks_Cursor


drop cursor PrintCustomerWithBooks

use Bookstore_Application
close cursor_bookDetails
deallocate cursor_bookDetails
DECLARE 
    @book_name varchar(50), 
    @price int;

DECLARE cursor_bookDetails CURSOR
FOR SELECT 
        book_name,
		price
    FROM 
        Books;

open cursor_bookDetails
FETCH NEXT FROM cursor_bookDetails INTO 
    @book_name,
    @price;

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @book_name + cast(@price as varchar);
        FETCH NEXT FROM cursor_bookDetails INTO 
            @book_name, 
            @price;
    END;

select *from Order_details

alter proc sp_findOrderedBook
(
	@amount int
)
as
begin try
	--select COUNT(book_id) as 'No.Of Books' from [dbo].[Order_details]
	--where book_id=5
	select @amount = sum(price * quantity) 
	from Books b
	inner join Order_details o on o.order_id = b.book_id
	where year(order_PlacedDate) = 2022
	select @amount as Tota
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

exec sp_findOrderedBook 100



create view CustomerDetails
as
	select c.fname,
			c.lname,
			c.email,
			b.book_name,
			b.author_name,
			b.price
	from Customer c
	inner join Books b
	on c.customer_id = b.book_id

select * from Churn_Modelling

use Churn_Modelling

