-- Exception handling when uniqueness property of primary key is violated
BEGIN
    INSERT INTO CUSTOMER_SERVICE VALUES(501, 'ASMI', 'JUNEJA');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('INSERT STATEMENT IS VIOLATING UNIQUE CONSTRAINT!');
END;
/

-- Exception handling when no data is found
BEGIN
    UPDATE OWNS SET NO_CARS = 10 WHERE OWNER_ID = 703;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('OWNER ID NOT FOUND!');
END;
/

-- Exception handling to handle duplicate Trip_id
DECLARE
    v_trip_count INT;
    duplicate_trip_id EXCEPTION;
    PRAGMA EXCEPTION_INIT(duplicate_trip_id, -20001);
BEGIN
    SELECT COUNT(*) INTO v_trip_count FROM BILL_DETAILS WHERE Trip_id = 301;
    IF v_trip_count > 0 THEN
        RAISE duplicate_trip_id;
    ELSE
        INSERT INTO BILL_DETAILS (Bill_no, Bill_date, Advance_amt, Discount_amt, Total_amt, Usr_id, Trip_id)
        VALUES (411, TO_DATE('2023-06-05', 'YYYY-MM-DD'), 150, 75, 600, 210, 301);
        COMMIT;
    END IF;
EXCEPTION
    WHEN duplicate_trip_id THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate Trip_id detected. Cannot insert the record.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END;
/
