-- Creation of TAXI table
CREATE TABLE TAXI (
    Taxi_id INTEGER NOT NULL,
    Registration_no VARCHAR(20), 
    Taxi_Model VARCHAR(20),
    Taxi_Year DATE,
    Taxi_type VARCHAR(20),
    Status VARCHAR(20),
    Driver_id INTEGER,
    PRIMARY KEY (Taxi_id),
    UNIQUE (Registration_no)
);

-- Creation of USER_TBL table
CREATE TABLE USER_TBL (
    Usr_id INTEGER NOT NULL,
    F_name VARCHAR(20),
    L_name VARCHAR(20),
    Contact_no INTEGER,
    Gender VARCHAR(10),
    Address VARCHAR(50),
    Taxi_id INTEGER,
    PRIMARY KEY (Usr_id)
);

-- Creation of DRIVER table
CREATE TABLE DRIVER (
    Driver_id INTEGER NOT NULL,
    F_name VARCHAR(10),
    L_name VARCHAR(20),
    Gender VARCHAR(10),
    Contact_no VARCHAR(20),
    Rating INTEGER,
    Age INTEGER,
    PRIMARY KEY (Driver_id)
);

-- Creation of TRIP_DETAILS table
CREATE TABLE TRIP_DETAILS (
    Trip_id INTEGER NOT NULL,
    Trip_date DATE,
    Trip_amt DECIMAL(10,2),
    Driver_id INTEGER,
    Usr_id INTEGER,
    Taxi_id INTEGER,
    Strt_time TIMESTAMP,
    End_time TIMESTAMP,
    PRIMARY KEY (Trip_id)
);

-- Creation of BILL_DETAILS table
CREATE TABLE BILL_DETAILS (
    Bill_no INTEGER NOT NULL,
    Bill_date DATE,
    Advance_amt DECIMAL(10,2),
    Discount_amt DECIMAL(10,2),
    Total_amt DECIMAL(10,2),
    Usr_id INTEGER,
    Trip_id INTEGER,
    PRIMARY KEY (Bill_no),
    UNIQUE (Trip_id)
);

-- Creation of CUSTOMER_SERVICE table
CREATE TABLE CUSTOMER_SERVICE (
    Emp_id INTEGER NOT NULL,
    F_name VARCHAR(20),
    L_name VARCHAR(20),
    PRIMARY KEY (Emp_id)
);

-- Creation of FEEDBACK table
CREATE TABLE FEEDBACK (
    Fbk_id INTEGER NOT NULL,
    Message VARCHAR(140),
    Email VARCHAR(50),
    Emp_id INTEGER,
    Usr_id INTEGER,
    Trip_id INTEGER,
    PRIMARY KEY (Fbk_id),
    UNIQUE (Emp_id)
);

-- Creation of OWNS table
CREATE TABLE OWNS (
    Owner_id INTEGER NOT NULL,
    No_Cars INTEGER,
    PRIMARY KEY (Owner_id)
);

-- Creation of OWNER_TAXI table
CREATE TABLE OWNER_TAXI (
    Owner_id INTEGER NOT NULL,
    Taxi_id INTEGER,
    PRIMARY KEY (Owner_id, Taxi_id)
);

-- Creation of INDIVIDUAL table
CREATE TABLE INDIVIDUAL (
    Ssn INTEGER NOT NULL,
    Name VARCHAR(20),
    Owner_id INTEGER,
    PRIMARY KEY (Ssn)
);

-- Creation of TAXI_SERVICE_COMPANY table
CREATE TABLE TAXI_SERVICE_COMPANY (
    Tsc_id INTEGER NOT NULL,
    Tsc_name VARCHAR(20),
    Owner_id INTEGER,
    PRIMARY KEY (Tsc_id)
);
