CREATE TABLE [dbo].Member
(
	[CardNumber] INT NOT NULL PRIMARY KEY,
	Name varchar (200) NOT NULL ,
	[RoomNumber] varchar(10) NOT NULL,
	Block varchar(10) NOT NULL,
	Department varchar(100) NOT NULL,
	[PhoneNumber] varchar(15) NOT NULL,
	Picture varchar(50) NOT NULL
)

go

CREATE TABLE [dbo].Session
(
	[SessionNumber] INT NOT NULL PRIMARY KEY,
	[SessionName]  varchar (50),
	[ManagerName] varchar (100),
	[CardNumber] int foreign key references Member([CardNumber]) on delete cascade

)
go

CREATE TABLE [dbo].[Purchage]
(
	[SerialNumber] INT NOT NULL PRIMARY KEY,
	Date datetime NOT NULL ,
	items varchar (500) NOT NULL,
	Amount money NOT NULL ,
	[SessionNumber] int foreign key references Session([SessionNumber]) on delete cascade NOT NULL
)
go

CREATE TABLE [dbo].[CollectedMoney]
(
	[ReceiptNumber] INT NOT NULL PRIMARY KEY,
	[Amount] int NOT NULL ,
	[SessionNumber] int foreign key references Session ([SessionNumber]) on delete cascade,
	[CardNumber] int foreign key references Member ([CardNumber])
)
go 

insert into Member values(1, 'Hasan', 'p-2001', 'Padma', 'Arabic', '0102202', 'abc.png');
insert into Member values(2, 'Arif', 'j-2001', 'Jamuna', 'IR', '0102202', 'abc.png');
insert into Member values(3, 'Kamal', 'm-2001', 'Meghna', 'EEE', '0102202', 'abc.png');
insert into Member values(4, 'Jamal', 'j-2001', 'Jamuna', 'Arabic', '0102202', 'abc.png');

go

insert into Session values(1, 'March first', 'Hasan', 1);
insert into Session values(2, 'June first', 'Arif', 1);
insert into Session values(3, 'April first', 'Rakib', 2);
insert into Session values(4, 'May first', 'Tamim', 3);

go
insert into Purchage values(1, '2020/10/5', 'Rice, Potato, Alo', '500', 1);
insert into Purchage values(2, '2011/7/5', 'Mango,  Alo', '500', 1);
insert into Purchage values(3, '2021/1/5', 'Rice, Potato, Alo', '330', 2);
insert into Purchage values(4, '2022/3/5', 'Rice, Potato, Alo', '555', 3);

go

insert into CollectedMoney values(1, '1200', 1, 1);
insert into CollectedMoney values(2, '4400', 1, 1);
insert into CollectedMoney values(3, '2200', 2, 2);
insert into CollectedMoney values(4, '9200', 2, 4);