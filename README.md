🎟️ Event Management System

This project is a Database + UI Prototype for managing events, venues, attendees, and organizers. It demonstrates how SQL can be used to handle event-related operations while also providing interface mockups using Figma and a structured ERD (Entity-Relationship Diagram) with draw.io.

📌 Features Implemented
✅ Database (MySQL)

Created a relational database Events with proper normalization.

Tables included:

Event (details of each event)

Attendee (registered users for events)

Venue (locations for hosting events)

Organizer (event organizers)

Features covered:

Primary & Foreign Keys (relationships among Event, Venue, Attendee, Organizer)

Constraints (UNIQUE, NOT NULL, FOREIGN KEY)

ALTER TABLE (add, rename, drop columns)

JOINS (INNER, LEFT, RIGHT, CROSS, UNION)

Views (EventDetails for simplified querying)

Stored Procedures (GetEventDetailsById)

Indexes (idx_event_date for faster search by date)

DML Commands (INSERT, UPDATE, DELETE)

Aggregate Functions (COUNT, GROUP BY, HAVING)

Filtering & Sorting (LIKE, LIMIT, ORDER BY)

✅ ERD (Entity Relationship Diagram)

Designed with draw.io.

Shows relationships between:

Event ↔ Venue

Event ↔ Organizer

Event ↔ Attendee

Ensures referential integrity and 1-to-many relationships.

✅ UI Prototypes (Figma)

Designed interface mockups for:

Login Page

Signup Page

Welcome Page

Free Trial Page

Ensures a user-friendly flow for event participants and organizers.

📂 Database Schema
Event Table
Column	            Type	            Description
EventID	            INT (PK)	        Unique event ID
EventName	          VARCHAR(255)	    Name of the event
EventDate	          DATE            	Event date
EventTime	          TIME	            Event time
VenueID	INT         (FK)	            Venue hosting event
OrganizerID	        INT (FK)	        Organizer of event
AttendeeID	        INT (FK)	        Linked attendee
EventDescription	  TEXT	            Description
Status	            VARCHAR(50)	      upcoming / completed

(Similar schema documented for Attendee, Venue, Organizer tables)

📊 Example Queries

List all attendees of an event:

SELECT a.Name, a.Email, e.EventName
FROM Attendee a
JOIN Event e ON a.EventID = e.EventID;


Find venues with capacity greater than 2000:

SELECT * FROM Venue WHERE Capacity > 2000;


Get all events with their venues:

SELECT e.EventName, e.EventDate, v.VenueName
FROM Event e
JOIN Venue v ON e.VenueID = v.VenueID;


Get number of attendees per event (with filter):

SELECT EventID, COUNT(*) AS num_attendees
FROM Attendee
GROUP BY EventID
HAVING COUNT(*) > 1;


Call stored procedure:

CALL GetEventDetailsById(101);

🚀 Tools Used

MySQL – Database creation and querying

draw.io – Entity Relationship Diagram (ERD)

Figma – UI Wireframes (Login, Signup, Welcome, Free Trial)

📌 Learning Outcomes

Designed a complete database system for event management.

Understood normalization, relationships, joins, and constraints.

Implemented views, indexes, and stored procedures.

Practiced database operations with sample data.

Built UI mockups to connect backend logic with frontend design.

🔥 This project can be extended by connecting the MySQL backend with a web frontend (using Node.js, PHP, or Python Flask/Django) to make it a fully functional Event Management System.




