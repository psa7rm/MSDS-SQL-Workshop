-- Create the database that will store tables
CREATE DATABASE `Company`;

-- Instruct mysql to use this newly created database.
USE `Company`;

-- Create Company's client Table
CREATE TABLE Clients (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    ClientName VARCHAR(255),
    Industry VARCHAR(255),
    ContactName VARCHAR(255),
    ContactEmail VARCHAR(255),
    Address TEXT
);


-- Create Employee Table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Department VARCHAR(255),
    Position VARCHAR(255),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

-- Create Projects Table
CREATE TABLE Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(10, 2),
    Status VARCHAR(100)
);

-- Create Pursuits Table for Business Development
CREATE TABLE Pursuits (
    PursuitID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),
    Description TEXT,
    StartDate DATE,
    EstimatedEndDate DATE,
    Budget DECIMAL(10, 2),
    Stage ENUM('initiated', 'proposing', 'closing') NOT NULL,
    Notes VARCHAR(100)
);


--
-- Mapping Tables
--

-- Mapping Table: Employees -> Projects
CREATE TABLE EmployeeProjectMap (
    EmployeeID INT,
    ProjectID INT,
    Role VARCHAR(255),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    PRIMARY KEY (EmployeeID, ProjectID)
);

-- Mapping Table: Employees -> Pursuits
CREATE TABLE EmployeePursuitsMap (
    EmployeeID INT,
    PursuitID INT,
    Role VARCHAR(255),
    Contribution TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (PursuitID) REFERENCES Pursuits(PursuitID),
    PRIMARY KEY (EmployeeID, PursuitID)
);

-- Mapping Table: Pursuits -> Projects
CREATE TABLE PursuitProjectMap (
    PursuitID INT,
    ProjectID INT,
    FOREIGN KEY (PursuitID) REFERENCES Pursuits(PursuitID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    PRIMARY KEY (PursuitID, ProjectID)
);

-- Mapping Table: Projects -> Clients
CREATE TABLE ProjectClientMap (
    ProjectID INT,
    ClientID INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    PRIMARY KEY (ProjectID, ClientID)
);

-- Mapping Table: Pursuits -> Clients
CREATE TABLE PursuitClientMap (
    PursuitID INT,
    ClientID INT,
    FOREIGN KEY (PursuitID) REFERENCES Pursuits(PursuitID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    PRIMARY KEY (PursuitID, ClientID)
);