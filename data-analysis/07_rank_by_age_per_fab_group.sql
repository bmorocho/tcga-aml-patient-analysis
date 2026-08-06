#Q7: Rank patients by age at diagnosis within each FAB morphology group using DENSE_RANK()

#Determine DISTINCT table
SELECT DISTINCT cases_submitter_id, FLOOR((age_at_diagnosis/365)) AS age, fab_morphology_code
FROM aml_data
;

#Rank patients by age within each FAB morph group
SELECT cases_submitter_id,
	DENSE_RANK() OVER(PARTITION BY fab_morphology_code ORDER BY age) AS row_rank
FROM (SELECT DISTINCT cases_submitter_id, FLOOR((age_at_diagnosis/365)) AS age, fab_morphology_code
	FROM aml_data) AS distinct_table
;
