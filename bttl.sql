USE sakila;

-- 1. Lấy danh sách các quốc gia duy nhất
SELECT DISTINCT country FROM Person;

-- 2. Sắp xếp danh sách người theo tên đầy đủ (fullname) theo thứ tự tăng dần.
SELECT * FROM Person
ORDER BY fullname;

-- 3. Sắp xếp danh sách người theo nghề nghiệp (job) theo thứ tự giảm dần.
SELECT * FROM Person
ORDER BY job DESC;

-- 4. Lấy danh sách các nghề nghiệp (job) duy nhất mà người trong bảng đang làm.
SELECT DISTINCT job FROM Person;

-- 5. Lấy tổng số người theo từng quốc gia và sắp xếp theo số lượng người giảm dần.
SELECT country, COUNT(*) AS count
FROM Person
GROUP BY country
ORDER BY count DESC;

-- 6. Tính tổng lương (salary) của tất cả người trong bảng.
SELECT sum(salary) as "Total Salary"
FROM Person;

-- 7. Tính tổng lương trung bình của người theo từng nghề nghiệp (job) và sắp xếp theo lương trung bình tăng dần.
SELECT job, avg(salary) as "Average Salary"
FROM Person
GROUP BY job;

-- 8. Lấy ra người có lương (salary) lớn hơn 50000 và ngày sinh (birthday) nằm trong khoảng ‘1990-01-01’ đến ‘1995-12-31’.
SELECT * FROM Person
WHERE salary > 50000
AND birthday BETWEEN '1990-01-01' AND '1995-12-31';

-- 9. Lấy ra người có lương (salary) lớn hơn 60000 và nghề nghiệp (job) là ‘Developer’ hoặc ‘Engineer’.
SELECT * FROM Person
WHERE salary > 60000 AND (job = 'Developer' OR job = 'Engineer');

-- 10. Lấy ra danh sách các nghề nghiệp (job) duy nhất mà có ít nhất 3 người làm.
SELECT job, count(*)
FROM Person
GROUP BY job
HAVING count(*) >= 3;

-- 11. Lấy ra người nam (gender = ‘Male’) có lương (salary) cao nhất.
SELECT *
FROM Person
WHERE gender = 'M'
ORDER BY salary DESC
LIMIT 1;

-- 12. Lấy ra người nữ (gender = ‘Female’) có lương (salary) thấp nhất.
SELECT *
FROM Person
WHERE gender = 'F'
ORDER BY salary
LIMIT 1;

-- 13. Lấy danh sách người (không trùng lặp) theo thứ tự tên đầy đủ tăng dần.
SELECT DISTINCT fullname
FROM Person
ORDER BY fullname;

-- 14. Đếm số người sinh vào các tháng khác nhau và sắp xếp theo thứ tự tháng tăng dần.
SELECT MONTH(birthday) as 'Month of birthday', COUNT(*) as quantity
FROM Person
WHERE MONTH(birthday) BETWEEN 1 AND 12
GROUP BY MONTH(birthday)
ORDER BY quantity;