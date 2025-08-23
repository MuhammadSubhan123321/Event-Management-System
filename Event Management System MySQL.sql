Create database Events; 
drop database Events; 
use Events; 
CREATE TABLE Event ( 
    EventID INT PRIMARY KEY, 
    EventName VARCHAR(255), 
    EventDate DATE,
    EventTime TIME, 
    VenueID INT, 
    OrganizerID INT, 
    AttendeeID INT, 
    Description TEXT, 
    Status VARCHAR(50) 
); 
INSERT INTO Event (EventID, EventName, EventDate, EventTime ,VenueID, OrganizerID, AttendeeID, Description, Status) VALUES 
(101, 'Tech Conference', '2024-02-20', '09:00:00', 201, 301, 1, 'Annual technology conference', 'upcoming'), 
(102, 'Music Festival', '2024-03-15', '18:00:00', 202, 302, 2, 'Live music performances', 'upcoming'), 
(103, 'Art Exhibition', '2024-04-10', '10:00:00', 203, 303, 3, 'Exhibition of modern art', 'upcoming'), 
(104, 'Food Expo', '2024-05-05', '12:00:00', 204, 304, 4, 'Culinary event with multiple cuisines', 'upcoming'), 
(105, 'Book Fair', '2024-06-01', '11:00:00', 205, 305, 5, 'Annual book fair', 'upcoming'); 
 
CREATE TABLE Attendee ( 
    AttendeeID INT PRIMARY KEY, 
    EventID INT, 
    Name VARCHAR(255), 
    Email VARCHAR(255) UNIQUE, 
    Phone VARCHAR(15), 
    RegistrationDate DATE, 
    FOREIGN KEY (EventID) REFERENCES Event(EventID) 
); 
INSERT INTO Attendee (AttendeeID, EventID, Name, Email, Phone, RegistrationDate) VALUES 
(1, 101, 'Alice Johnson', 'alice@example.com', '123-456-7890', '2024-01-15'), 
(2, 102, 'Bob Smith', 'bob@example.com', '987-654-3210', '2024-01-16'), 
(3, 103, 'Charlie Brown', 'charlie@example.com', '555-555-5555', '2024-01-17'), 
(4, 104, 'Diana Prince', 'diana@example.com', '444-444-4444', '2024-01-18'), 
(5, 101, 'Eve Davis', 'eve@example.com', '333-333-3333', '2024-01-19'); 

CREATE TABLE Venue ( 
    VenueID INT PRIMARY KEY, 
    EventID INT, 
    VenueName VARCHAR(255), 
    Address VARCHAR(255), 
    Capacity INT, 
    ContactPerson VARCHAR(255), 
    ContactEmail VARCHAR(255) UNIQUE, 
    ContactPhone VARCHAR(15), 
    FOREIGN KEY (EventID) REFERENCES Event(EventID) 
); 
 INSERT INTO Venue (VenueID, EventID, VenueName, Address, Capacity, ContactPerson, ContactEmail, ContactPhone) VALUES 
(201, 101, 'Convention Center', '123 Main St', 5000, 'John Doe', 'john.doe@venue.com', '111-111-1111'), 
(202, 102, 'Music Hall', '456 Broadway', 3000, 'Jane Smith', 'jane.smith@venue.com', '222-222-2222'), 
(203, 103, 'Art Gallery', '789 Art Ln', 1500, 'Emily Johnson', 'emily.johnson@venue.com', '333-333-3333'), 
(204, 104, 'Expo Center', '101 Expo Blvd', 4000, 'Michael Brown', 'michael.brown@venue.com', '444-444-4444'), 
(205, 105, 'Library Hall', '202 Book St', 2000, 'Sarah Davis', 'sarah.davis@venue.com', '555-555-5555'); 
 
CREATE TABLE Organizer ( 
    OrganizerID INT PRIMARY KEY, 
    EventID INT, 
    OrganizerName VARCHAR(255), 
    ContactEmail VARCHAR(255) UNIQUE, 
    ContactPhone VARCHAR(15), 
    FOREIGN KEY (EventID) REFERENCES Event(EventID) 
); 
INSERT INTO Organizer (OrganizerID, EventID, OrganizerName, ContactEmail, ContactPhone) VALUES 
(301, 101, 'TechOrg', 'info@techorg.com', '666-666-6666'), 
(302, 102, 'MusicOrg', 'info@musicorg.com', '777-777-7777'), 
(303, 103, 'ArtOrg', 'info@artorg.com', '888-888-8888'), 
(304, 104, 'FoodOrg', 'info@foodorg.com', '999-999-9999'), 
(305, 105, 'BookOrg', 'info@bookorg.com', '000-000-0000'); 

Select *from Event;
Select *from Atendee;
Select *from Venue;
Select *from Organizer;

