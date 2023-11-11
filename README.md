# Table of Contents
- [Welcome](#hr-employee-attrition-analysis)
- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Methodology](#methodology)
- [Structure of the Project](#structure-of-the-project)
    - [1. Overall Attrition Rate](#1-what-is-the-overall-attrition-rate-in-the-organization)
    - [2. Gender-Based Differences](#2-are-there-any-gender-based-differences-in-attrition-rates)
        - [Demographics of the Organization](#what-are-the-demographics-of-the-organization)
        - [Status of Work-Life Balance](#regarding-gender-what-is-the-status-of-work-life-balance-job-satisfaction-and-monthly-income)
        - [Factors for Wage Gap](#what-factors-may-be-responsible-for-the-gender-based-wage-gap)
    - [3. Job Roles and Departments](#3-how-do-different-job-roles-and-departments-within-the-company-compare-in-terms-of-attrition)
        - [Roles in Sales Department](#are-specific-roles-within-the-sales-department-more-prone-to-turnover)
        - [High Turnover Rate Causes](#what-is-contributing-to-the-high-turnover-rate-among-sales-representatives)
    - [4. Satisfaction and Income Analysis](#4-what-are-the-average-job-satisfaction-and-monthly-income-differences-between-employees-who-stay-and-those-who-leave)
    - [5. Trends and Patterns](#5-can-we-identify-any-significant-trends-or-patterns-that-contribute-to-employee-attrition)
- [Conclusion](#conclusion)

# HR Employee Attrition Analysis
Welcome to the HR Employee Attrition Analysis project! In this project, we delve into a comprehensive analysis of employee attrition within an organization using SQL. Employee attrition, or turnover, is a crucial HR metric that can impact an organization's performance, culture, and financial stability. Understanding the factors that contribute to attrition is essential for any company's success.

## Project Overview
Employee attrition, or turnover, is a crucial HR metric that can impact an organization's performance, culture, and financial stability. Understanding the factors that contribute to attrition is essential for any company's success.
- What is the overall attrition rate in the organization?
- Are there any gender-based differences in attrition rates?
- How do different job roles and departments within the company compare in terms of attrition?
- What is the average job satisfaction and monthly income among employees who stay vs. those who leave?
- Can we identify any significant trends or patterns that contribute to employee attrition?

## Dataset
In this analysis, we leverage the [IBM HR Analytics Employee Attrition & Performance]((https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)) dataset, a fictitious dataset created by IBM data scientists to explore various facets of employee attrition. This dataset encompasses a comprehensive profile of the workforce, detailing individual attributes such as gender, monthly income, and job satisfaction, alongside their respective roles and departmental affiliations.
<details>
    <summary><b>More about the Data</b></summary>
    
| Field Name         | Data Type   | Description                          |
|--------------------|------------|---------------------------------------|
| Age                | Integer    | Age of the employee                   |
| Attrition          | Boolean    | 'True' when employee has left the company. 'False' when still with company               |
| BusinessTravel     | String     | How often the employee travels for work|
| DailyRate          | Integer    | Daily rate for the employee           |
| Department         | String     | Department the employee works within  |
| DistanceFromHome   | Integer    | Distance the office is from employees home                 |
| Education          | Integer    | Level of Education the employee has received                 |
| EducationField     | String     | Field the employee received their education in                 |
| EmployeeCount      | Integer    | Always 1                              |
| EmployeeNumber     | Integer    | Employee ID Number                    |
| EnviromentSatisfaction  |Integer| Rates how satisfied the employee is with the work enviorment                |
| Gender             | String     | Employee's Gender                     |
| HourlyRate         | Integer    | Hourly Rate of income for employee    |
| JobInvolvement     | Integer    | The degree to which the employee identifies with their work                 |
| JobLevel           | Integer    | Level within their current job        |
| JobRole            | String     | Employees role within the company     |
| JobSatisfaction    | Integer    | Level of which the employee is satisfied   |
| MaritalStatus      | String     | Employees marital status              |
| MonthlyIncome      | Integer    | Monthly income received by the employee                |
| MonthlyRate        | Integer    | Monthly rate for the employee         |
| NumCompaniesWorked | Integer    | Number of companies the employee has worked for                |
| Over18             | Boolean    | 'True' if employee is over 18. 'False' if not                |
| OverTime           | Boolean    | 'True' if employee works overtime. 'False' if not                |
| PercentSalaryHike  | Integer    | Percentage of increase of employees salary                |
| PerformanceRating  | Integer    | Rating of employees performance on a 4 point scale                |
| RelationshipSatisfaction| Integer | Satisfaction level of employees relationship                |
| StandardHours      | Integer    | Standard hours for employees          |
| StockOptionLevel   | Integer    | Level at which an employee has a stock option                |
| TotalWorkingYears  | Integer    | Amount of years the employee has been working          |
| TrainingTimesLastYear| Integer  | Number of times an employee had training in the last year                |
| WorkLifeBalance    | Integer    | Level of which the employee is satisfied with their work life balance                |
| YearsAtCompany     | Integer    | Amount of time at the company                |
| YearsInCurrentRole | Integer    | Amount of time in current role                |
| YearsSinceLastPromotion |Integer| Amount of time sense last promotion               |
| YearsWithCurrManager| Integer   | Amount of time under current manager                |

</details>

## Methodology
To conduct this analysis, we employ SQL queries to aggregate and analyze the data. We use SQL to calculate attrition rates, average job satisfaction, and monthly income for different groups within the organization. Our goal is to provide actionable insights that can aid HR and management in making informed decisions to reduce attrition and enhance employee satisfaction.

## Structure of the Project
This Markdown file serves as the central documentation for our HR Employee Attrition Analysis project. It is organized into sections, each focusing on different aspects of the analysis.

--- 

### 1. What is the overall attrition rate in the organization?
 
Before exploring potential patterns or reasons behind the attrition statistics, our initial objective is to determine the overall attrition rate within the company. To accomplish this, we will examine the total number of employees and compare it to the number of employees who have left the organization.  

```sql
SELECT  
    (SUM(CASE WHEN Attrition = TRUE THEN 1 ELSE 0 END) / COUNT(Attrition)) * 100 AS Attrition_Rate
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`
```
In this SQL query, ```SUM``` with ```CASE WHEN``` counts how many employees have left (attrition is true), ```COUNT(Attrition)``` tallies all employees with a recorded attrition status, and the division followed by multiplication by 100 gives us the attrition percentage

When running this query, we obtain an attrition rate of 16.12%. Comparing this rate to the national average of [17.3%](https://www.imercer.com/articleinsights/workforce-turnover-trends) observed between 2022 and 2023, we find that the company's attrition rate is in line with the national average. Nevertheless, it's worth noting that many companies strive for an attrition rate of approximately 10%. Therefore, our analysis will continue to explore potential strategies and factors that may help the organization move closer to this target.

### 2. Are there any gender-based differences in attrition rates?
When examining key factors influencing a company's attrition rate, it's essential to consider the potential role of gender. To do this, we will analyze the percentage of attrition attributed to each gender.

```sql
SELECT  
    ROUND(
        (SUM(CASE WHEN Attrition = TRUE AND Gender = 'Female' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Attrition = TRUE THEN 1 ELSE 0 END)) * 100, 2
    ) AS Attrition_Rate_Female,
    ROUND(
        (SUM(CASE WHEN Attrition = TRUE AND Gender = 'Male' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN Attrition = TRUE THEN 1 ELSE 0 END)) * 100, 2
    ) AS Attrition_Rate_Male
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`
```
The provided SQL query calculates the percentage of male and female employees who have left the company (attrition) among all employees who have left. It employs the `CASE WHEN` construct within the `SUM` function to count specific conditions (female or male employees with attrition), dividing these counts by the total number of attritions to obtain a percentage. The `ROUND` function is then used to format these percentages to two decimal places. This approach effectively segments the attrition rate by gender, providing insights into gender-specific attrition trends within the organization.
| Attrition_Rate_Female | Attrition_Rate_Male |
|-----------------------|---------------------|
| 36.71                 | 63.29               |


When running the query, we discover that 36.71% of the employee turnover is attributed to females, while 63.29% is attributed to males. These results prompt me to consider whether these percentages closely align with the overall demographics of the organization.

#### What are the demographics of the organization?
Comparing the overall demographics is essential to ensure there isn't a significant discrepancy between employee turnover and the overall employee base. To achieve this, we execute a query that incorporates gender percentages within the company.

<details> <summary><b>Query of Attrition Rates vs Company Demographics</b></summary>
 
```sql
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
    FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`
```
</details>

| Attrition_Rate_Female | Attrition_Rate_Male | Percentage_Female | Percentage_Male |
|-----------------------|---------------------|-------------------|-----------------|
| 36.71                 | 63.29               | 40.0              | 60.0            |

A difference of 3.29% in employee turnover rates and the overall demographics between genders warrants further investigation in the context of both gender-specific attrition and the overall company demographics. Such a disparity suggests that gender may be a contributing factor to attrition within the organization. Analyzing this difference can provide valuable insights into potential gender-related factors affecting employee turnover. Additionally, understanding how this gender-specific attrition aligns with the company's total demographic distribution is crucial to assess whether there's a potential imbalance in the workforce and address any related concerns or disparities effectively.

#### Regarding gender, what is the status of work-life balance, job satisfaction, and monthly income?

When examining workplace gender disparities, several critical aspects come into focus, including the pay gap, work-life balance, job involvement, and overall job satisfaction. Given these considerations, it's vital to investigate whether these factors might contribute to the observed 3.29% difference. To explore this, we will run a query to calculate the gender-specific averages for these factors across the entire organization.

```sql
SELECT 
    Gender,
    ROUND(AVG(MonthlyIncome), 2) AS AVG_Monthly_Income,
    ROUND(AVG(WorkLifeBalance), 2) AS AVG_Work_Life_Balance,
    ROUND(AVG(JobInvolvement),2) AS AVG_Job_Involvement,
    ROUND(AVG(JobSatisfaction), 2) AS AVG_Job_Satisfaction
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition` 
GROUP BY Gender
```
This SQL query calculates the average monthly income, work-life balance, job involvement, and job satisfaction for each gender in the workforce. It uses the `AVG` function to compute these averages, groups the results by gender using the `GROUP BY` clause.
| Gender | AVG_Monthly_Income | AVG_Work_Life_Balance | AVG_Job_Involvement | AVG_Job_Satisfaction |
|--------|--------------------|------------------------|----------------------|-----------------------|
| Female | 6686.57            | 2.76                   | 2.71                 | 2.68                  |
| Male   | 6380.51            | 2.76                   | 2.74                 | 2.76                  |

It's important to note that the averages, excluding income, are derived from a 1-4 rating system as follows:
| Rating | Work-Life Balance | Job Involvement | Job Satisfaction |
|--------|-------------------|-----------------|------------------|
|    1   |  'Bad'            |    'Low'        |     'Low'        |
|    2   |  'Good'           |    'Medium'     |     'Medium'     |
|    3   |  'Better'         |    'High'       |     'High'       |
|    4   |  'Best'           |    'Very High'  |     'Very High'  |

The results of this query indicate that the average work-life balance, job involvement, and job satisfaction appear to be consistent across genders. However, the difference in average monthly income warrants further investigation into potential contributing factors.

#### What factors may be responsible for the gender-based wage gap?

The gender wage gap may be impacted by factors like education level, performance rating, tenure at the company, and overall work experience. While there could be other relevant factors, I view these as a robust starting point before delving into additional possibilities. To investigate further, we will run a query to calculate the averages of these factors based on gender.

```sql
SELECT 
    Gender,
    ROUND(AVG(Education), 2) AS AVG_Education_Level,
    ROUND(AVG(PerformanceRating), 2) AS AVG_Performance_Rating,
    ROUND(AVG(YearsAtCompany), 2) AS AVG_Company_Tenure,
    ROUND(AVG(TotalWorkingYears), 2) AS AVG_Total_Experience
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`
GROUP BY Gender

```
| Gender | AVG_Education_Level | AVG_Performance_Rating | AVG_Company_Tenure | AVG_Total_Experience |
|--------|----------------------|-------------------------|--------------------|-----------------------|
| Female | 2.93                 | 3.16                    | 7.23               | 11.73               |
| Male   | 2.90                 | 3.15                    | 6.86               | 10.98               |

<details>
    <summary><b>Meaning behind the numbers</b></summary>
Once again, it's important to clarify the interpretation of the numbers for average education level and average performance rating. While company tenure and total experience are measured in years, the values for education and performance ratings carry the following meanings:

| Number | Education Level | Performance Rating |
|--------|-----------------|--------------------|
|    1   | 'Below College' |   'Low'            |
|    2   | 'College'       |   'Good'           |
|    3   | 'Bachelor'      |   'Excellent'      |
|    4   | 'Master'        |   'Outstanding'    |
|    5   | 'Doctor'        |    NULL            |
</details>

   While the averages between genders appear to be relatively similar, there is a slight advantage in favor of female employees in each category. These findings could potentially contribute to the gender wage gap. 

### 3. How do different job roles and departments within the company compare in terms of attrition?

Another potential contributor to employee attrition is the employee's job role and department within the company. In this section, we will run queries to investigate whether specific departments and specific job roles play a more significant role than others in the current attrition rate within the organization.

```sql
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
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`
```
| Attrition_Rate_HR | Attrition_Rate_R&D | Attrition_Rate_Sales |
|-------------------|---------------------|----------------------|
| 5.06              | 56.12               | 38.82                |

Analyzing these figures while considering the company's composition, we observe that the sales department, which constitutes only 30% of the workforce, accounts for 38.82% of the total attrition in the organization. This disproportion is concerning and calls for a more detailed investigation to determine whether specific job roles within that department are more susceptible to turnover than others.

#### Are specific roles within the sales department more prone to turnover?

To answer this question, I executed a query to calculate both the percentage of attrition in the sales department contributed by each job role and the percentage that each job role constitutes within the entire department.

```sql
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
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`
```
| Attrition_Rate_Manager | Percentage_Manager | Attrition_Rate_Executive | Percentage_Executive | Attrition_Rate_Rep | Percentage_Rep |
|------------------------|--------------------|--------------------------|----------------------|-------------------|---------------|
| 2.17                   | 8.3                | 61.96                    | 73.09                | 35.87             | 18.61         |

These results speak volumes about a potential area for improvement within the company. The fact that Sales representatives contribute nearly double the turnover rate than what you'd expect based on their departmental representation should raise red flags within the company. It certainly warrants a more in-depth examination of the role.

#### What is contributing to the high turnover rate among Sales Representatives?

Now that we've identified retention challenges among Sales Representatives, we aim to explore potential contributing factors. We will examine average monthly income, performance rating, job satisfaction, and job involvement to compare with other roles in the sales department. While monthly income for all roles will be considered, it may be less influential, as Sales Representatives appear to earn less on average compared to Sales Executives and Managers, suggesting that these roles should typically have higher earnings.

```sql
SELECT 
  JobRole,
  ROUND(AVG(MonthlyIncome), 2) AS AVG_Monthly_Income,
  ROUND(AVG(PerformanceRating), 2) AS AVG_Performance_Rating,
  ROUND(AVG(JobSatisfaction), 2) AS AVG_Job_Satisfaction,
  ROUND(AVG(JobInvolvement), 2) AS AVG_Job_Involvement
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition`
WHERE Department = 'Sales'
GROUP BY JobRole
```
| JobRole             | AVG_Monthly_Income | AVG_Performance_Rating | AVG_Job_Satisfaction | AVG_Job_Involvement |
|---------------------|--------------------|-------------------------|----------------------|---------------------|
| Manager             | 16986.97           | 3.22                    | 2.76                 | 2.7                 |
| Sales Executive     | 6924.28            | 3.13                    | 2.75                 | 2.71                |
| Sales Representative | 2626.0            | 3.14                    | 2.73                 | 2.65                |

Based on these results, we can observe that there isn't a significant gap in the average performance rating or average job satisfaction between Sales Representatives and the other two roles. However, there is a noticeable dip in the average job involvement for Sales Representatives when compared to the others. This suggests that Sales Representatives may have lower passion for their role compared to the other roles, which could be a contributing factor to the higher attrition rate in this role.

### 4. What are the average job satisfaction and monthly income differences between employees who stay and those who leave?

When examining the key determinants that may influence whether employees remain with a company or depart, job satisfaction and monthly income emerge as prominent factors. Therefore, we will query the average job satisfaction and average monthly income for employees who have remained with the organization in comparison to those who have left. Additionally, we will include job involvement and performance rating in the query, as these factors can also play pivotal roles in employee retention.

```sql
SELECT  
    Attrition,
    ROUND(AVG(JobSatisfaction), 2) AS AVG_Job_Satisfaction,
    ROUND(AVG(JobInvolvement), 2) AS AVG_Job_Involvement,
    ROUND(AVG(PerformanceRating), 2) AS AVG_Performance_Rating,
    ROUND(AVG(MonthlyIncome), 2) AS AVG_Monthly_Income
FROM `ibm-hr-analytics-Employee_Attrition_Performance.Attrition` 
GROUP BY Attrition
```
| Attrition | AVG_Job_Satisfaction | AVG_Job_Involvement | AVG_Performance_Rating | AVG_Monthly_Income |
|-----------|-----------------------|---------------------|------------------------|-------------------|
| Stayed    | 2.78                  | 2.77                | 3.15                   | 6832.74           |
| Departed  | 2.47                  | 2.52                | 3.16                   | 4787.09           |

Examining the results of this query, we observe significant disparities in three major factors related to employee attrition. Average job satisfaction, average job involvement, and monthly income are notably lower for those who have left the organization. It's important to note that the average performance rating is relatively consistent between those who have departed and those who haven't. This suggests that most attrition is likely voluntary, driven by lower income and overall job dissatisfaction.

### 5. Can we identify any significant trends or patterns that contribute to employee attrition?
Our analysis of employee attrition patterns has revealed several key insights. Job satisfaction and monthly income stand out as critical factors influencing whether employees stay or leave the organization. Employees who are less satisfied with their jobs or receive lower incomes are more likely to depart. Additionally, job involvement also plays a significant role in employee retention.

To reduce the attrition rate from the current 16.12% to the industry-standard goal of 10%, the organization should focus on providing fair compensation, maintaining high job satisfaction, and promoting higher job involvement among employees. By addressing these factors consistently throughout the company, the organization can move closer to achieving the 10% attrition rate goal, ensuring a more stable and satisfied workforce.

---

## Conclusion
In the course of this project, we undertook a comprehensive analysis of employee attrition within the organization. By examining various factors and conducting queries on the HR dataset, we gained valuable insights into the drivers of employee retention and attrition.

Key findings from our analysis highlighted that job satisfaction and monthly income are pivotal determinants of attrition. Employees who reported lower job satisfaction or received lower incomes were more likely to leave the company. Additionally, we identified that job involvement also significantly influenced employee retention.

These insights provide actionable steps for the organization to reduce its attrition rate, currently at 16.12%, and work towards the industry-standard goal of 10%. To achieve this, it's imperative for the company to ensure employees receive fair compensation, maintain high job satisfaction, and encourage higher levels of job involvement across the organization.

In summary, this project sheds light on the critical factors contributing to employee attrition and offers a roadmap for the organization to enhance employee retention, ultimately fostering a more stable and contented workforce.
