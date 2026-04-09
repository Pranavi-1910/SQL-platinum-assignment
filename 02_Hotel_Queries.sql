
/*question 1*/
SELECT b.user_id, b.room_no
FROM bookings b
JOIN (
    SELECT user_id, MAX(booking_date) AS last_booking
    FROM bookings
    GROUP BY user_id
) latest
ON b.user_id = latest.user_id 
AND b.booking_date = latest.last_booking;

/* question 2 */ 

SELECT 
    b.booking_id,
    SUM(i.item_rate * bc.item_quantity) AS total_bill
FROM bookings b
JOIN booking_commercials bc 
    ON b.booking_id = bc.booking_id
JOIN items i 
    ON bc.item_id = i.item_id
WHERE b.booking_date BETWEEN '2021-11-01' AND '2021-11-30'
GROUP BY b.booking_id;
/* question 3*/

SELECT 
    bc.bill_id,
    SUM(i.item_rate * bc.item_quantity) AS bill_amount
FROM booking_commercials bc
JOIN items i 
    ON bc.item_id = i.item_id
WHERE bc.bill_date BETWEEN '2021-10-01' AND '2021-10-31'
GROUP BY bc.bill_id
HAVING SUM(i.item_rate * bc.item_quantity) > 1000;
/*question 4*/
WITH t AS (
    SELECT MONTH(bill_date) m, item_id, SUM(item_quantity) qty
    FROM booking_commercials
    WHERE YEAR(bill_date) = 2021
    GROUP BY m, item_id
)
SELECT * FROM t
WHERE qty = (SELECT MAX(qty) FROM t t2 WHERE t2.m = t.m)
   OR qty = (SELECT MIN(qty) FROM t t2 WHERE t2.m = t.m);
   

/*question 5*/
SELECT month, user_id, total_bill
FROM (
    SELECT 
        MONTH(bc.bill_date) AS month,
        b.user_id,
        SUM(i.item_rate * bc.item_quantity) AS total_bill,
        DENSE_RANK() OVER (
            PARTITION BY MONTH(bc.bill_date) 
            ORDER BY SUM(i.item_rate * bc.item_quantity) DESC
        ) rnk
    FROM booking_commercials bc
    JOIN bookings b ON bc.booking_id = b.booking_id
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY MONTH(bc.bill_date), b.user_id
) t
WHERE rnk = 2;
