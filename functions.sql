-- Function to check the availability of a taxi
CREATE OR REPLACE FUNCTION CheckTaxiAvailability(p_taxi_id IN INTEGER) RETURN VARCHAR2 AS
    v_status VARCHAR2(20);
BEGIN
    SELECT Status INTO v_status FROM TAXI WHERE Taxi_id = p_taxi_id;
    RETURN v_status;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Taxi not found';
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM;
END;
/
DECLARE
    v_taxi_status VARCHAR2(20);
BEGIN
    v_taxi_status := CheckTaxiAvailability(102);
    DBMS_OUTPUT.PUT_LINE('Taxi status: ' || v_taxi_status);
END;
/

-- Function to calculate the total trip amount for a given driver within a specified date range
CREATE OR REPLACE FUNCTION CalculateDriverTotalTripAmount(
    p_driver_id IN INTEGER,
    p_start_date IN DATE,
    p_end_date IN DATE
) RETURN DECIMAL AS
    v_total_trip_amount DECIMAL(10, 2) := 0;
BEGIN
    SELECT SUM(Trip_amt) INTO v_total_trip_amount
    FROM TRIP_DETAILS
    WHERE Driver_id = p_driver_id AND Trip_date BETWEEN p_start_date AND p_end_date;
    RETURN v_total_trip_amount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN -1;
END;
/
DECLARE
    v_driver_id INTEGER := 1;
    v_start_date DATE := TO_DATE('2022-09-16', 'YYYY-MM-DD');
    v_end_date DATE := TO_DATE('2023-12-31', 'YYYY-MM-DD');
    v_total_amount DECIMAL(10, 2);
BEGIN
    v_total_amount := CalculateDriverTotalTripAmount(v_driver_id, v_start_date, v_end_date);
    IF v_total_amount >= 0 THEN
        DBMS_OUTPUT.PUT_LINE('Total trip amount for driver ' || v_driver_id || ' between ' || v_start_date || ' and ' || v_end_date || ': ' || v_total_amount);
    ELSE
        DBMS_OUTPUT.PUT_LINE('An error occurred while calculating the total trip amount.');
    END IF;
END;
/

-- Function to retrieve the full name of the employee when the employee ID is given
CREATE OR REPLACE FUNCTION GetEmployeeFullName(p_emp_id IN INTEGER) RETURN VARCHAR2 AS
    v_full_name VARCHAR2(50);
BEGIN
    SELECT F_name || ' ' || L_name INTO v_full_name FROM CUSTOMER_SERVICE WHERE Emp_id = p_emp_id;
    RETURN v_full_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Employee not found';
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM;
END;
/
DECLARE
    v_employee_name VARCHAR2(50);
BEGIN
    v_employee_name := GetEmployeeFullName(502);
    DBMS_OUTPUT.PUT_LINE('Employee full name: ' || v_employee_name);
END;
/
