-- Procedure to fetch the feedback messages for the specified user ID
CREATE OR REPLACE PROCEDURE GetFeedbackMessagesByUserId(p_usr_id IN INTEGER) AS
BEGIN
    FOR feedback_record IN (SELECT Message FROM FEEDBACK WHERE Usr_id = p_usr_id) LOOP
        DBMS_OUTPUT.PUT_LINE('Feedback message: ' || feedback_record.Message);
    END LOOP;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No feedback found for the specified user ID.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END GetFeedbackMessagesByUserId;
/
BEGIN
    GetFeedbackMessagesByUserId(206);
END;
/

-- Procedure to retrieve owned taxis for different owner IDs
CREATE OR REPLACE PROCEDURE GetOwnedTaxisByOwnerId(p_owner_id IN INTEGER) AS
BEGIN
    FOR taxi_record IN (SELECT Taxi_id FROM OWNER_TAXI WHERE Owner_id = p_owner_id) LOOP
        DBMS_OUTPUT.PUT_LINE('Taxi ID owned by owner ' || p_owner_id || ': ' || taxi_record.Taxi_id);
    END LOOP;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No taxis found for the specified owner ID.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END GetOwnedTaxisByOwnerId;
/
BEGIN
    GetOwnedTaxisByOwnerId(701);
END;
/

-- Procedure to retrieve and display the owner ID for specified SSN
CREATE OR REPLACE PROCEDURE GetOwnerBySSN(p_ssn IN INTEGER) AS
    v_owner_id INTEGER;
BEGIN
    SELECT Owner_id INTO v_owner_id FROM INDIVIDUAL WHERE Ssn = p_ssn;
    IF v_owner_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Owner ID for SSN ' || p_ssn || ': ' || v_owner_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No owner found for the specified SSN.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No owner found for the specified SSN.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END GetOwnerBySSN;
/
BEGIN
    GetOwnerBySSN(783);
END;
/
