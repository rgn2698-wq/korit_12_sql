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

(SELECT id, phone, country, city FROM users WHERE country = 'Korea')
UNION ALL
(SELECT id, phone, country, city FROM users WHERE country = 'Mexico')
ORDER BY country ASC;

SELECT order_date FROM orders WHERE order_date LIKE '2015-10%' 
UNION ALL
SELECT order_date FROM orders WHERE order_date LIKE '2015-12%'
ORDER BY order_date DESC;

SELECT 
	id AS 아이디,
	phone AS 연락처,
	country AS 거주국가,
	city AS 거주도시,
	is_marketing_agree AS 마케팅수신동의여부
FROM users
WHERE country = 'USA' AND is_marketing_agree = 1
UNION ALL
SELECT 
	id AS 아이디,
	phone AS 연락처,
	country AS 거주국가,
	city AS 거주도시,
	is_marketing_agree AS 마케팅수신동의여부
FROM users
WHERE country = 'France' AND is_marketing_agree = 0
ORDER BY 거주국가 ASC;

SELECT *
	FROM orderdetails o LEFT JOIN products p
	ON o.product_id = p.id
UNION
SELECT *
	FROM orderdetails o RIGHT JOIN products p 
	ON o.product_id = p.id;
	
SELECT name, price, (SELECT ROUND(AVG(price), 2)
	FROM products) AS 평균가격 FROM products;

SELECT ROUND(AVG(price), 2) AS 평균가격
	FROM products;
	
SELECT name, price, AVG(price) AS 평균가격 FROM products;

SELECT city, COUNT(*) AS 회원수
	FROM users GROUP BY city
	HAVING COUNT(*) >= 3
	ORDER BY 회원수 DESC;
	
SELECT *
  FROM (
    SELECT city, COUNT(DISTINCT id) AS 도시별회원수 FROM users GROUP BY city
  ) a
  WHERE 도시별회원수 >= 3
  ORDER BY 도시별회원수 DESC;
  
SELECT *
	FROM staff s
	JOIN orders o ON o.staff_id = s.id
	WHERE s.last_name IN('kyle','Scott');
	
SELECT *
  FROM orders
  WHERE (staff_id, user_id) IN (
    SELECT id, user_id FROM staff WHERE last_name IN('kyle','Scott')
  );
  
SELECT *
	FROM products
	WHERE discount_price IN (
		SELECT MAX(discount_price) FROM products
		);
		
SELECT *
	FROM (
		SELECT * FROM orders WHERE order_date >= '2015-07-01' AND order_date < '2015-08-01'
	) o
	INNER JOIN (
		SELECT * FROM orderdetails WHERE quantity >= 50
		) od
	ON od.order_id = o.id;
		 
-- SELECT * FROM orders o INNER JOIN orderdetails od ON o.id = od.order_id WHERE (od.order_date >= '2015-07-01' AND < od.order_date '2015-08-01') AND (od.quantity > 49);

SELECT * ,
	ROUND(discount_price / (SELECT MAX
	(discount_price) FROM products), 3) AS 
	ratioPerMaxPrc FROM products;

SELECT 
	u.id AS 유저아이디,
	u.phone AS 연락처,
	u.country AS 거주국가,
	s.id AS 직원아이디,
	s.last_name AS 성,
	s.first_name AS 이름
	FROM (
		SELECT id, phone, country
		FROM users
		WHERE country IN ('Korea', 'Italy')
	) u
	JOIN staff s ON s.user_id = u.id
	WHERE s.birth_date < '1990-01-01';
	
SELECT 
	country,
	COUNT(*) AS 회원수
	FROM users
	GROUP BY country
	HAVING COUNT(*) >=5
	ORDER BY 회원수 DESC;
	
SELECT *
	FROM products
	WHERE price = (SELECT MIN(price) FROM products);
	
SELECT *
	FROM users u
	JOIN orders o ON o.user_id = u.id
	WHERE o.order_date >= '2016-01-01'
	AND o.order_date < '2017-01-01';