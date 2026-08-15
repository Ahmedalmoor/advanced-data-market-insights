SELECT 
    job_title_short,
    COUNT(job_id) AS total_postings,
    ROUND(PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY salary_year_avg)::numeric, 2) AS percentile_25,
    ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY salary_year_avg)::numeric, 2) AS median_salary_50,
    ROUND(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY salary_year_avg)::numeric, 2) AS percentile_75
FROM 
    job_postings_fact
WHERE 
    salary_year_avg IS NOT NULL
GROUP BY 
    job_title_short
HAVING 
    COUNT(job_id) > 50
ORDER BY 
    median_salary_50 DESC;