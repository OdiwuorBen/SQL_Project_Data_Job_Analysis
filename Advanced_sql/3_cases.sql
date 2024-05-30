--For January
CREATE TABLE January_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

--For February
CREATE TABLE February_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

--For March
CREATE TABLE March_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

    /*

        Label new column as follows:
        -'Anywhere' jobs as 'Remote'
        -'New York, NY' jobs as 'Local'
         Otherrwise 'Onsite'

    */

    SELECT 
        COUNT(job_id) AS number_of_jobs,
        CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
        END AS location_category
    FROM 
        job_postings_fact
    WHERE 
        job_title_short = 'Data Analyst'
    GROUP BY 
        location_category;

