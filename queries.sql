# SAMPLE SQL QUERIES 

# 1. Query the 10 most experienced pilots based on flight hours. 
-- SELECT idPilot, First_name, Last_name, Flight_hours 
-- 	FROM Pilot 
--     WHERE Flight_hours > 5000
--     ORDER BY Flight_hours DESC
--     LIMIT 10;
    
# 2. Query what country has the most experienced pilots based on average flight hours 
-- SELECT Country, ROUND(AVG(Flight_hours),2) AS Avg_flight_hours
-- 	FROM Pilot
--     GROUP BY Country
--     ORDER BY Avg_flight_hours DESC
--     LIMIT 1;
    
# 3. Get the most experienced pilot using MAX and Subquery
-- SELECT First_name, Last_name, Country, Flight_hours
-- 		FROM Pilot 
-- 		WHERE Pilot.Flight_hours = (SELECT MAX(Flight_hours) FROM Pilot); 

# 4. Find the max capacity of the aircraft operating on FlightNo TU001 that operated on 2022-01-13  using a join. 
-- SELECT Flight_Instance.FlightNo, Flight_Instance.Departure_date, Aircraft.max_capacity 
-- 	FROM Flight_Instance INNER JOIN Aircraft ON Flight_Instance.Aircraft_idAircraft = Aircraft.idAircraft
-- 	WHERE (Flight_Instance.FlightNo = 'TU001' AND Flight_Instance.Departure_date = '2022-01-13');

# 5. Get the passengers who flew on flight TU0012 on the 2022-07-03
-- SELECT Passenger.first_name, Passenger.last_name, Flight_Instance.FlightNo, Flight_Instance.Departure_date
-- 	FROM Passenger INNER JOIN Boarding_Pass USING (PassportNo) 
--     INNER JOIN Flight_Instance ON Flight_Instance.FlightNo=Boarding_Pass.FlightNo 
--     WHERE (Flight_Instance.Departure_date = '2022-07-03' AND FLight_Instance.FlightNo = 'TU0012');

# 6. Get details for Cabin crew who's first name starts with A, R, T, J 
-- SELECT first_name, last_name, Country
-- 	FROM Cabin_crew 
--     WHERE REGEXP_LIKE(first_name,'^(A|R|T|J)')
--     ORDER BY first_name ASC; 

# 7. Create a view to get the pilots who are on each flight instance
-- CREATE VIEW flight_pilots
-- AS SELECT Flight_Instance.FlightNo, Flight_Instance.Departure_date, Pilot.idPilot, Pilot.First_name, Pilot.Last_name,
-- Pilot.Flight_hours, Pilot.Country
-- FROM Flight_Instance INNER JOIN Pilot ON Flight_Instance.Pilot_idPilot = Pilot.idPilot;

# 8. Use the view to check the experience of Pilots on all flight instances between Heathrow and Dublin airport 
-- SELECT flight_pilots.First_name, flight_pilots.Last_name, Flight_hours AS Hours_Experience, 
-- flight_pilots.FlightNo, flight_pilots.Departure_date
-- FROM flight_pilots
-- WHERE flight_pilots.FlightNo = 'TU001'
-- ORDER BY Hours_Experience DESC;

# 9. Get the aircraft kept in the hangar located in Frankfurt Airport using a subquery 
-- SELECT Aircraft.idAircraft as aircraft_id_number, Airport_IATA
-- 	FROM Aircraft INNER JOIN 
--     ( select Hangar.Airport_IATA, Hangar.idHangar
-- 	FROM Hangar where Hangar.Airport_IATA = 'FRA') as frankfurt_hangar
-- 	on Aircraft.Hangar_idHangar = frankfurt_hangar.idHangar; 

# 10. Get the departure airport and arrival airport locations for flight route with FlightNO 'TU0010' using Join and subquery
-- SELECT Flight_Route.FlightNo, Flight_Route.Departure_airport, Airport.name as Departure_Name, 
-- 	   Arrival_airport.Arrival_airport, Arrival_airport.Arrival_name
-- FROM 
-- 	Flight_Route INNER JOIN Airport ON Flight_Route.Departure_airport = Airport.IATA
-- 	INNER JOIN 
-- 		(Select Flight_Route.Arrival_airport, Airport.name AS Arrival_name FROM Flight_Route 
-- 		INNER JOIN Airport 
-- 		ON Flight_Route.Arrival_airport = Airport.IATA WHERE Flight_Route.FlightNo = 'TU0010') 
-- 	AS Arrival_airport
-- 	ON Flight_Route.Arrival_airport = Arrival_airport.Arrival_airport; 



# SAMPLE INDEXING 

# Get the last name of crew members without using an Index 
-- EXPLAIN SELECT * FROM Cabin_crew WHERE Last_name = 'Angelini';

# Create an Index 
-- CREATE INDEX crew_last_name ON Cabin_crew(Last_name); 

# Get the last name of crew members using the above created Index 
-- EXPLAIN SELECT * FROM Cabin_crew WHERE Last_name = 'Angelini'; 







