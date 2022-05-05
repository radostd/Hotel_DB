USE hotel_reserv;

SELECT clients.cl_name, rooms.room_type, COUNT(reservations.client_id)
FROM clients JOIN reservations
ON clients.id = reservations.client_id
JOIN rooms 
ON reservations.room_num = rooms.id 
where count(reservations.client_id) >1
