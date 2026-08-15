WITH job_skills AS (
    SELECT 
        sjd.job_id,
        sd.skills AS skill_name
    FROM 
        skills_job_dim sjd
    INNER JOIN 
        skills_dim sd ON sjd.skill_id = sd.skill_id
)
SELECT 
    js1.skill_name AS primary_skill,
    js2.skill_name AS paired_skill,
    COUNT(*) AS combination_frequency
FROM 
    job_skills js1
INNER JOIN 
    job_skills js2 ON js1.job_id = js2.job_id 
                   AND js1.skill_name < js2.skill_name
GROUP BY 
    js1.skill_name,
    js2.skill_name
ORDER BY 
    combination_frequency DESC
LIMIT 15; 