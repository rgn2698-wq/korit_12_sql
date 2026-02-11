-- SELECT * FROM users u CROSS JOIN orders o;

SELECT
  u.id,
  u.username,
  u.city,
  u.country,
  s.last_name,
  s.first_name
FROM users u
JOIN staff s ON s.user_id = u.id;

SELECT 
	s.id,
	s.last_name,
	o.id,
	o.order_date
FROM staff s
JOIN orders o ON o.staff_id = s.id
WHERE s.id IN (3,5);

SELECT 
	u.country AS 국가,
	COUNT(*) AS 주문건수
FROM users u
JOIN orders o ON o.user_id = u.id
GROUP BY u.country
ORDER BY 주문건수 DESC;

SELECT
  o.user_id ,
  ROUND(SUM(od.quantity * p.price), 2) AS 정상가총합,
  ROUND(SUM(od.quantity * p.discount_price), 2) AS 할인가총합
FROM orders o
JOIN orderdetails od ON od.order_id = o.id
JOIN products p      ON p.id = od.product_id
GROUP BY o.user_id
ORDER BY 정상가총합 DESC;

(SELECT * FROM users) UNION ALL (SELECT * FROM users);

(SELECT id, phone, country, city FROM users)
UNION ALL
(SELECT id, phone, country, city FROM users)