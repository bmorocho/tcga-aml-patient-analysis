#Q1: What is the overall survival rate among AML patients in this dataset?

#Determine total DISTINCT rows for this question
SELECT COUNT(vital_status)
FROM (SELECT DISTINCT cases_submitter_id, vital_status
	  FROM aml_data) AS distinct_table
;

#Determine COUNT() for vital_status = 'Alive'

SELECT COUNT(vital_status) AS count_vital_status
FROM (
		SELECT DISTINCT cases_submitter_id, vital_status
		FROM aml_data
		WHERE vital_status = 'Alive'
        ) AS distinct_alive_table
;

#Combine above queries for calculation

SELECT DISTINCT (
		(SELECT COUNT(vital_status) AS count_vital_status
		 FROM (SELECT DISTINCT cases_submitter_id, vital_status
			   FROM aml_data
		       WHERE vital_status = 'Alive') AS distinct_alive_table) / 
        (SELECT COUNT(vital_status)
		FROM (SELECT DISTINCT cases_submitter_id, vital_status
				FROM aml_data) AS distinct_table)
		) * 100
 FROM aml_data       
;
