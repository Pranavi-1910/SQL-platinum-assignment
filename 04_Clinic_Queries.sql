
--question 1 
SELECT sales_channel, SUM(amount) AS revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;

--question 2 
SELECT uid, SUM(amount) AS total_spent
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;

--question 3 
SELECT 
    MONTH(s.datetime) AS month,
    SUM(s.amount) AS revenue,
    SUM(e.amount) AS expense,
    SUM(s.amount) - SUM(e.amount) AS profit,
    CASE 
        WHEN SUM(s.amount) - SUM(e.amount) > 0 THEN 'Profit'
        ELSE 'Loss'
    END AS status
FROM clinic_sales s
JOIN expenses e ON s.cid = e.cid
WHERE YEAR(s.datetime) = 2021
GROUP BY MONTH(s.datetime);

--question 4 
SELECT city, cid, profit
FROM (
    SELECT 
        c.city,
        s.cid,
        SUM(s.amount) - SUM(e.amount) AS profit,
        RANK() OVER (PARTITION BY c.city ORDER BY SUM(s.amount)-SUM(e.amount) DESC) rnk
    FROM clinic_sales s
    JOIN clinics c ON s.cid = c.cid
    JOIN expenses e ON s.cid = e.cid
    WHERE MONTH(s.datetime) = 10 AND YEAR(s.datetime)=2021
    GROUP BY c.city, s.cid
) t
WHERE rnk = 1;

--question 5 
SELECT state, cid, profit
FROM (
    SELECT 
        c.state,
        s.cid,
        SUM(s.amount) - SUM(e.amount) AS profit,
        DENSE_RANK() OVER (PARTITION BY c.state ORDER BY SUM(s.amount)-SUM(e.amount)) rnk
    FROM clinic_sales s
    JOIN clinics c ON s.cid = c.cid
    JOIN expenses e ON s.cid = e.cid
    WHERE MONTH(s.datetime)=10 AND YEAR(s.datetime)=2021
    GROUP BY c.state, s.cid
) t
WHERE rnk = 2;
