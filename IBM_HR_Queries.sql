--Calculating the attrition rate at the organization
SELECT  
    (SUM(CASE WHEN Attrition = TRUE THEN 1 ELSE 0 END) / COUNT(Attrition)) * 100 AS Attrition_Rate
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`;

--Checking the demographics of the employees who have left the company
SELECT  
    ROUND(
        (SUM(CASE WHEN Attrition = TRUE AND Gender = 'Female' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Attrition = TRUE THEN 1 ELSE 0 END)) * 100, 2
    ) AS Attrition_Rate_Female,
    ROUND(
        (SUM(CASE WHEN Attrition = TRUE AND Gender = 'Male' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Attrition = TRUE THEN 1 ELSE 0 END)) * 100, 2
    ) AS Attrition_Rate_Male
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`;

--Comparing the demographics of the employees who have left the company and the company as a whole
SELECT  
    ROUND(
        (SUM(CASE WHEN Attrition = TRUE AND Gender = 'Female' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Attrition = TRUE THEN 1 ELSE 0 END)) * 100, 2
    ) AS Attrition_Rate_Female,
    ROUND(
        (SUM(CASE WHEN Attrition = TRUE AND Gender = 'Male' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Attrition = TRUE THEN 1 ELSE 0 END)) * 100, 2
    ) AS Attrition_Rate_Male,
    ROUND(
        (SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2
    ) AS Percentage_Female,
    ROUND(
        (SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2
    ) AS Percentage_Male
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`;

--Getting average values on different metrics in regards to gender
SELECT 
    Gender,
    ROUND(AVG(MonthlyIncome), 2) AS AVG_Monthly_Income,
    ROUND(AVG(WorkLifeBalance), 2) AS AVG_Work_Life_Balance,
    ROUND(AVG(JobInvolvement),2) AS AVG_Job_Involvement,
    ROUND(AVG(JobSatisfaction), 2) AS AVG_Job_Satisfaction
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition` 
GROUP BY Gender;

--Getting average values on different metrics in regards to gender
SELECT 
    Gender,
    ROUND(AVG(Education), 2) AS AVG_Education_Level,
    ROUND(AVG(PerformanceRating), 2) AS AVG_Performance_Rating,
    ROUND(AVG(YearsAtCompany), 2) AS AVG_Company_Tenure,
    ROUND(AVG(TotalWorkingYears), 2) AS AVG_Total_Experience
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`
GROUP BY Gender;

--Getting attrition rate of each department in the organization
SELECT 
    ROUND(
        (SUM(CASE WHEN Attrition = TRUE AND Department = 'Human Resources' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Attrition = TRUE THEN 1 ELSE 0 END)) * 100, 2
    ) AS Attrition_Rate_HR,
    ROUND(
        (SUM(CASE WHEN Attrition = TRUE AND Department = 'Research & Development' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Attrition = TRUE THEN 1 ELSE 0 END)) * 100, 2
    ) AS Attrition_Rate_RnD,
    ROUND(
        (SUM(CASE WHEN Attrition = TRUE AND Department = 'Sales' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Attrition = TRUE THEN 1 ELSE 0 END)) * 100, 2
    ) AS Attrition_Rate_Sales
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`;

--Getting attrition rate of employees in the sales department
SELECT 
    ROUND(
        (SUM(CASE WHEN Attrition = TRUE AND JobRole = 'Manager' AND Department = 'Sales' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Attrition = TRUE AND Department = 'Sales' THEN 1 ELSE 0 END)) * 100, 2
    ) AS Attrition_Rate_Manager,
    ROUND(
        (SUM(CASE WHEN JobRole = 'Manager' AND Department = 'Sales' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Department = 'Sales' THEN 1 ELSE 0 END)) * 100, 2
    ) AS Percentage_Manager,
    ROUND(
        (SUM(CASE WHEN Attrition = TRUE AND JobRole = 'Sales Executive' AND Department = 'Sales' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Attrition = TRUE AND Department = 'Sales' THEN 1 ELSE 0 END)) * 100, 2
    ) AS Attrition_Rate_Executive,
    ROUND(
        (SUM(CASE WHEN JobRole = 'Sales Executive' AND Department = 'Sales' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Department = 'Sales' THEN 1 ELSE 0 END)) * 100, 2
    ) AS Percentage_Executive,
    ROUND(
        (SUM(CASE WHEN Attrition = TRUE AND JobRole = 'Sales Representative' AND Department = 'Sales' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Attrition = TRUE AND Department = 'Sales' THEN 1 ELSE 0 END)) * 100, 2
    ) AS Attrition_Rate_Rep,
    ROUND(
        (SUM(CASE WHEN JobRole = 'Sales Representative' AND Department = 'Sales' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Department = 'Sales' THEN 1 ELSE 0 END)) * 100, 2
    ) AS Percentage_Rep
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`;

--Getting average values of different metrics for different roles in the sales department
SELECT 
  JobRole,
  ROUND(AVG(MonthlyIncome), 2) AS AVG_Monthly_Income,
  ROUND(AVG(PerformanceRating), 2) AS AVG_Performance_Rating,
  ROUND(AVG(JobSatisfaction), 2) AS AVG_Job_Satisfaction,
  ROUND(AVG(JobInvolvement), 2) AS AVG_Job_Involvement
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`
WHERE Department = 'Sales'
GROUP BY JobRole;

--Getting average values of different metrics in regards to employees who have left vs those who have stayed
SELECT  
    Attrition,
    ROUND(AVG(JobSatisfaction), 2) AS AVG_Job_Satisfaction,
    ROUND(AVG(JobInvolvement), 2) AS AVG_Job_Involvement,
    ROUND(AVG(PerformanceRating), 2) AS AVG_Performance_Rating,
    ROUND(AVG(MonthlyIncome), 2) AS AVG_Monthly_Income
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition` 
GROUP BY Attrition;