ALTER TABLE Attendee ADD COLUMN Address VARCHAR(255);  
ALTER TABLE Event RENAME COLUMN Description TO 
EventDescription; 
ALTER TABLE Organizer DROP COLUMN ContactPhone; 

SELECT Name, Email, Phone FROM Attendee;  
SELECT * FROM Venue WHERE Capacity > 2000; 
SELECT e.EventID, e.EventName, e.EventDate, e.EventTime, v.VenueName, v.Address 
FROM Event e 
JOIN Venue v ON e.VenueID = v.VenueID; 
SELECT a.AttendeeID, a.Name, a.Email, a.Phone, e.EventName 
FROM Attendee a 
JOIN Event e ON a.EventID = e.EventID; 
SELECT e.EventID, e.EventName, o.OrganizerName, o.ContactEmail 
FROM Event e 
JOIN Organizer o ON e.OrganizerID = o.OrganizerID;  
SELECT a.AttendeeID, a.Name, e.EventName, v.VenueName, v.Address 
FROM Attendee a 
JOIN Event e ON a.EventID = e.EventID 
JOIN Venue v ON e.VenueID = v.VenueID; 

SELECT * FROM Event;  
SELECT * FROM Event WHERE EventDate > '2024-04-01'; 
SELECT * FROM Event ORDER BY EventDate ASC; 
SELECT EventID, COUNT(*) AS num_attendees 
FROM Attendee 
GROUP BY EventID; 
SELECT EventID, COUNT(*) AS num_attendees 
FROM Attendee 
GROUP BY EventID 
HAVING COUNT(*) > 1; 
SELECT * FROM Event WHERE EventName LIKE '%Exhibition%'; 
SELECT * FROM Event LIMIT 3; 
INSERT INTO Event (EventID, EventName, EventDate, EventTime, VenueID, OrganizerID, AttendeeID, Description, Status) VALUES 
(106, 'Science Fair', '2024-07-20', '10:00:00', 206, 306, 6, 'Showcase of scientific projects', 'upcoming'); 
 UPDATE Event 
SET Status = 'completed' 
WHERE EventID = 101; 
DELETE FROM Event WHERE EventID = 106; 

ALTER TABLE Event 
ADD CONSTRAINT fk_event_venue FOREIGN KEY (VenueID) 
REFERENCES Venue(VenueID), 
ADD CONSTRAINT fk_event_organizer FOREIGN KEY (OrganizerID) 
REFERENCES Organizer(OrganizerID); 
 
ALTER TABLE Attendee 
ADD CONSTRAINT fk_attendee_event FOREIGN KEY (EventID) 
REFERENCES Event(EventID); 
 
ALTER TABLE Venue 
ADD CONSTRAINT fk_venue_event FOREIGN KEY (EventID) 
REFERENCES Event(EventID); 
 
ALTER TABLE Organizer 
ADD CONSTRAINT fk_organizer_event FOREIGN KEY (EventID) REFERENCES Event(EventID); 

SELECT e.EventID, e.EventName, e.EventDate, v.VenueName, v.Address 
FROM Event e 
INNER JOIN Venue v ON e.VenueID = v.VenueID; 
 
SELECT e.EventID, e.EventName, e.EventDate, v.VenueName, v.Address 
FROM Event e 
LEFT JOIN Venue v ON e.VenueID = v.VenueID;  #left join 
 
SELECT e.EventID, e.EventName, e.EventDate, v.VenueName, v.Address 
FROM Event e 
RIGHT JOIN Venue v ON e.VenueID = v.VenueID; 

SELECT e.EventID, e.EventName, e.EventDate, v.VenueName, v.Address FROM Event e 
LEFT JOIN Venue v ON e.VenueID = v.VenueID 
UNION 
SELECT e.EventID, e.EventName, e.EventDate, v.VenueName, v.Address 
FROM Event e 
RIGHT JOIN Venue v ON e.VenueID = v.VenueID 
WHERE e.VenueID IS NULL; 

SELECT e.EventID, e.EventName, v.VenueID, v.VenueName 
FROM Event e 
CROSS JOIN Venue v; 

CREATE VIEW EventDetails AS 
SELECT e.EventID, e.EventName, e.EventDate, e.EventTime, v.VenueName, v.Address 
FROM Event e 
INNER JOIN Venue v ON e.VenueID = v.VenueID; 
SELECT * FROM EventDetails; 

CREATE INDEX idx_event_date ON Event (EventDate); 

DELIMITER // 
CREATE PROCEDURE GetEventDetailsById (IN eventId INT) 
BEGIN 
    SELECT EventID, EventName, EventDate, EventTime 
    FROM Event 
    WHERE EventID = eventId; 
END // 
DELIMITER ; 

CALL GetEventDetailsById(101);  #store procedures 