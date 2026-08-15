WITH job_skills_count AS (
    SELECT 
        jpf.job_id,
        jpf.salary_year_avg,
        COUNT(sjd.skill_id) AS skill_count
    FROM 
        job_postings_fact jpf
    INNER JOIN 
        skills_job_dim sjd ON jpf.job_id = sjd.job_id
    WHERE 
        jpf.salary_year_avg IS NOT NULL
    GROUP BY 
        jpf.job_id,
        jpf.salary_year_avg
)
SELECT 
    skill_count,
    COUNT(job_id) AS total_postings,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary,
    ROUND(MIN(salary_year_avg), 2) AS min_salary,
    ROUND(MAX(salary_year_avg), 2) AS max_salary
FROM 
    job_skills_count
GROUP BY 
    skill_count
HAVING 
    COUNT(job_id) >= 10
ORDER BY 
    skill_count ASC;