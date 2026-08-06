#Q2: What is the average age at diagnosis by sex?

SELECT sex_at_birth, (AVG(age_at_diagnosis)/365) AS avg_age
FROM (SELECT DISTINCT cases_submitter_id, age_at_diagnosis, sex_at_birth
	  FROM aml_data) AS distinct_table
GROUP BY sex_at_birth
;
