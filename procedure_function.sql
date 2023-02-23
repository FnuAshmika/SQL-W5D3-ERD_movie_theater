CREATE OR REPLACE PROCEDURE add_customer(
    customer_name VARCHAR(50),
    customer_email VARCHAR,
    customer_phone VARCHAR,
    billingInfo VARCHAR
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO customer ("name", email, phone, billing_info) 
    VALUES (customer_name, customer_email, customer_phone, billingInfo);
    COMMIT;
END;
$$ 

CALL add_customer('Albus Dumbledore','albus@hp.com', '(123)123-1234', '1010-1010-1010-1010' )
SELECT * FROM customer;

CREATE OR REPLACE PROCEDURE update_customer_phone(
    customerId INT,
    new_phone VARCHAR
)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE customer SET phone = new_phone 
   	WHERE customer_id = customerId;
    COMMIT;
END;
$$ 

CALL update_customer_phone(1, '(987)654-3210');
SELECT * FROM customer;

CREATE OR REPLACE FUNCTION get_total_staff(theaterId INTEGER)
RETURNS INTEGER 
LANGUAGE plpgsql AS $$
DECLARE 
	staff_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO staff_count
    FROM staff
    WHERE theater_id = theaterId;
    RETURN staff_count;
END;
$$ 

SELECT get_total_staff(1);