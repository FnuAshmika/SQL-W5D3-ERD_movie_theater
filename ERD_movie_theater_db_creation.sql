DROP TABLE IF EXISTS customer CASCADE ;
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	"name" varchar(50),
	email varchar,
	phone varchar,
	billing_info varchar NOT NULL 
);
INSERT INTO customer (name, email, phone, billing_info)
VALUES 
	('Dylan Smith', 'dylan@codingtemple.com', '1212121212', '1234-1234-1234-1234'),
	('Lucas Lang', 'lucas@codingtemple.com', '1313131313', '4242-4242-4242-4242');
SELECT * FROM customer;

CREATE TABLE theater(
	theater_id SERIAL PRIMARY KEY ,
	theater_name varchar(50),
	address text

);
INSERT INTO theater (theater_name, address)
VALUES
	('Cinemark', '123 Main St, Plano, TX'),
	('AMC Theatres', '555 Down St, Dallas, TX');
SELECT * FROM theater;

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY ,
	movie_title varchar(100),
	description TEXT,
	run_time decimal
);
INSERT INTO movie (movie_title, description, run_time)
VALUES
    ('Harry Potter', 'A young wizard must stop the dark wizard Voldemort from obtaining a powerful magical object.', 2.32),
    ('Fantastic Beasts', 'The adventures of writer Newt Scamander in secret community of witches and wizards.', 2.13);
SELECT * FROM movie;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff(
	staff_id SERIAL PRIMARY KEY ,
	theater_id int NOT NULL,
	FOREIGN KEY (theater_id) REFERENCES theater (theater_id),
	staff_name varchar(50) NOT NULL ,
	staff_email varchar NOT NULL ,
	staff_phone varchar 
);
INSERT INTO staff (theater_id, staff_name, staff_email, staff_phone)
VALUES
	(1, 'Harry Potter', 'harry@hogwarts.com', '(123)456-7890'),
	(2, 'Lord Voldermort', 'voldy@hogwarts.com', '(987)654-3210');
SELECT * FROM staff;

CREATE TABLE concession_product(
	product_id SERIAL PRIMARY KEY ,
	theater_id int NOT NULL,
	FOREIGN KEY (theater_id) REFERENCES theater (theater_id),
	product_name varchar(50),
	product_price float
);
INSERT INTO concession_product (theater_id, product_name, product_price)
VALUES
	(1, 'Popcorn', 6.99),
	(2, 'Soda', 2.49);
SELECT * FROM concession_product;

CREATE TABLE seating_arrangement(
	seat_id SERIAL PRIMARY KEY ,
	theater_id int NOT NULL,
	FOREIGN KEY (theater_id) REFERENCES theater (theater_id),
	seat_row varchar,
	seat_number int,
	seat_status boolean
);
INSERT INTO seating_arrangement (theater_id, seat_row, seat_number, seat_status)
VALUES
	(1, 'A', 1, false),
	(2, 'B', 2, true);
SELECT * FROM seating_arrangement;

CREATE TABLE show_time(
	show_time_id SERIAL PRIMARY KEY ,
	movie_id int NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
	theater_id int NOT NULL,
	FOREIGN KEY (theater_id) REFERENCES theater (theater_id),
	show_time time,
	show_date date
);
INSERT INTO show_time (movie_id, theater_id, show_time, show_date)
VALUES
	(1, 1, '13:00:00', '02-25-2023'),
	(2, 2, '17:30:00', '02-25-2023');
SELECT * FROM show_time;

CREATE TABLE review(
	review_id SERIAL PRIMARY KEY,
	movie_id int NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
	customer_id int NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
	customer_comment TEXT,
	customer_rating float
);
INSERT INTO review (movie_id, customer_id, customer_comment, customer_rating)
VALUES
	(1, 1, 'Magical movie, loved it!', 4.9),
	(2, 2, 'Great movie, highly recommend!', 4.5);
SELECT * FROM review;

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY ,
	movie_id int NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
	customer_id int NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
	ticket_price float,
	ticket_time time,
	ticket_date date
);
INSERT INTO ticket (movie_id, customer_id, ticket_price, ticket_time, ticket_date)
VALUES
	(1, 1, 9.50, '13:00:00', '02-25-2023'),
	(2, 2, 12.00, '17:30:00', '02-25-2023');
SELECT * FROM ticket;

CREATE TABLE concession_purchase(
	pruchase_id SERIAL PRIMARY KEY ,
	ticket_id int NOT NULL,
	FOREIGN KEY (ticket_id) REFERENCES ticket (ticket_id),
	total_amount float
);
INSERT INTO concession_purchase (ticket_id, total_amount)
VALUES
	(1, 9.48),
	(2, 6.99);
SELECT * FROM concession_purchase ;


