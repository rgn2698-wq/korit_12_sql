SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM staff;
SELECT * FROM users;

SELECT 'Hello SQL!' AS 인사 ;
-- SELECT "Hello SQL!";

SELECT 12+7;

SELECT 'Find' AS 'First', 'Insight' AS 'SECOND' , 'With SQL' AS 'Third';

SELECT 27 + 172 AS Plus,
       25 * 78  AS Times,
       'I love SQL!' AS Result;
       
SELECT *
	FROM users
	LIMIT 3
	;

SELECT *
	FROM orderdetails
	;
	
SELECT *
	FROM users
	LIMIT 7
	; 
	
SELECT id, user_id, order_date 
	FROM orders
	;
	
SELECT *
	FROM users
	WHERE country ='Korea'
	;
	
SELECT *
	FROM users
	WHERE country !='Korea'
	;
	
SELECT *
	FROM users
	WHERE country ='Korea' AND id = 10
	;
	
SELECT *
  	FROM users
  	WHERE created_at BETWEEN '2010-01-01' AND '2011-01-01'
  ;
  
SELECT *
	FROM users
	WHERE created_at >= '2010-12-01' AND created_at <= '2011-01-01'
	;
	
SELECT *
	FROM users
	WHERE country IN ('Korea','UK','USA')
	;
	
SELECT *
	FROM users
	WHERE country = 'Korea' OR country = 'UK' OR country = 'USA'
	;
	
SELECT *
	FROM users
	WHERE country NOT IN ('Korea','UK','USA')
	;
	
SELECT *
  FROM users
    WHERE country LIKE 'S%'
    ;
	 
SELECT *
  FROM users
    WHERE country LIKE '%a'
    ;

SELECT *
  FROM users
    WHERE country LIKE '%s%'
    ;

SELECT *
  FROM users
    WHERE country NOT LIKE 'S%'
    ;
    
SELECT *
  FROM users
  WHERE created_at IS null
  ;
  
SELECT *
	FROM users
	WHERE created_at IS NOT null
	;
	
SELECT id,
	created_at,
	phone,
	city,
	country
	FROM users
	WHERE country = 'Mexico'
	
SELECT *, (price - discount_price) AS discount_amount
  FROM products  
  WHERE id <= 20 AND price >= 30; 
  
SELECT *
  FROM users
  WHERE country NOT IN ('Korea','Canada','Belgium')
	
SELECT id, name, price
  FROM products
  WHERE name LIKE 'N%';
  
SELECT order_date
  FROM orders
  WHERE order_date NOT BETWEEN '2015-07-01' AND '2015-10-31';