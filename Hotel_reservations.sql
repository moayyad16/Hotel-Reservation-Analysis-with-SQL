SELECT *
FROM hotel_reservation_dataset;

-- The total number of reservations in the dataset
SELECT COUNT(*) AS total_reservations 
FROM hotel_reservation_dataset;

-- Which meal plan is the most popular among guests?
SELECT type_of_meal_plan, COUNT(*) AS count 
FROM hotel_reservation_dataset 
GROUP BY type_of_meal_plan 
ORDER BY count DESC 
;

-- The average price per room for reservations involving children?
SELECT avg(avg_price_per_room) as Aveage_number
FROM hotel_reservation_dataset
WHERE no_of_children>0;

-- How many reservations were made for the year 2018?
SELECT count(Booking_ID) as number_of_opp_in_2018
FROM hotel_reservation_dataset
WHERE arrival_date LIKE '%2018';

-- What is the most commonly booked room type?
SELECT room_type_reserved, count(*) count
FROM hotel_reservation_dataset
GROUP BY room_type_reserved
ORDER BY count DESC;

-- How many reservations fall on a weekend?
SELECT count(no_of_weekend_nights)
FROM hotel_reservation_dataset
WHERE no_of_weekend_nights > 0;

-- What is the highest and lowest lead time for reservations?
SELECT MAX(lead_time), MIN(lead_time) 
FROM hotel_reservation_dataset;

-- What is the most common market segment type for reservations?
SELECT distinct(market_segment_type), COUNT(market_segment_type) count
FROM hotel_reservation_dataset
GROUP BY market_segment_type
ORDER BY count DESC;

-- How many reservations have a booking status of "Confirmed"?
SELECT booking_status, COUNT(booking_status) count
FROM hotel_reservation_dataset
GROUP BY booking_status;

-- What is the total number of adults and children across all reservations?
SELECT SUM(no_of_adults), SUM(no_of_children)
FROM hotel_reservation_dataset;

-- What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights) 
FROM hotel_reservation_dataset
WHERE no_of_children>0;

-- How many reservations were made in each month of the year?
SELECT STRFTIME('%Y-%m', arrival_date) AS mon, COUNT(*) AS reservations
FROM hotel_reservation_dataset 
GROUP BY month 
ORDER BY month;

-- What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT AVG(no_of_week_nights + no_of_weekend_nights), room_type_reserved
FROM hotel_reservation_dataset
GROUP BY room_type_reserved
ORDER BY room_type_reserved;

-- For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT room_type_reserved, AVG(avg_price_per_room), COUNT(*) AS count
FROM hotel_reservation_dataset
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY count DESC;

-- Find the market segment type that generates the highest average price per room.
SELECT market_segment_type, AVG(avg_price_per_room) AS average_price
FROM hotel_reservation_dataset 
GROUP BY market_segment_type 
ORDER BY average_price DESC 
LIMIT 1;