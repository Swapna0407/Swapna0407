drop car_care_service;
show  databases;
CREATE DATABASE Car_care_service;
USE Car_care_service;

DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(40),
    Role VARCHAR(20),
    Email VARCHAR(40),
    Password VARCHAR(50),
    PhoneNumber BIGINT,
    Address VARCHAR(100)
);

INSERT INTO Users (Name, Role, Email, Password, PhoneNumber, Address)
VALUES
    ('Anandh', 'customer', 'anandh432@gmail.com', '@nanDh!890#', 6458454698, 'mugalivakkam, chennai'),
    ('Sabarivasan', 'customer', 'sabari321@gmail.com', '$@bari*2145', 7845269845, 'Anna nagar, chennai'),
    ('Mogan', 'owner', 'mogan98d@gmail.com', 'MoGaN32@#1', 8541267845, 'Avadi, chennai'),
    ('Kanimozhi', 'customer', 'kanimozhishri786@gmail.com', 'Kani2809@!#', 947874562, 'Redhills, Chennai');

SELECT * FROM Users;

DROP TABLE IF EXISTS Car;

CREATE TABLE Car (
    CarID INT PRIMARY KEY,
    UserID INT,
    Brand VARCHAR(15),
    Model VARCHAR(15),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Car (CarID, UserID, Brand, Model)
VALUES
    (260, 2, 'SEAT', 'Ateca'),
    (261, 4, 'Tesla', 'Model X'),
    (262, 3, 'Toyota', 'Yaris'),
    (263, 1, 'Nissan', 'X-Trail');

SELECT * FROM Car;

DROP TABLE IF EXISTS ServiceCenter;

CREATE TABLE ServiceCenter (
    ServiceCenterID INT PRIMARY KEY,
    Name VARCHAR(20),
    Address VARCHAR(30),
    PhoneNumber INT,
    Email VARCHAR(20) CHECK (Email LIKE '%@%')
);

INSERT INTO ServiceCenter (ServiceCenterID, Name, Address, PhoneNumber, Email) 
VALUES 
    (101, 'swetha', 'chennai', 123345, 'swetha@gmail.com'),
    (105, 'swapna', 'vellore', 213454, 'swapna@gmail.com'),
    (103, 'nithvik', 'Tirichy', 54321, 'nithvik@gmail.com'),
    (102, 'venkat', 'coimbatore', 87654, 'venkat@gmail.com');

SELECT * FROM ServiceCenter;

DROP TABLE IF EXISTS Service;

CREATE TABLE Service (
    ServiceID INT PRIMARY KEY,
    ServiceCenterID INT,
    ServiceName VARCHAR(20),
    Description VARCHAR(100),
    Price INT,
    FOREIGN KEY (ServiceCenterID) REFERENCES ServiceCenter(ServiceCenterID)
);

INSERT INTO Service (ServiceID, ServiceCenterID, ServiceName, Description, Price)
VALUES 
    (41, 101, 'Oil Change', 'Quick and efficient oil replacement for optimal engine performance.', 200),
    (42, 102, 'Battery Service', 'Testing and replacement of car batteries for reliable starting.', 1000),
    (43, 103, 'Engine Tune-Up', 'Enhancing engine efficiency through adjustments and replacements.', 2000),
    (44, 105, 'A/C Service', 'Inspection and repair of air conditioning systems for comfort.', 5000);

SELECT * FROM Service;

DROP TABLE IF EXISTS Appointment;

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    CarID INT,
    ServiceID INT,
    AppointmentDate DATETIME,
    Status VARCHAR(20),
    FOREIGN KEY (CarID) REFERENCES Car(CarID),
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID)
);

INSERT INTO Appointment (AppointmentID, CarID, ServiceID, AppointmentDate, Status)
VALUES 
    (1001, 262, 41, '2023-01-15 00:00:00.000', 'Pending'),
    (1002, 261, 43, '2023-02-20 00:00:00.000', 'Completed'),
    (1003, 263, 42, '2023-04-05 00:00:00.000', 'Cancelled'),
    (1004, 260, 44, '2022-12-25 00:00:00.000', 'Completed');

SELECT * FROM Appointment;

DROP TABLE IF EXISTS Payment;

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentID INT,
    PaymentMethod VARCHAR(50),
    Amount INT,
    PaymentDate DATETIME,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

INSERT INTO Payment (PaymentID, AppointmentID, PaymentMethod, Amount, PaymentDate) 
VALUES 
    (11, 1001, 'Paytm', 500, '2019-10-20'), 
    (13, 1002, 'Gpay', 1000, '2019-12-03'),
    (12, 1003, 'cash', 200, '2008-10-19'),
    (14, 1004, 'check', 600, '2010-04-08');

SELECT * FROM Payment;

DROP TABLE IF EXISTS Feedback;

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Rating INT,
    Comment VARCHAR(100),
    FeedbackDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Feedback (FeedbackID, UserID, Rating, Comment, FeedbackDate)
VALUES 
    (54, 2, 4, 'Friendly and professional staff', '2023-03-20 00:00:00.000'),
    (55, 3, 5, 'First class service as always', '2023-04-11 00:00:00.000'),
    (56, 1, 3, 'All are good but they are asking more money', '2023-04-24 00:00:00.000'),
    (57, 4, 2, 'Very poor service, No response, Don`t go for it', '2023-01-12 00:00:00.000');






select*from Users;
select*from Car;
select*from ServiceCenter;
select*from Service;
select*from Appointment;
select*from Payment;
select*from Feedback;
 