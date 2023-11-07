
drop database if exists railway;

create database railway;

drop table if exists User;


create table User(
Username varchar(255) Primary Key NOT NULL,
Name varchar(255) NOT NULL,
Address varchar(255) NOT NULL,
DOB varchar(255) NOT NULL,
Age int(10) NOT NULL,
Mobile_no INT NOT NULL,
Gender varchar(255) NOT NULL
);


drop table if exists Class;


create table Class(
Train_No int(50) NOT NULL Primary Key,
Class_type varchar(255) NOT NULL,
Fare_Rs int(50) NOT NULL
);


drop table if exists ticket;


create table Ticket(
Username varchar(255) NOT NULL,
PNR_NO bigint Primary Key NOT NULL,
Train_No int(10) NOT NULL,
Train_Name varchar(255) NOT NULL,
Date_Time Datetime NOT NULL,
Passenger_name varchar(255) NOT NULL,
Class varchar(225) NOT NULL,
Source varchar(255) NOT NULL,
Destination varchar(255) NOT NULL,
Date_of_Boarding date,
Coach_no varchar(255) NOT NULL,
Seat_no int(10) NOT NULL
);



drop table if exists Train;


CREATE TABLE Train (
    TrainNumber INT PRIMARY KEY,
    TrainName VARCHAR(255),
    Source VARCHAR(255),
    Destination VARCHAR(255),
    ArrivalTime TIME,
    DepartureTime TIME,
    DistanceKms INT
);


alter table train
change ArrivalTime Scheduled_Arrival Time;

alter table train
change DepartureTime Scheduled_Departure Time;


drop table if exists Payments;


CREATE TABLE Payments (
	Username varchar(255) NOT NULL,
    transaction_id VARCHAR(15),
    account_number VARCHAR(11),
    passenger_name VARCHAR(50),
    bank_name VARCHAR(50),
    amount DECIMAL(10, 2)
);



drop table if exists Routes;


CREATE TABLE Routes (
TrainNumber VARCHAR(255) Primary Key,
Via VARCHAR(255),
Max_Time_Halt TIME,
Min_Time_Halt TIME,
Distancekms INT
);

ALTER TABLE Ticket
ADD CONSTRAINT FK_Train_No
FOREIGN KEY (Train_No)
REFERENCES Train (TrainNumber);

ALTER TABLE Ticket
ADD CONSTRAINT FK_user
FOREIGN KEY (Username) REFERENCES User(Username);

ALTER TABLE Ticket
ADD CONSTRAINT FK_trainno
FOREIGN KEY (Train_No) REFERENCES Train(TrainNumber);

Alter table Class
modify Train_No int Not Null Primary Key;

ALTER TABLE Class
ADD CONSTRAINT FK_class
FOREIGN KEY (Train_No) REFERENCES Train(TrainNumber);

ALTER TABLE Routes
ADD CONSTRAINT FK_trainroutes
FOREIGN KEY (TrainNumber) REFERENCES Train(TrainNumber);

ALTER TABLE Payments
ADD CONSTRAINT FK_username
FOREIGN KEY (Username) REFERENCES User(Username);

CREATE VIEW RouteInfo AS
SELECT TrainNumber, Via, Max_Time_Halt, Min_Time_Halt
FROM Routes;

CREATE VIEW PassengerInfo AS
SELECT Username, Name, Address, Age, Gender
FROM User;

CREATE VIEW current_train_status AS
SELECT TrainNumber, TrainName, Source, Scheduled_Departure, Destination, Scheduled_Arrival
FROM train
WHERE Scheduled_Departure > CURRENT_TIME;


CREATE VIEW current_train_status AS
SELECT TrainNumber, TrainName, Source, Scheduled_Departure, Destination, Scheduled_Arrival
FROM train
WHERE Scheduled_Departure > CURRENT_TIME;

CREATE VIEW all_late_trains AS
SELECT TrainNumber, TrainName, Source, Scheduled_Departure, Destination, Scheduled_Arrival
FROM train
WHERE Scheduled_Arrival  < CURRENT_TIME;
