WITH monthly_metrics AS (
    SELECT 
        EXTRACT(MONTH FROM job_posted_date) AS month_num,
        TO_CHAR(job_posted_date, 'Month') AS month_name,
        COUNT(job_id) AS total_jobs,
        ROUND(AVG(salary_year_avg), 2) AS avg_salary
    FROM 
        job_postings_fact
    WHERE 
        EXTRACT(YEAR FROM job_posted_date) = 2023
    GROUP BY 
        EXTRACT(MONTH FROM job_posted_date),
        TO_CHAR(job_posted_date, 'Month')
)
SELECT 
    month_name,
    total_jobs,
    
    total_jobs - LAG(total_jobs) OVER (ORDER BY month_num) AS job_growth,
    avg_salary,
    
    ROUND(avg_salary - LAG(avg_salary) OVER (ORDER BY month_num), 2) AS salary_change
FROM 
    monthly_metrics
ORDER BY 
    month_num; 