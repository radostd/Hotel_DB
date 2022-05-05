DROP DATABASE IF EXISTS hotel_reserv;
CREATE DATABASE hotel_reserv;
USE hotel_reserv;

CREATE TABLE rooms(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
room_type VARCHAR(255) NOT NULL,
room_view VARCHAR(20) NOT NULL,
num_of_beds INT NOT NULL,
num_of_baths INT NOT NULL,
balcony VARCHAR(5) NOT NULL
);

CREATE TABLE clients(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cl_name VARCHAR(255) NOT NULL,
phone_num VARCHAR(10) NOT NULL,
email VARCHAR(120) NOT NULL
);

CREATE TABLE reviews(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
client_id INT NOT NULL,
rating INT,
CONSTRAINT FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE reservations(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
client_id INT NOT NULL,
day_of_arrival DATE NOT NULL,
day_of_departure DATE NOT NULL,
room_num INT NOT NULL,
CONSTRAINT FOREIGN KEY (room_num) REFERENCES rooms(id),
CONSTRAINT FOREIGN KEY (client_id) REFERENCES clients(id),
UNIQUE KEY (room_num, client_id)
);


INSERT INTO rooms (room_type, room_view, num_of_beds, num_of_baths, balcony)
VALUES ('standart', 'NW', 2, 1, 'NO'),
	   ('studio', 'E', 1, 1, 'NO'),
       ('apartment', 'NW', 3, 2, 'YES'),
       ('maisonette', 'SE', 5, 3, 'YES'),
       ('standart', 'SW', 3, 1, 'YES'),
       ('studio', 'N', 2, 1, 'NO');
       
INSERT INTO clients (cl_name, phone_num, email)
VALUES ('Iva Nikolova', '0877445623', 'iva_nik@abv.bg'),
	   ('Georg Petrov', '0878673921', 'gpetrov@gmail.com'),
       ('Simon Lazarov', '0896345218', 's_lazar@mail.bg'),
       ('Katqa Pavlova', '0876535210', 'kp@abv.bg');
       
INSERT INTO reviews (client_id, rating)
VALUES (2, 4),
	   (4, 2),
       (1, 3);
       
INSERT INTO reservations (client_id, room_num, day_of_arrival, day_of_departure)
VALUES (1, 3, '2018-12-27', '2019-01-03'),
	   (4, 5, '2019-06-20', '2019-07-01'),
       (2, 2, '2019-04-14', '2019-04-20'),
       (3, 6, '2019-02-10', '2019-02-15');
       
