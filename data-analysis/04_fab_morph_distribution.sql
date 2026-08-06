#Q4: What is the distribution of AML patients by FAB morphology subtype?

#Approach 1 - Using window function
SELECT DISTINCT fab_morphology_code, 
	COUNT(fab_morphology_code) OVER(PARTITION BY fab_morphology_code) AS fab_morph_groups
FROM (SELECT DISTINCT cases_submitter_id, fab_morphology_code
	  FROM aml_data) as distinct_table
ORDER BY fab_morph_groups DESC
;

#Approach 2 - Using GROUP BY and COUNT
SELECT fab_morphology_code, COUNT(fab_morphology_code) AS count_fab_morph
FROM (SELECT DISTINCT cases_submitter_id, fab_morphology_code
	FROM aml_data) as distinct_table
GROUP BY fab_morphology_code
ORDER BY count_fab_morph DESC
;
