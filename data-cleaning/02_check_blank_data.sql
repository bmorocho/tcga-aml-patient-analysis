#Identify columns with '--' data

SELECT 
SUM(CASE
		WHEN cases_submitter_id = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_submitter_id',
SUM(CASE
		WHEN age_at_index = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_age_at_index',
SUM(CASE
		WHEN days_to_death = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_days_to_death',
SUM(CASE
		WHEN race = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_race',
SUM(CASE
		WHEN sex_at_birth = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_sex_at_birth',
SUM(CASE
		WHEN vital_status = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_vital_status',
SUM(CASE
		WHEN age_at_diagnosis = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_age_at_diagnosis',
SUM(CASE
		WHEN days_to_diagnosis = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_days_to_diagnosis',
SUM(CASE
		WHEN days_to_last_follow_up = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_days_to_last_follow_up',
SUM(CASE
		WHEN days_to_recurrence = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_days_to_recurrence',
SUM(CASE
		WHEN eln_risk_classification = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_eln_risk_classification',
SUM(CASE
		WHEN fab_morphology_code = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_fab_morphology_code',
SUM(CASE
		WHEN primary_diagnosis = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_primary_diagnosis',
SUM(CASE
		WHEN prior_malignancy = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_prior_malignancy',
SUM(CASE
		WHEN prior_treatment = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_prior_treatment',
SUM(CASE
		WHEN progression_or_recurrence = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_progression_or_recurrence',
SUM(CASE
		WHEN residual_disease = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_residual_disease',
SUM(CASE
		WHEN year_of_diagnosis = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_year_of_diagnosis',
SUM(CASE
		WHEN therapeutic_agents = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_therapeutic_agents',
SUM(CASE
		WHEN treatment_or_therapy = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_treatment_or_therapy',
SUM(CASE
		WHEN treatment_outcome = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_treatment_outcome',
SUM(CASE
		WHEN treatment_type = '--' THEN 1
        ELSE 0
        END) AS 'sum_blank_treatment_type'
FROM aml_data
;
