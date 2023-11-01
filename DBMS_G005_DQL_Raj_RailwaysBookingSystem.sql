SELECT t.Passenger_name,tr.TrainName
FROM Ticket t
JOIN Train tr ON t.Train_No = tr.TrainNumber;

SELECT SUM(amount) AS TotalAmountSpent
FROM Payments;

SELECT Passenger_name,Class
FROM Ticket
WHERE Class = '2A';

SELECT TrainNumber, Via
FROM Routes
WHERE TrainNumber IN (SELECT TrainNumber FROM Train WHERE Source = 'Jammu Tawi [JAT]');


SELECT passenger_name, bank_name
FROM Payments
WHERE amount > 2000;

SELECT Class_type, AVG(Fare_Rs) AS TotalFare
FROM Class
GROUP BY Class_type;


SELECT PNR_NO, Passenger_name
FROM Ticket
WHERE Source = 'Howrah Junction [HWH]' AND Destination = 'New Delhi [NDLS]';


SELECT TrainNumber, Source, Destination
FROM Train
WHERE DistanceKms > 1500;

SELECT TrainName, Scheduled_Departure
FROM Train
WHERE Source = 'Howrah Junction [HWH]' AND DistanceKms > 1000;

SELECT PNR_NO, Train_No, Train_Name, Passenger_name
From Ticket
Where Source = 'Pune Junction [PUNE]';



SELECT *
FROM Routes
WHERE TrainNumber IN (
SELECT TrainNumber
FROM Train
WHERE Source = 'Pune Junction [PUNE]'
)
LIMIT 2;

SELECT AVG(Fare_Rs) AS AverageFare
FROM Class
WHERE Class_type = '3A';

SELECT *
FROM Payments
WHERE bank_name LIKE '%ICICI%';


SELECT Train_No
FROM Class
WHERE Fare_Rs = (SELECT MAX(Fare_Rs) FROM Class WHERE Class_type = '1A');


SELECT Passenger_name
FROM Ticket
WHERE Seat_no < 30;



