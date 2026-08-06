#Q3: Use CASE WHEN to categorize patients into age groups (e.g. <40, 40-60, 60+) and count patients per group.

SELECT
COUNT(CASE
		WHEN age_at_index < 40 THEN 1
	    END) AS '<40',
COUNT(CASE
		WHEN age_at_index >= 40 AND age_at_index <=60 THEN 1
	    END) AS '40-60',
COUNT(CASE
		WHEN age_at_index > 60 THEN 1
	    END) AS '60+'
FROM (SELECT DISTINCT cases_submitter_id, age_at_index
	  FROM aml_data) as distinct_table
;
