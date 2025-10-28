SELECT q1_jobs.job_id,
        skills.skills,
        skills.type,
        q1_jobs.salary_year_avg
FROM(SELECT job_id,salary_year_avg
FROM january_jobs

UNION ALL

SELECT job_id, salary_year_avg
FROM february_jobs

UNION ALL

SELECT job_id, salary_year_avg
FROM march_jobs) AS q1_jobs

LEFT JOIN skills_job_dim AS skills_to_job 
ON q1_jobs.job_id = skills_to_job.job_id

FULL JOIN skills_dim AS skills 
ON skills.skill_id = skills_to_job.skill_id

WHERE 
    q1_jobs.salary_year_avg > 70000