#Check to see if fully '--' columns are NULL

SELECT COUNT(days_to_recurrence) AS null_count_days_to_recurrence, 
	COUNT(eln_risk_classification) AS null_count_eln_risk_classification, 
    COUNT(progression_or_recurrence) AS null_count_progression_or_recurrence, 
    COUNT(residual_disease) AS null_count_residual_disease, 
    COUNT(treatment_outcome) AS null_count_treatment_outcome
FROM aml_data
WHERE days_to_recurrence IS NULL 
	OR eln_risk_classification IS NULL 
    OR progression_or_recurrence IS NULL
    OR residual_disease IS NULL
    OR treatment_outcome IS NULL
;
