#Identify duplicates
SELECT cases_submitter_id,
	ROW_NUMBER() OVER(PARTITION BY cases_submitter_id ORDER BY cases_submitter_id) AS row_num
FROM aml_data
;

#Exploring what could be attributing to duplicate values in cases_submitter_id by referencing therapeutic_agents data
SELECT *
FROM (SELECT therapeutic_agents, cases_submitter_id, 
		ROW_NUMBER() OVER(PARTITION BY cases_submitter_id ORDER BY cases_submitter_id) AS row_num
	FROM aml_data) AS row_num_table
;
