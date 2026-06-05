CREATE DATABASE hr_attrition_project;
USE hr_attrition_project;
SELECT *
FROM hr_employee_attrition
LIMIT 10;
SELECT COUNT(*) AS total_employees
FROM hr_employee_attrition;
SELECT Attrition, COUNT(*) AS employee_count
FROM hr_employee_attrition
GROUP BY Attrition;
#attrition rate
SELECT 
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition;
#department-wise attrition
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY Department
ORDER BY attrition_rate_percent DESC;
#overtime attrition
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY OverTime
ORDER BY attrition_rate_percent DESC;

SELECT
    Department,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY Department, OverTime
ORDER BY Department, attrition_rate_percent DESC;

#income attrition
SELECT
    Attrition,
    COUNT(*) AS employee_count,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM hr_employee_attrition
GROUP BY Attrition;

SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium Income'
        ELSE 'High Income'
    END
ORDER BY attrition_rate_percent DESC;

SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium Income'
        ELSE 'High Income'
    END,
    OverTime
ORDER BY attrition_rate_percent DESC;
#jobrole attrition
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY attrition_rate_percent DESC;
#job satisfaction attrition
SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

SELECT
    CASE JobSatisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END AS job_satisfaction_level,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY
    CASE JobSatisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END
ORDER BY attrition_rate_percent DESC;
#worklife balance attrition
SELECT
    CASE WorkLifeBalance
        WHEN 1 THEN 'Bad'
        WHEN 2 THEN 'Good'
        WHEN 3 THEN 'Better'
        WHEN 4 THEN 'Best'
    END AS work_life_balance_level,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY
    CASE WorkLifeBalance
        WHEN 1 THEN 'Bad'
        WHEN 2 THEN 'Good'
        WHEN 3 THEN 'Better'
        WHEN 4 THEN 'Best'
    END
ORDER BY attrition_rate_percent DESC;
#yearsincelastpromotion attrition
SELECT
    YearsSinceLastPromotion,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;

SELECT
    CASE
        WHEN YearsSinceLastPromotion = 0 THEN 'Promoted Recently'
        WHEN YearsSinceLastPromotion BETWEEN 1 AND 3 THEN '1-3 Years Since Promotion'
        WHEN YearsSinceLastPromotion BETWEEN 4 AND 7 THEN '4-7 Years Since Promotion'
        ELSE '8+ Years Since Promotion'
    END AS promotion_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY
    CASE
        WHEN YearsSinceLastPromotion = 0 THEN 'Promoted Recently'
        WHEN YearsSinceLastPromotion BETWEEN 1 AND 3 THEN '1-3 Years Since Promotion'
        WHEN YearsSinceLastPromotion BETWEEN 4 AND 7 THEN '4-7 Years Since Promotion'
        ELSE '8+ Years Since Promotion'
    END
ORDER BY attrition_rate_percent DESC;
#age attrition
ALTER TABLE hr_employee_attrition
CHANGE COLUMN `ï»¿Age` Age INT;
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END
ORDER BY attrition_rate_percent DESC;
#Distance From Home.
SELECT
    CASE
        WHEN DistanceFromHome <= 5 THEN 'Near'
        WHEN DistanceFromHome BETWEEN 6 AND 15 THEN 'Moderate Distance'
        ELSE 'Far'
    END AS distance_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY
    CASE
        WHEN DistanceFromHome <= 5 THEN 'Near'
        WHEN DistanceFromHome BETWEEN 6 AND 15 THEN 'Moderate Distance'
        ELSE 'Far'
    END
ORDER BY attrition_rate_percent DESC;
#marital status
SELECT
    MaritalStatus,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY MaritalStatus
ORDER BY attrition_rate_percent DESC;
#business travels
SELECT
    BusinessTravel,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY BusinessTravel
ORDER BY attrition_rate_percent DESC;
#JOB LEVEL
SELECT
    JobLevel,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY JobLevel
ORDER BY attrition_rate_percent DESC;
SELECT
    JobLevel,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY JobLevel
ORDER BY JobLevel;

SELECT
    Department,
    JobRole,
    OverTime,
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_employee_attrition
GROUP BY
    Department,
    JobRole,
    OverTime,
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium Income'
        ELSE 'High Income'
    END
HAVING COUNT(*) >= 10
ORDER BY attrition_rate_percent DESC;

#to check duplicate data
SELECT
    EmployeeNumber,
    COUNT(*) AS duplicate_count
FROM hr_employee_attrition
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

#to check mssing rows
SELECT
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS missing_age,
    SUM(CASE WHEN Attrition IS NULL OR Attrition = '' THEN 1 ELSE 0 END) AS missing_attrition,
    SUM(CASE WHEN Department IS NULL OR Department = '' THEN 1 ELSE 0 END) AS missing_department,
    SUM(CASE WHEN JobRole IS NULL OR JobRole = '' THEN 1 ELSE 0 END) AS missing_job_role,
    SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS missing_monthly_income,
    SUM(CASE WHEN OverTime IS NULL OR OverTime = '' THEN 1 ELSE 0 END) AS missing_overtime
FROM hr_employee_attrition;

#to check unique values
SELECT DISTINCT Attrition FROM hr_employee_attrition;
SELECT DISTINCT Gender FROM hr_employee_attrition;
SELECT DISTINCT OverTime FROM hr_employee_attrition;
SELECT DISTINCT Department FROM hr_employee_attrition;
SELECT DISTINCT BusinessTravel FROM hr_employee_attrition;

#check muneric ranges
SELECT
    MIN(Age) AS min_age,
    MAX(Age) AS max_age,
    MIN(MonthlyIncome) AS min_income,
    MAX(MonthlyIncome) AS max_income,
    MIN(YearsAtCompany) AS min_years_company,
    MAX(YearsAtCompany) AS max_years_company,
    MIN(DistanceFromHome) AS min_distance,
    MAX(DistanceFromHome) AS max_distance
FROM hr_employee_attrition;

#create a clean analysis view
CREATE VIEW hr_attrition_analysis_view AS
SELECT
    *,
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS AgeGroup,
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS IncomeGroup,
    CASE
        WHEN DistanceFromHome <= 5 THEN 'Near'
        WHEN DistanceFromHome BETWEEN 6 AND 15 THEN 'Moderate Distance'
        ELSE 'Far'
    END AS DistanceGroup,
    CASE WorkLifeBalance
        WHEN 1 THEN 'Bad'
        WHEN 2 THEN 'Good'
        WHEN 3 THEN 'Better'
        WHEN 4 THEN 'Best'
    END AS WorkLifeBalanceLabel,
    CASE JobSatisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END AS JobSatisfactionLabel
FROM hr_employee_attrition;

SELECT *
FROM hr_attrition_analysis_view
LIMIT 10;