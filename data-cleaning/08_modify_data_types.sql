#Modify data type

ALTER TABLE aml_data
MODIFY COLUMN age_at_index INT,
MODIFY COLUMN days_to_death INT,
MODIFY COLUMN age_at_diagnosis INT,
MODIFY COLUMN days_to_last_follow_up INT,
MODIFY COLUMN year_of_diagnosis YEAR
;
