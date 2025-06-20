
CREATE TABLE Staff (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    hire_date DATE,
    salary DECIMAL(10, 2)
);

CREATE TABLE roles (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(100),
    min_salary DECIMAL(10, 2),
    max_salary DECIMAL(10, 2),
    department_id INT
);

CREATE TABLE units (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    annual_budget DECIMAL(15, 2)
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_first_name VARCHAR(50),
    patient_last_name VARCHAR(50),
    admission_date DATE,
    discharge_date DATE
);

CREATE TABLE Supplies(
    supply_id INT PRIMARY KEY,
    supply_name VARCHAR(100),
    quantity_in_stock INT
);

CREATE TABLE Supplies_assigned (
    request_id INT,
    patient_id INT,
    supply_id INT,
    quantity_used INT,
    date_of_usage DATE,
    PRIMARY KEY (request_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (supply_id) REFERENCES Supplies(supply_id)
);

--Alter statements

ALTER TABLE Staff
MODIFY salary DECIMAL(15, 2);

ALTER TABLE Patients
ADD email VARCHAR(100);

ALTER TABLE Patients
ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE Patients
DROP COLUMN email;

ALTER TABLE roles
ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES Units(department_id);

ALTER TABLE staff
ADD CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES Roles(job_id);

--Insert statements
INSERT INTO staff(employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (1, 'John', 'Doe', 2, TO_DATE ('2022-01-15', 'YYYY-MM-DD'), 35000.00);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (2, 'Mark', 'Smith', 3, TO_DATE ('2022-05-23', 'YYYY-MM-DD'), 63000);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (3, 'Carry', 'Donovan', 1, TO_DATE ('2023-10-06', 'YYYY-MM-DD'), 77000);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (4, 'Lucas', 'Taylor', 4, TO_DATE ('2021-02-11', 'YYYY-MM-DD'), 50000);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (5, 'Chloe', 'Perez', 2, TO_DATE ('2022-03-20', 'YYYY-MM-DD'), 45000);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (6, 'Noah', 'Adams', 5, TO_DATE ('2020-09-01', 'YYYY-MM-DD'), 49000);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (7, 'Ava', 'Nelson', 3, TO_DATE ('2022-08-15', 'YYYY-MM-DD'),60000);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (8, 'Elijah', 'Carter', 6, TO_DATE ('2021-11-22', 'YYYY-MM-DD'), 47000);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (9, 'Grace', 'Mitchell', 1, TO_DATE ('2023-04-30', 'YYYY-MM-DD'), 87000);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (10, 'Logan', 'Gonzalez', 4, TO_DATE ('2020-07-13', 'YYYY-MM-DD'), 54000);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (11, 'Zoe', 'Rodriguez', 2, TO_DATE ('2021-10-10', 'YYYY-MM-DD'), 44000);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (12, 'Daniel', 'Hall', 6, TO_DATE ('2023-06-07', 'YYYY-MM-DD'), 37000);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (13, 'Ella', 'Scott', 3, TO_DATE ('2022-04-19', 'YYYY-MM-DD'), 60000);
INSERT INTO staff (employee_id, first_name, last_name, job_id, hire_date, salary)
VALUES (14, 'Jackson', 'Young', 1, TO_DATE ('2023-09-05', 'YYYY-MM-DD'), 85000);

SELECT * FROM staff; 

INSERT INTO roles (job_id, job_title, min_salary, max_salary, department_id)
VALUES (2, 'Nurse', 25000, 50000,2);
INSERT INTO roles (job_id, job_title, min_salary, max_salary, department_id)
VALUES (3, 'Doctor', 45000, 65000,3);
INSERT INTO roles (job_id, job_title, min_salary, max_salary, department_id)
VALUES (1, 'Surgeon', 50000, 90000,1);
INSERT INTO roles (job_id, job_title, min_salary, max_salary, department_id)
VALUES (4, 'Pharmacist', 40000, 70000, 7);
INSERT INTO roles (job_id, job_title, min_salary, max_salary, department_id)
VALUES (5, 'Radiologist', 45000, 75000, 1);
INSERT INTO roles (job_id, job_title, min_salary, max_salary, department_id)
VALUES (6, 'Physiotherapist', 30000, 60000, 2);
INSERT INTO roles (job_id, job_title, min_salary, max_salary, department_id)
VALUES (7, 'Anesthesiologist', 60000, 95000, 5);

SELECT * FROM roles;

INSERT INTO units (department_id, department_name, annual_budget)
VALUES (1, 'Emergency', 2200000.00);
INSERT INTO units (department_id, department_name, annual_budget)
VALUES (2, 'Orthopedics', 2000000);
INSERT INTO units (department_id, department_name, annual_budget)
VALUES (3, 'Pediatrics', 2500000);
INSERT INTO units (department_id, department_name, annual_budget)
VALUES (4, 'Radiology', 1800000);
INSERT INTO units (department_id, department_name, annual_budget)
VALUES (5, 'Cardiology', 3000000);
INSERT INTO units (department_id, department_name, annual_budget)
VALUES (6, 'Neurology', 2700000);
INSERT INTO units (department_id, department_name, annual_budget)
VALUES (7, 'Oncology', 3200000);

SELECT * FROM units;

INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (1, 'Alice', 'Smith', TO_DATE ('2023-03-11', 'YYYY-MM-DD'), TO_DATE ('2023-03-15', 'YYYY-MM-DD'));
INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (2, 'Malcom', 'Davis', TO_DATE ('2024-01-16', 'YYYY-MM-DD'), TO_DATE ('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (3, 'Ioana Alexandra', 'Ilinca', TO_DATE ('2025-01-16', 'YYYY-MM-DD'), TO_DATE ('2025-01-17', 'YYYY-MM-DD'));
INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (4, 'John', 'Raye', TO_DATE ('2022-12-20', 'YYYY-MM-DD'), TO_DATE ('2022-12-28', 'YYYY-MM-DD'));
INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (5, 'Emma', 'Johnson', TO_DATE ('2023-04-01', 'YYYY-MM-DD'), TO_DATE ('2023-04-10', 'YYYY-MM-DD'));
INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (6, 'Liam', 'Brown', TO_DATE ('2023-06-15', 'YYYY-MM-DD'), TO_DATE ('2023-06-20', 'YYYY-MM-DD'));
INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (7, 'Olivia', 'Garcia', TO_DATE ('2023-07-10', 'YYYY-MM-DD'), TO_DATE ('2023-07-18', 'YYYY-MM-DD'));
INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (8, 'Ethan', 'Martinez', TO_DATE ('2023-08-22', 'YYYY-MM-DD'), TO_DATE ('2023-08-25', 'YYYY-MM-DD'));
INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (9, 'Sophia', 'Lee', TO_DATE ('2023-09-12', 'YYYY-MM-DD'), TO_DATE ('2023-09-18', 'YYYY-MM-DD'));
INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (10, 'James', 'Hernandez', TO_DATE ('2023-10-03', 'YYYY-MM-DD'), TO_DATE ('2023-10-11', 'YYYY-MM-DD'));
INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (11, 'Isabella', 'Clark', TO_DATE ('2023-11-15', 'YYYY-MM-DD'), TO_DATE ('2023-11-22', 'YYYY-MM-DD'));
INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (12, 'Michael', 'Lopez', TO_DATE ('2024-01-10', 'YYYY-MM-DD'), TO_DATE ('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO patients (patient_id, patient_first_name, patient_last_name, admission_date, discharge_date)
VALUES (13, 'Mia', 'White', TO_DATE ('2024-02-25', 'YYYY-MM-DD'), TO_DATE ('2024-03-05', 'YYYY-MM-DD'));

SELECT * FROM patients;

INSERT INTO supplies (supply_id, supply_name, quantity_in_stock)
VALUES (1, 'Syringe', 500);
INSERT INTO supplies (supply_id, supply_name, quantity_in_stock)
VALUES (2, 'IV', 630);
INSERT INTO supplies (supply_id, supply_name, quantity_in_stock)
VALUES (3, 'Scalpels', 350);
INSERT INTO supplies (supply_id, supply_name, quantity_in_stock)
VALUES (4, 'Bandages', 1200);
INSERT INTO supplies (supply_id, supply_name, quantity_in_stock)
VALUES (5, 'Gloves', 2000);
INSERT INTO supplies (supply_id, supply_name, quantity_in_stock)
VALUES (6, 'Face Masks', 1500);
INSERT INTO supplies (supply_id, supply_name, quantity_in_stock)
VALUES (7, 'Thermometers', 300);
INSERT INTO supplies (supply_id, supply_name, quantity_in_stock)
VALUES (8, 'Stethoscopes', 100);

SELECT * FROM supplies;

INSERT INTO supplies_assigned (request_id, patient_id, supply_id, quantity_used, date_of_usage)
VALUES (171,1, 2, 1, TO_DATE('2023-11-12', 'YYYY-MM-DD'));
INSERT INTO supplies_assigned (request_id, patient_id, supply_id, quantity_used, date_of_usage)
VALUES (1432,2, 3, 1, TO_DATE ('2024-01-16', 'YYYY-MM-DD'));
INSERT INTO supplies_assigned (request_id, patient_id, supply_id, quantity_used, date_of_usage)
VALUES (1123, 3, 1, 2, TO_DATE('2025-01-16', 'YYYY-MM-DD'));
INSERT INTO supplies_assigned (request_id, patient_id, supply_id, quantity_used, date_of_usage)
VALUES (1204, 1, 4, 3, TO_DATE('2023-03-11', 'YYYY-MM-DD'));
INSERT INTO supplies_assigned (request_id, patient_id, supply_id, quantity_used, date_of_usage)
VALUES (1547, 2, 5, 2, TO_DATE('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO supplies_assigned (request_id, patient_id, supply_id, quantity_used, date_of_usage)
VALUES (1629, 3, 6, 1, TO_DATE('2025-01-17', 'YYYY-MM-DD'));
INSERT INTO supplies_assigned (request_id, patient_id, supply_id, quantity_used, date_of_usage)
VALUES (1780, 1, 3, 1, TO_DATE('2023-03-13', 'YYYY-MM-DD'));
INSERT INTO supplies_assigned (request_id, patient_id, supply_id, quantity_used, date_of_usage)
VALUES (1902, 2, 8, 1, TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO supplies_assigned (request_id, patient_id, supply_id, quantity_used, date_of_usage)
VALUES (2015, 3, 7, 4, TO_DATE('2025-01-16', 'YYYY-MM-DD'));
INSERT INTO supplies_assigned (request_id, patient_id, supply_id, quantity_used, date_of_usage)
VALUES (2156, 1, 2, 2, TO_DATE('2023-03-14', 'YYYY-MM-DD'));

SELECT * FROM supplies_assigned;

UPDATE staff
SET salary = 55000
WHERE employee_id = 5;

UPDATE supplies
SET quantity_in_stock = 700
WHERE supply_id = 3;

DELETE FROM patients
WHERE patient_id = 7;

DELETE FROM supplies_assigned
WHERE request_id = 171;

MERGE INTO staff target
USING (
    SELECT job_id, max_salary
    FROM roles
    WHERE job_id = 7
) source
ON (target.job_id = source.job_id)
WHEN NOT MATCHED THEN
    INSERT (employee_id, first_name, last_name, job_id, hire_date, salary)
    VALUES (15, 'Alice', 'Johnson', source.job_id, DATE '2024-02-20', source.max_salary);
    
    SELECT * FROM staff;


DELETE FROM staff;
-- employees with salaries greater than 50,000
SELECT * FROM staff
WHERE salary > 50000;

--patients whose admission date is before 2024
SELECT * FROM patients
WHERE admission_date < TO_DATE('2024-01-01', 'YYYY-MM-DD');

--patients with missing discharge dates
SELECT * FROM patients
WHERE discharge_date IS NULL;

--patients whose last name starts with 'S'
SELECT * FROM patients
WHERE patient_last_name LIKE 'S%';

--supplies that are either 'Syringe' or 'Bandages'
SELECT * FROM supplies
WHERE supply_name IN ('Syringe', 'Bandages');

--employees who were hired between 2022 and 2023
SELECT * FROM staff
WHERE hire_date BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD')
AND TO_DATE('2023-12-31', 'YYYY-MM-DD');

-- employees with salaries greater than any of the given values
SELECT * FROM staff
WHERE salary > ANY (SELECT salary FROM staff WHERE job_id = 3);


-- patients with admission dates earlier than all patients with a specific id
SELECT * FROM patients
WHERE admission_date < ALL (SELECT admission_date FROM patients WHERE patient_id = 8);


SELECT r.job_title, 
       SUM(s.salary) AS total_salary
FROM roles r
JOIN staff s ON r.job_id = s.job_id
GROUP BY r.job_title;

--employees and their roles
SELECT s.first_name, s.last_name, r.job_title 
FROM staff s
INNER JOIN roles r ON s.job_id = r.job_id;

--all patients and their supply usage, including patients who did not use supplies
SELECT p.patient_first_name, p.patient_last_name, sa.supply_id, sa.quantity_used
FROM patients p
LEFT JOIN supplies_assigned sa ON p.patient_id = sa.patient_id;

--all supplies and their usage by patients, including supplies that are not used
SELECT s.supply_name, sa.patient_id, sa.quantity_used
FROM supplies s
RIGHT JOIN supplies_assigned sa ON s.supply_id = sa.supply_id;

--total quantity of syringes used
SELECT SUM(quantity_used) AS total_syringes_used
FROM supplies_assigned
WHERE supply_id = 1;

--number of employees in each role
SELECT job_id, COUNT(*) AS employee_count
FROM staff
GROUP BY job_id;

--average salary per role
SELECT job_id, AVG(salary) AS avg_salary
FROM staff
GROUP BY job_id;

--roles with more than 3 employees
SELECT job_id, COUNT(*) AS employee_count
FROM staff
GROUP BY job_id
HAVING COUNT(*) > 2;

-- Format the hire date of employees as 'Month Day, Year'
SELECT first_name, last_name, TO_CHAR(hire_date, 'Month DD, YYYY') AS formatted_hire_date
FROM staff;

-- Extract the year from the patient's admission date
SELECT patient_first_name, patient_last_name, 
EXTRACT(YEAR FROM admission_date) AS admission_year
FROM patients;

-- Get the first 3 characters of the patient's last name
SELECT patient_first_name, SUBSTR(patient_last_name, 1, 3) AS short_last_name
FROM patients;

--employees hired within the last 2 years
SELECT * FROM staff
WHERE hire_date >= SYSDATE - 730;

-- display job title with custom labels based on salary
SELECT first_name, last_name,
       DECODE(salary, 50000, 'Mid-Level', 70000, 'Senior-Level', 'Junior-Level')
       AS job_level
FROM staff;

-- display patient's status based on discharge date
SELECT patient_first_name, patient_last_name,
       CASE
           WHEN discharge_date IS NULL THEN 'Currently Admitted'
           ELSE 'Discharged'
       END AS patient_status
FROM patients;

-- show 'Assigned' if the supply is assigned to any patient
SELECT supply_id, 
       CASE 
           WHEN quantity_used IS NULL THEN 'Not Assigned'
           ELSE 'Assigned'
       END AS assignment_status
FROM supplies_assigned;

-- unites employees with salaries over 70000 with the supplies that have a stock over 100 
SELECT employee_id, first_name
FROM staff
WHERE salary > 70000
UNION
SELECT supply_id, supply_name
FROM supplies
WHERE quantity_in_stock > 100;

-- find patients who have not used any supplies
SELECT patient_id FROM patients
MINUS
SELECT patient_id FROM supplies_assigned;

-- patients who are assigned both syringes and bandages
SELECT patient_id FROM supplies_assigned WHERE supply_id = 1
INTERSECT
SELECT patient_id FROM supplies_assigned WHERE supply_id = 4;

--employees who are earning a salary greater than the average salary for their job role
SELECT first_name, last_name, salary, job_id
FROM staff
WHERE salary > (SELECT AVG(salary) FROM staff WHERE job_id = staff.job_id);

--patients who used more supplies than the average quantity used by patients
SELECT patient_first_name, patient_last_name
FROM patients p
WHERE EXISTS (
    SELECT 1 FROM supplies_assigned sa
    WHERE sa.patient_id = p.patient_id
    GROUP BY sa.patient_id
    HAVING SUM(sa.quantity_used) > (
        SELECT AVG(quantity_used) FROM supplies_assigned WHERE patient_id = p.patient_id
    )
);

--a view for employees and their role information
CREATE VIEW employee_roles AS
SELECT s.first_name, s.last_name, r.job_title, r.min_salary, r.max_salary
FROM staff s
JOIN roles r ON s.job_id = r.job_id;

SELECT * FROM EMPLOYEE_ROLES;

--an index on the patient's last name to improve query performance
CREATE INDEX idx_patient_last_name ON patients(patient_last_name);

--a synonym for the patients table
CREATE SYNONYM patient_info FOR patients;

--a sequence for generating unique request IDs
CREATE SEQUENCE request_id_seq START WITH 1000 INCREMENT BY 1;

-- Retrieve patient names and discharge dates, displaying 'Still Admitted' if the discharge date is NULL
SELECT patient_first_name, 
       patient_last_name, 
       NVL(TO_CHAR(discharge_date, 'YYYY-MM-DD'), 'Still Admitted') AS discharge_status
FROM patients;

-- the hierarchy of employees in the hospital by salary
WITH ranked_employees AS (
    SELECT employee_id, first_name, last_name, salary,
           ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank
    FROM staff
)
SELECT employee_id, first_name, last_name, salary, LEVEL
FROM ranked_employees
START WITH rank = 1 
CONNECT BY PRIOR rank = rank - 1 
ORDER BY LEVEL;




