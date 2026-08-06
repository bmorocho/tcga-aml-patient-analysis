#Converting '--' values in days_to_last_follow_up to NULL

UPDATE aml_data
SET days_to_last_follow_up = NULL
WHERE days_to_last_follow_up = '--'
;

#Converting '--' values in therapeutic_agents to NULL

UPDATE aml_data
SET therapeutic_agents = NULL
WHERE therapeutic_agents = '--'
;
