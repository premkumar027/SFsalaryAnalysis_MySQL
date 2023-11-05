-- Use the 'data_new' database

-- 1. Show all columns and rows in the table.
SELECT * FROM salaries;

-- 2. Show only the EmployeeName and JobTitle columns.
SELECT EmployeeName, JobTitle FROM salaries;

-- 3. Show the number of employees in the table.
SELECT COUNT(*) FROM salaries;

-- 4. Show the unique job titles in the table.
SELECT DISTINCT JobTitle FROM salaries;

-- 5. Show the job title and overtime pay for employees with overtime pay greater than 50,000.
SELECT JobTitle, OvertimePay FROM salaries
WHERE OvertimePay > 50,000;

-- 6. Show the average base pay for all employees.
SELECT AVG(BasePay) AS "Avg BasePay" FROM salaries;

-- 7. Show the top 10 highest paid employees.
SELECT EmployeeName, TotalPay FROM salaries
ORDER BY TotalPay DESC
LIMIT 10;

-- 8. Show the average of BasePay, OvertimePay, and OtherPay for each employee.
SELECT EmployeeName, (BasePay + OvertimePay + OtherPay) / 3 AS "Avg of BasePay, OvertimePay, OtherPay" FROM salaries;

-- 9. Show all employees with "Manager" in their job title.
SELECT EmployeeName, JobTitle FROM salaries
WHERE JobTitle LIKE '%Manager%';

-- 10. Show all employees with a job title not equal to "Manager".
SELECT EmployeeName, JobTitle FROM salaries
WHERE JobTitle <> 'Manager';

-- 11. Show all employees with total pay between 50,000 and 75,000.
SELECT * FROM salaries
WHERE TotalPay BETWEEN 50,000 AND 75,000;

-- 12. Show all employees with base pay less than 50,000 or total pay greater than 100,000.
SELECT * FROM salaries
WHERE BasePay < 50,000 OR TotalPay > 100,000;

-- 13. Show all employees with total pay benefits between 125,000 and 150,000 and a job title containing "Director".
SELECT * FROM salaries
WHERE TotalPayBenefits BETWEEN 125,000 AND 150,000
AND JobTitle LIKE '%Director%';

-- 14. Show all employees ordered by their total pay benefits in descending order.
SELECT * FROM salaries
ORDER BY TotalPayBenefits DESC;

-- 15. Show all job titles with an average base pay of at least 100,000 and order them by average base pay in descending order.
SELECT JobTitle, AVG(BasePay) AS "Avg BasePay"
FROM salaries
GROUP BY JobTitle
HAVING AVG(BasePay) >= 100,000
ORDER BY "Avg BasePay" DESC;

-- 16. Delete the 'Notes' column from the table.
ALTER TABLE salaries
DROP COLUMN Notes;

-- 17. Update the base pay of all employees with the job title containing "Manager" by increasing it by 10%.
UPDATE salaries
SET BasePay = BasePay * 1.1
WHERE JobTitle LIKE '%Manager%';

-- 18. Delete all employees who have no OvertimePay.
DELETE FROM salaries
WHERE OvertimePay = 0;
