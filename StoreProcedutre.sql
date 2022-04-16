select * from Books
select * from Address
select * from Customer
select * from Payment

-- Add books using store procedure
create procedure sp_AddBooks
(
	@book_name varchar(50),
	@author_name varchar(50),
	@price int,
	@rating float,
	@quantity int,
	@book_image varchar(250),
	@registered_date date
)
as
begin try
insert into Books(book_name,author_name,price,rating,quantity,book_image,registered_date) 
	values(@book_name,@author_name,@price,@rating,@quantity,@book_image,@registered_date)
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

--run addbook procedure
exec sp_AddBooks
	'Wings','A. P. J', 355, 4.6, 20, 'https://images-na.ssl-images-amazon.com/images/I/71KKZlVjbwL.jpg', 'CONVERT(VARCHAR(24),GETDATE(),113)'



-- display books using store procedure
create procedure sp_DisplayBook
As 
Begin try
	select * from Books
End try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

--run display book procedure
exec sp_DisplayBook


-- update books using store procedure
alter procedure sp_UpdateBook
(
	@book_name varchar(50),
	@author_name varchar(50),
	@price int,
	@rating float,
	@quantity int,
	@book_image varchar(250),
	@book_id int
)
As 
Begin try
	update Books set 
		book_name=@book_name, 
		author_name=@author_name, 
		price=@price, 
		rating=@rating, 
		quantity=@quantity,
		book_image=@book_image
	where 
		book_id=@book_id
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

--run update book procedure
exec sp_UpdateBook
'Good Vibes, Good Life','Vex King', 349, 4.6, 14, 'https://m.media-amazon.com/images/P/B07C6T7XMW.01._SCLZZZZZZZ_SX500_.jpg', 7


-- delete books using store procedure
create procedure sp_DeleteBook
(@id int)
As 
Begin try
delete from Books
where book_id=@id
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

--run update book procedure
exec sp_DeleteBook 9

-- delete books using store procedure
alter procedure sp_SearchBook
(
	@bookname varchar(50),
	@authorname varchar(50)
)
as
begin try
	select * from Books where book_name=@bookname and author_name=@authorname
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch


exec sp_SearchBook
'400 Days', 'Bhagat Chetan'


-- Add customer using store procedure
alter procedure sp_AddCustomer
(
	@fname varchar(50),
	@lname varchar(60),
	@email varchar(250),
	@book_id int,
	@address_id int,
	@account_id int 
)
as
begin try
insert into Customer(fname,lname,email,book_id,address_id,account_id)
	values(@fname,@lname,@email,@book_id,@address_id,@account_id)
	
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

exec sp_AddCustomer
'Rajiv','das','rajiv@gmail.com',1,1,122346789


-- display customer using store procedure
create procedure sp_ViewCustomer
As 
Begin try
	select * from Customer
End try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

--run display customer procedure
exec sp_ViewCustomer


-- update customer using store procedure
create procedure sp_UpdateCustomer
(
	@fname varchar(50),
	@lname varchar(60),
	@email varchar(250),
	@book_id int,
	@address_id int,
	@account_id int ,
	@order_id int,
	@customer_id int
)
As 
Begin try
	update Customer set
		fname=@fname,
		lname=@lname,
		email=@email,
		book_id=@book_id,
		address_id=@address_id,
		account_id=@account_id,
		order_id=@order_id
	where 
		customer_id=@customer_id
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

--run update book procedure
exec sp_UpdateCustomer
'Debdut','Chowdhury','debdut101@gmail.com',1,1,987654321,1,1


-- delete customer using store procedure
create procedure sp_DeleteCustomer
(@id int)
As 
Begin try
delete from Customer
where customer_id=@id
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

--run delete customer procedure
exec sp_DeleteCustomer 9


-- Add customer using store procedure
alter procedure sp_AddAddress
(
	@city varchar(50),
	@state_name varchar(50)
)
as
begin try
	insert into Address(city,state_name) values (@city,@state_name)
	
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

exec sp_AddAddress
'Rachi','Jharkhand'

-- display customer using store procedure
create procedure sp_ViewAddress
As 
Begin try
	select * from Address
End try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

--run display customer procedure
exec sp_ViewAddress


-- update customer using store procedure
alter procedure sp_UpdateAddress
(
	@city varchar(50),
	@state_name varchar(50),
	@address_id int
)
As 
Begin try
	update Address set
		city=@city,
		state_name=@state_name
	where 
		address_id=@address_id
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

--run update book procedure
exec sp_UpdateAddress
'Lonavla','Maharastra',9


-- delete customer using store procedure
create procedure sp_DeleteAddress
(@id int)
As 
Begin try
delete from Address
where address_id=@id
end try
begin catch
	SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch

--run delete customer procedure
exec sp_DeleteAddress 9

--selsId, DealerName, bookId, bookName,Price
--booktable=>category