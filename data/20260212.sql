-- 1. CREATE : 테이블생성
CREATE TABLE students (
	student_id INT AUTO_INCREMENT PRIMARY KEY,
	full_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE,
	birth_date DATE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- 컬럼 추가할 때
ALTER TABLE students ADD phone VARCHAR(20);

-- 컬럼 데이터 타입 수정
ALTER TABLE students MODIFY COLUMN full_name VARCHAR(100);

-- 테이블 삭제
-- DROP TABLE students;
-- INSERT
INSERT INTO students (full_name, email, birth_date)
	VALUES ('김일', 'kim1@test.com', '2026-02-12');
-- 여러 row 한번에 삽입
INSERT INTO students (full_name, email)
	VALUES ('김이','kim2@test.com'),
			('김삼','kim3@test.com');

-- UPDATE
UPDATE students SET birth_date = '1990-01-01'
	WHERE student_id = 2;
	
UPDATE students SET phone = '010-1234-5678'
	WHERE student_id = 1;
	
UPDATE students SET phone = '010-8765-4321'
	WHERE student_id = 2;
	
UPDATE students SET phone = '010-1234-8765'
	WHERE student_id = 3;
	
INSERT INTO students (full_name, email, phone)
	VALUES ('실수', 'mistake@test.com','010-1111-2222');


-- DELETE : 데이터 삭제
DELETE FROM students WHERE student_id = 4;




SELECT * FROM students WHERE student_id = 3;



-- INSERT INTO students2 (full_name, email) VALUES ('이이','lee2@test.com');
-- 
-- UPDATE students2 SET full_name = '이승우'
-- 	WHERE student2_id = 3;
-- 
-- UPDATE students2 SET email = 'test1@test.com'
-- 	WHERE student2_id = 3;
-- 
-- UPDATE students2 SET birth_date = '1999-11-18'
-- 	WHERE student2_id = 3;
-- 
-- UPDATE students2 SET phone = '010-5194-5814'
-- 	WHERE student2_id = 3;


-- SELECT * FROM students;

CREATE TABLE courses (
	courses_id INT AUTO_INCREMENT PRIMARY KEY,
	courses_name VARCHAR(100) NOT NULL,
	professor VARCHAR(50),
	credits INT DEFAULT 3
);

CREATE TABLE enrollments (
	enrollments_id INT AUTO_INCREMENT PRIMARY KEY,
	student_id INT,
   course_id INT,
   enroll_date DATE
--    CONSTRAINT fk_enrollments_course
--     FOREIGN KEY (course_id) REFERENCES courses(courses_id)
--     ON UPDATE CASCADE
--     ON DELETE RESTRICT
-- 	 CONSTRAINT fk_enrollments_student
--    	FOREIGN KEY (student_id) REFERENCES students(student_id)
);
   
   
INSERT INTO courses (courses_name, professor, credits)
	VALUES ('데이터베이스 기초' ,'강교수', 3),
			('자바프로그래밍' ,' 이교수', 4),
			('웹디자인' ,' 박교수', 2);

SELECT * FROM courses

INSERT INTO students (full_name, email, birth_date)
	VALUES
  ('학생1', 's1@test.com', '2000-01-01'),
  ('학생2', 's2@test.com', '2000-01-01');

INSERT INTO enrollments (student_id , course_id , enroll_date)
	VALUES
	(1, 1, '2026-02-01'),
	(1, 2, '2026-02-01'),
  	(2, 1, '2026-02-02');
  	
SELECT * FROM enrollments;
SELECT * FROM courses;
SELECT * FROM students;

-- 학생 1이 수강하고있는 과목, 등록날짜, 그 교수의 이름도 출력
	
SELECT
  s.student_id,
  s.full_name   AS 학생이름,
  c.courses_name AS 과목명,
  e.enroll_date  AS 등록날짜,
  c.professor    AS 교수명
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN courses c  ON c.courses_id = e.course_id
WHERE e.student_id = 1;

INSERT INTO students (full_name, email, birth_date, phone)
	VALUES ('박지민', 'park@test.com', '1995-05-05', '010-5555-6666');
	
INSERT INTO courses (courses_name, professor, credits)
	VALUES ('파이썬 프로그래밍', '최교수', 3);
	
INSERT INTO enrollments (student_id , course_id , enroll_date)
	VALUES
	(3, 4, '2026-02-12');

SELECT courses_name FROM courses WHERE professor = ' 이교수';

SELECT
	full_name AS 이름,
	phone AS 전화번호
	FROM students
	WHERE email LIKE '%test.com';
	
SELECT
  s.full_name   AS 학생이름,
  e.enroll_date AS 수강신청날짜
FROM enrollments e
JOIN courses c  ON c.courses_id = e.course_id
JOIN students s ON s.student_id = e.student_id
WHERE c.courses_name = '데이터베이스 기초'
ORDER BY e.enroll_date;
	
DESC enrollments;

UPDATE students SET phone = '010-1597-7533'
	WHERE student_id = 2;
	
UPDATE courses SET professor = '김교수'
	WHERE courses_id = 3;
	
UPDATE courses
	SET credits = credits + 1
	WHERE credits;
	
DELETE FROM students
	WHERE student_id = 2;
	
SELECT * FROM enrollments WHERE student_id = 2;

DELETE FROM enrollments
	WHERE student_id = 2; 
	
DELETE c
FROM courses c
LEFT JOIN enrollments e ON e.course_id = c.courses_id
WHERE e.course_id IS NULL;
