create database if not exists library;
USE library;

create table user
(
    Id int primary key auto_increment,
    Name varchar(15) not null,
    Email varchar(20) not null unique,
    Password varchar(15) not null,
    IsAdmin bool default false
);

create table book
(
    ISBN int key unique,
    Name varchar(200) not null,
    Author varchar(100) not null,
    Year int not null
);

CREATE TABLE print(
    Id INT KEY,
    ISBN INT,
    Status VARCHAR(20) DEFAULT 'Available',
    Archived BOOL DEFAULT FALSE,
    FOREIGN KEY (ISBN) REFERENCES book(ISBN)
);

create table client(
    Id int key auto_increment,
    Name varchar(30) not null,
    Email varchar(30) not null unique
);

create table service (
    Id int key auto_increment,
    PrintId int,
    BorrowDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ReturnDate DATE,
    ClientId int,
    UserId int,
    Returned BOOL DEFAULT FALSE,
    foreign key (PrintId) references print(Id),
    foreign key (ClientId) references client(Id) ,
    foreign key (UserId) references user(Id)
);

insert into user (Name,Email,Password,IsAdmin) values ('Sidati','sidati@gmail.com','sidati@123',true);
insert into book (ISBN, Name, Author, Year) values (111100, '1984', 'Jorge ORWELL', 1949),
                                                   (111101, 'Animal farm', 'Jorge ORWELL', 1940),
                                                   (236789, 'The social contract', 'J.J Rousseau', 2016);
insert into client (Name, Email) values ('Hassan','hassan@gmail.com');
INSERT INTO print (Id, ISBN, Archived)  values (10001, 236789, 0), (10002, 236789, 0), (10003, 236789, 0), (10004, 236789, 0), (10011, 111101, 0), (10012, 111101, 0);
INSERT INTO service (PrintId, BorrowDate, ReturnDate, ClientId)  values (00001, '2023-09-01', '2023-09-15', 1), (00012, '2023-08-25', '2023-09-11', 1);


DELIMITER //
CREATE EVENT daily_archiving
    ON SCHEDULE EVERY 1 DAY STARTS TIMESTAMP(CURRENT_DATE, '00:00:00')
    DO
    BEGIN
        UPDATE print
        SET Archived = true
        WHERE EXISTS (
            SELECT PrintId, ReturnDate
            FROM service
            WHERE print.Id = service.PrintId
              AND DATE_ADD(service.ReturnDate, INTERVAL 10 DAY) <= CURRENT_DATE
        );
    END;

SET GLOBAL event_scheduler = ON;