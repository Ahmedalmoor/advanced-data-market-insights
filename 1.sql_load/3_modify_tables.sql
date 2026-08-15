
COPY company_dim
FROM 'E:\OneDrive - Arab Open University - AOU\sql_project\csv_files\company_dim.csv
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'E:\OneDrive - Arab Open University - AOU\sql_project\csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'E:\OneDrive - Arab Open University - AOU\sql_project\csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'E:\OneDrive - Arab Open University - AOU\sql_project\csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
