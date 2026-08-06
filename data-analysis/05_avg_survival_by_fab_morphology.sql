#Q5: What is the average days to death for deceased patients by FAB morphology code?

#Create temp table for vital status = 'Dead'
SELECT DISTINCT cases_submitter_id, fab_morphology_code, vital_status, days_to_death
FROM aml_data
WHERE vital_status = 'Dead'
;

#Calculate avg days to death per FAB morph subtype for deceased patients
SELECT fab_morphology_code, AVG(days_to_death) AS avg_days_to_death
FROM(SELECT DISTINCT cases_submitter_id, fab_morphology_code, vital_status, days_to_death
	FROM aml_data
	WHERE vital_status = 'Dead') as distinct_vital_table
GROUP BY fab_morphology_code
;
