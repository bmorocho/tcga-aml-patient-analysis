#Q6: Find patients whose days to last follow up was above average using a subquery.

#Create distinct cases_submitter_id table
SELECT DISTINCT cases_submitter_id, days_to_last_follow_up
FROM aml_data
;

#Calculate distinct days_to_last_follow_up avg value
SELECT AVG(days_to_last_follow_up)
FROM (SELECT DISTINCT cases_submitter_id, days_to_last_follow_up
		FROM aml_data) AS avg_distinct_table
;

#Identify patients with days to last follow up > avg days to last follow up
SELECT cases_submitter_id
FROM (SELECT DISTINCT cases_submitter_id, days_to_last_follow_up
	FROM aml_data) AS distinct_table
WHERE days_to_last_follow_up > (SELECT AVG (days_to_last_follow_up)
								FROM (SELECT DISTINCT cases_submitter_id, days_to_last_follow_up
										FROM aml_data) AS avg_distinct_table)
;
