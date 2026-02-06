SELECT * FROM users 
	ORDER BY id ASC;

SELECT * FROM users 
	ORDER BY city ASC;

SELECT * FROM users 
	ORDER BY created_at DESC;

SELECT * FROM users 
	ORDER BY 1 DESC;

SELECT username, phone, city, country, id
	FROM users ORDER BY 1 ASC;
	
SELECT city, id FROM users
	ORDER BY city DESC, id ASC;
	
SELECT * FROM products
	ORDER BY price ASC;
	
SELECT * FROM orders
	ORDER BY order_date DESC;
	
SELECT * FROM orderdetails
	ORDER BY product_id DESC, quantity ASC;
	
SELECT COUNT(id) AS cnt FROM orderdetails;

SELECT COUNT(*) FROM users;

SELECT COUNT(country) FROM users;
  
SELECT DISTINCT country AS countries FROM users;

SELECT MIN(Price) FROM products;

SELECT MAX(discount_price) FROM products;

SELECT ROUND(SUM(Price),2) FROM products;

SELECT ROUND(AVG(Price),2) 
	AS avgPrice FROM products;
	
SELECT SUBSTR(created_at, 1, 10) FROM users;

SELECT SUBSTR(created_at, 1, 10) AS days,
		 SUBSTR(created_at, 1, 4) AS years,
		 SUBSTR(created_at, 1, 7) AS months,
		 		  created_at FROM users;
		 		  
SELECT LENGTH(username) AS len, username FROM users ORDER BY len;

SELECT ROUND(SUM(price),2) AS 합계 FROM products;

SELECT ROUND( AVG(price),2) AS 평균 FROM products
	WHERE id <= 30;
	
SELECT COUNT(DISTINCT id) AS 유저수
	FROM users
	WHERE SUBSTR(created_at,1,7) BETWEEN '2010-10' 
	AND '2010-12';
	
SELECT COUNT(DISTINCT id) AS 유저수
	FROM users
	WHERE LENGTH(username) <= 17;
	
SELECT COUNT(id) FROM users WHERE country = 'Korea';

SELECT COUNT(id) FROM users WHERE country = 'USA';

SELECT COUNT(country) FROM users WHERE country IN ('Korea', 'USA');

SELECT country, COUNT(DISTINCT id)
  AS 국가별회원수
  FROM users GROUP BY country
  
SELECT COUNT(DISTINCT country) FROM users;

SELECT COUNT(is_marketing_agree)
	FROM users
	WHERE country = 'Korea' 
  	AND is_marketing_agree = 1;
  	
SELECT COUNT(is_marketing_agree)
	FROM users
	WHERE country = 'UK' 
  	AND is_marketing_agree = 1;
  	
SELECT 
    country, is_marketing_agree AS 동의여부,
    COUNT(DISTINCT id ) AS 동의사용자
	FROM users
	GROUP BY country, is_marketing_agree
	ORDER BY country ASC, 동의사용자 DESC;