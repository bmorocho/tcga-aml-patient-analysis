#Drop columns

ALTER TABLE aml_data
DROP COLUMN `days_to_recurrence`,
DROP COLUMN `eln_risk_classification`,
DROP COLUMN `progression_or_recurrence`,
DROP COLUMN `residual_disease`,
DROP COLUMN `treatment_outcome`,
DROP COLUMN `days_to_diagnosis`
;
