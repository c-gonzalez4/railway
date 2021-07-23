#inner join between passenger and address 
SELECT passenger.FirstName, passenger.LastName, passenger.Age, address.Address, address.City, address.State
FROM passenger
INNER JOIN address on passenger.AddressID=address.AddressID;  

SELECT station.StationID,station.StationName, location.state
FROM station
INNER JOIN location on station.LocationID=location.LocationID;

SELECT ticket.Seat, passenger.Firstname, passenger.LastName, ticket.Price, schedule.ArrivalTime, schedule.DepartureTime, schedule.CurrentDate, schedule.StationID
FROM ticket
INNER JOIN passenger on ticket.PassengerID=passenger.PassengerID 
INNER JOIN schedule on ticket.ScheduleID=schedule.ScheduleID;

SELECT COUNT(*) 
FROM passenger;

SELECT DISTINCT FirstName
FROM passenger
WHERE Age> 50;

#lists the number of customers by their last names  
SELECT COUNT(PassengerID), LastName 
FROM passenger
GROUP BY LastName;

SELECT COUNT(PassengerID), LastName 
FROM passenger
GROUP BY LastName
HAVING COUNT(PassengerID)>1; 

INSERT INTO station (StationName, LocationID) 
VALUES('Allan', 6);

UPDATE station 
SET StationName = 'Peanut'
WHERE StationID = 10;

DELETE FROM station WHERE StationID=10;

  

