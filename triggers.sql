-- Trigger to ensure unique registration number for TAXI table
CREATE OR REPLACE TRIGGER unique_registration_no
BEFORE INSERT OR UPDATE ON TAXI
FOR EACH ROW
DECLARE
    reg_no_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO reg_no_count
    FROM TAXI
    WHERE Registration_no = :NEW.Registration_no;

    IF reg_no_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Registration number must be unique.');
    END IF;
END;
/

-- Trigger to decrease driver rating if feedback is bad
CREATE OR REPLACE TRIGGER UPDATE_DRIVER_RATING
AFTER INSERT ON FEEDBACK
FOR EACH ROW
WHEN (NEW.Message LIKE '%bad%')
DECLARE
    v_driver_id INT;
BEGIN
    SELECT driver_id INTO v_driver_id FROM TRIP_DETAILS WHERE trip_id = :NEW.Trip_id;
    UPDATE DRIVER SET Rating = Rating - 1 WHERE driver_id = v_driver_id;
END;
/

-- Trigger to calculate the number of cars owned by the owner and update the No_Cars column in OWNS table
CREATE OR REPLACE TRIGGER ADD_NO_OF_CARS
BEFORE INSERT OR UPDATE ON OWNS
FOR EACH ROW
DECLARE
    v_no_of_cars INT;
BEGIN
    SELECT COUNT(Taxi_id) INTO v_no_of_cars FROM OWNER_TAXI WHERE Owner_id = :NEW.Owner_id GROUP BY Owner_id;
    :NEW.No_Cars := v_no_of_cars;
END;
/
