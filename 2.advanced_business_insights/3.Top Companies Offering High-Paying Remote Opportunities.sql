WITH market_avg AS (
    
    SELECT AVG(salary_year_avg) AS global_avg_salary
    FROM job_postings_fact
    WHERE salary_year_avg IS NOT NULL
)
SELECT 
    cd.name AS company_name,
    COUNT(jpf.job_id) AS remote_jobs_count,
    ROUND(AVG(jpf.salary_year_avg), 2) AS company_avg_salary,
    ROUND(m.global_avg_salary, 2) AS market_avg_salary
FROM 
    job_postings_fact jpf
INNER JOIN 
    company_dim cd ON jpf.company_id = cd.company_id
CROSS JOIN 
    market_avg m
WHERE 
    jpf.job_work_from_home = TRUE 
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
    cd.company_id,
    cd.name,
    m.global_avg_salary
HAVING 
    AVG(jpf.salary_year_avg) > m.global_avg_salary
    AND COUNT(jpf.job_id) >= 3 
ORDER BY 
    company_avg_salary DESC
LIMIT 10; 
