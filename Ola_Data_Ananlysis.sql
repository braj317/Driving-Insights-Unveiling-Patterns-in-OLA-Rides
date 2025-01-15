create database ola_db;
use ola_db;

select * from bookings_blr;

/* Retrieve all successful bookings: */
select * from bookings_blr where booking_status = 'Success';

/* Find the average ride distance for each vehicle type: */
select vehicle_type,avg(ride_distance) from bookings_blr group by vehicle_type;

/* Get the total number of cancelled rides by customers: */
select count(booking_id) from bookings_blr where booking_status like '%cancel%';

/* List the top 5 customers who booked the highest number of rides: */
select Customer_ID, count(booking_id) as bookings from bookings_blr group by customer_id order by bookings desc limit 5;

/* Get the number of rides cancelled by drivers due to personal and car-related issues: */
select count(booking_id) from bookings_blr where Canceled_Rides_by_Driver = 'Personal & Car related issue';

/* Find the maximum and minimum driver ratings for Prime Sedan bookings: */
select max(Driver_Ratings) as Max_Driver_Rating, min(Driver_Ratings) as Min_Driver_rating from bookings_blr;

/* Retrieve all rides where payment was made using UPI: */
select * from bookings_blr where payment_method = 'UPI';

/* Find the average customer rating per vehicle type */
select vehicle_type, avg(customer_rating) as average_customer_rating from bookings_blr group by vehicle_type;

/*Calculate the total booking value of rides completed successfully: */
select sum(Booking_Value) from bookings_blr where Incomplete_Rides = 'No';

/* List all incomplete rides along with the reason: */
select booking_id, customer_id, vehicle_type, Incomplete_Rides_Reason from bookings_blr where Incomplete_Rides = 'Yes';