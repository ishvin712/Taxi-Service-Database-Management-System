-- Cursor to fetch each registration number one by one, and display it for ‘Available’ taxis
DECLARE
    v_registration_no VARCHAR(20);
    CURSOR available_taxis_cursor IS
        SELECT Registration_no FROM TAXI WHERE Status = 'Available';
BEGIN 
    OPEN available_taxis_cursor;
    LOOP
        FETCH available_taxis_cursor INTO v_registration_no;
        EXIT WHEN available_taxis_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Available Taxi Registration No: ' || v_registration_no);
    END LOOP;
    CLOSE available_taxis_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        IF available_taxis_cursor%ISOPEN THEN
            CLOSE available_taxis_cursor;
        END IF;
END;
/

-- Cursor to retrieve all columns from the DRIVER table and display the details of each driver
DECLARE
    v_driver_id INTEGER;
    v_f_name VARCHAR(10);
    v_l_name VARCHAR(20);
    v_gender VARCHAR(10);
    v_contact_no VARCHAR(20);
    v_rating INTEGER;
    v_age INTEGER;
    CURSOR driver_cursor IS
        SELECT * FROM DRIVER;
BEGIN
    OPEN driver_cursor;
    LOOP
        FETCH driver_cursor INTO v_driver_id, v_f_name, v_l_name, v_gender, v_contact_no, v_rating, v_age;
        EXIT WHEN driver_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Driver ID: ' || v_driver_id || ', Name: ' || v_f_name || ' ' || v_l_name || ', Gender: ' || v_gender || ', Contact No: ' || v_contact_no || ', Rating: ' || v_rating || ', Age: ' || v_age);
    END LOOP;
    CLOSE driver_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        IF driver_cursor%ISOPEN THEN
            CLOSE driver_cursor;
        END IF;
END;
/
