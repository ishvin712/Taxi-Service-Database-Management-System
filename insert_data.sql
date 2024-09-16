-- Inserting data into TAXI table
INSERT INTO TAXI VALUES(101, 'T0501', 'BENZE 300', TO_DATE('01/01/2017', 'dd/mm/yyyy'), 'SUV', 'Available', 1);
INSERT INTO TAXI VALUES(102, 'T0502', 'MACRO 500', TO_DATE('01/01/2016', 'dd/mm/yyyy'), 'Standard', 'Not Available', 2);
-- (Add other records similarly)

-- Inserting data into USER_TBL table
INSERT INTO USER_TBL VALUES(201, 'Raghav', 'Nayak', 9451277009, 'Male', 'Bengaluru', 105);
-- (Add other records similarly)

-- Inserting data into DRIVER table
INSERT INTO DRIVER VALUES(1, 'Amit', 'Sharma', 'Male', '9693805870', 5, 23);
-- (Add other records similarly)

-- Inserting data into TRIP_DETAILS table
INSERT INTO TRIP_DETAILS VALUES(301, TO_DATE('21/01/2023', 'dd/mm/yyyy'), 1100, 1, 206, 101, TO_TIMESTAMP('2023-01-21 06:14:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-21 08:14:00', 'YYYY-MM-DD HH24:MI:SS'));
-- (Add other records similarly)

-- Inserting data into BILL_DETAILS table
INSERT INTO BILL_DETAILS VALUES(401, TO_DATE('21/01/2023', 'dd/mm/yyyy'), 200, 100, 1100, 201, 301);
-- (Add other records similarly)

-- Inserting data into CUSTOMER_SERVICE table
INSERT INTO CUSTOMER_SERVICE VALUES(501, 'Sara', 'Maheshwari');
-- (Add other records similarly)

-- Inserting data into FEEDBACK table
INSERT INTO FEEDBACK VALUES(601, 'bad', 'seema_goel@gmail.com', 501, 206, 301);
-- (Add other records similarly)

-- Inserting data into OWNS table
INSERT INTO OWNS VALUES(701, 7);
-- (Add other records similarly)

-- Inserting data into OWNER_TAXI table
INSERT INTO OWNER_TAXI VALUES(701, 101);
-- (Add other records similarly)

-- Inserting data into INDIVIDUAL table
INSERT INTO INDIVIDUAL VALUES(783, 'Mahesh', 702);

-- Inserting data into TAXI_SERVICE_COMPANY table
INSERT INTO TAXI_SERVICE_COMPANY VALUES(981, 'ITC Car Company', 701);
