USE hotel_reserv;

SELECT room_num AS room, COUNT(client_id) AS clients 
FROM reservations
GROUP BY room_num;

SELECT reservations.room_num, clients.cl_name, clients.phone_num, 
clients.email, reservations.day_of_departure
FROM clients JOIN reservations
ON clients.id = reservations.client_id;

SELECT clients.email, reviews.rating
FROM clients LEFT JOIN reviews
ON clients.id = reviews.client_id;

SELECT AVG(rating) AS avgReview, COUNT(reservations.client_id) AS clients 
FROM reviews RIGHT JOIN reservations 
ON reviews.client_id = reservations.client_id;


CREATE VIEW clientStatus
AS 
SELECT clients.cl_name, reservations.day_of_arrival, 
reservations.day_of_departure, reservations.room_num
FROM clients JOIN reservations
ON clients.id = reservations.client_id
WHERE reservations.day_of_departure <= CURDATE(); 

SELECT * FROM clientStatus; 