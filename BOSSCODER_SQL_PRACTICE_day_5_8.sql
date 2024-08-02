################################################################################################################
# Day 5 Data Manupulation
#####
#	1. Retrieve all customers who do not have a phone number specified.

SELECT *
FROM customers
WHERE phone_number IS NULL;
#2. Find employees who were hired between two specific dates.

SELECT *
FROM employees
WHERE hire_date BETWEEN '2023-01-01' AND '2023-06-30';

#3. Retrieve the current date and time.


SELECT NOW() AS current_datetime;


# 4. Retrieve uppercase names of employees from the employees table.

#SELECT UPPER(employee_name) AS uppercase_name
SELECT UPPER(employee_name) AS uppercase_name
FROM employees;



#5. Find the average price of products after applying a 10% discount from the product table.

SELECT AVG(price * 0.90) AS average_discounted_price
FROM product;
#####################################################################################################################################

#Delete records from the customer table where last_login_date is older than 1 year.
DELETE FROM customer
WHERE last_login_date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);


#Delete records from the customer table where last_login_date is older than 1 year.

DELETE FROM customer
WHERE last_login_date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);


#Query 2: Insert new records into the employees table by selecting data from the temp_employees table.

INSERT INTO employees (employee_id, first_name, last_name, email, department, hire_date, salary)
SELECT employee_id, first_name, last_name, email, department, hire_date, salary
FROM temp_employees;


#Query 3: Update the discount column in the orders table by increasing it by 5% for all orders placed before a specific date.

UPDATE orders
SET discount = discount + (discount * 0.05)
WHERE order_date < 'YYYY-MM-DD';


#################################################################################################################################
#subqueries


#1. Find all employees who earn more than the average salary of employees in the employees table.
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


#2. Retrieve the names of products that have a price higher than the price of the most expensive product in the product table.
SELECT product_name
FROM product
WHERE price > (SELECT MAX(price) FROM product);


#3. Find customers who have placed orders in the orders table.
SELECT customer_id, customer_name
FROM customers
WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders);
#4. List the employees who work in departments with more than 10 employees.
SELECT employee_id, employee_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(*) > 10
);
#5. Get the names of students who scored above the average score in their class.
SELECT student_name
FROM students
WHERE score > (
    SELECT AVG(score)
    FROM students
    WHERE class_id = students.class_id
);

