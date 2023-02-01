SELECT *
FROM HRData;

-- What is the diversity percentage for the company?
SELECT RaceDesc,
	count(RaceDesc) as number_of_emp,
	count(RaceDesc) * 100.0 / sum(count(RaceDesc)) Over() as Percentage_of_race_pop
FROM HRData
Group by RaceDesc;


-- What is the turnover rate?
SELECT DateofTermination as total_leavers
FROM HRData
WHERE DateofTermination IS NOT NULL
Group by DateofTermination;


SELECT EmploymentStatus, count(EmpID) as number_emp_status
FROM HRData
WHERE EmploymentStatus = 'Active'
Group by EmploymentStatus;

-- What is the gender count for active employees in the company?

SELECT Sex AS Employee_Gender, count(Sex) as employee_gender_amount
FROM HRData
Where EmploymentStatus = 'Active'
Group by Sex;


-- How many employees make less that $100,000 yr?
SELECT employee_name, EmpID as Employee_ID, Position as Job_Title, State, Salary
From HRData
Where Salary < '100000';

-- What is the current headcount?
SELECT EmploymentStatus, count(EmpID) AS total_employee_per_status
FROM HRData
GROUP BY EmploymentStatus;

-- Where are majority of active employees located?
SELECT state, count(EmpID) AS employee_by_state
FROM HRData
WHERE EmploymentStatus = 'Active'
GROUP BY state;

-- What is our best sourcing effort?
SELECT RecruitmentSource, count(EmpID) AS amount_per_source
FROM HRData
GROUP BY RecruitmentSource;

-- Employee per department
SELECT Department, count(EmpID) AS headcount_per_dept, 
FROM HRData
GROUP BY Department;


-- Reasons employees left?
SELECT Employee_Name, TermReason AS Termination_reason 
FROM HRData
Where TermReason <> 'N/A-StillEmployed'
Group by Employee_Name, TermReason;

-- How many years have employees worked for the company?
SELECT Employee_Name, DATEDIFF(year, DateofHire, DateofTermination)  AS total_year 
FROM HRData
Where TermReason <> 'N/A-StillEmployed'
Group by Employee_Name, DateofHire, DateofTermination;

