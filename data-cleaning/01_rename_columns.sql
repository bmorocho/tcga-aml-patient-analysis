#Rename columns

ALTER TABLE aml_data
RENAME COLUMN `cases.submitter_id` TO `cases_submitter_id`,
RENAME COLUMN `demographic.age_at_index` TO `age_at_index`,
RENAME COLUMN `demographic.days_to_death` TO `days_to_death`,
RENAME COLUMN `demographic.race` TO `race`,
RENAME COLUMN `demographic.sex_at_birth` TO `sex_at_birth`,
RENAME COLUMN `diagnoses.age_at_diagnosis` TO `age_at_diagnosis`,
RENAME COLUMN `diagnoses.days_to_diagnosis` TO `days_to_diagnosis`,
RENAME COLUMN `diagnoses.days_to_last_follow_up` TO `days_to_last_follow_up`,
RENAME COLUMN `diagnoses.days_to_recurrence` TO `days_to_recurrence`,
RENAME COLUMN `diagnoses.eln_risk_classification` TO `eln_risk_classification`,
RENAME COLUMN `diagnoses.fab_morphology_code` TO `fab_morphology_code`,
RENAME COLUMN `diagnoses.primary_diagnosis` TO `primary_diagnosis`,
RENAME COLUMN `diagnoses.prior_malignancy` TO `prior_malignancy`,
RENAME COLUMN `diagnoses.prior_treatment` TO `prior_treatment`,
RENAME COLUMN `diagnoses.progression_or_recurrence` TO `progression_or_recurrence`,
RENAME COLUMN `diagnoses.residual_disease` TO `residual_disease`,
RENAME COLUMN `diagnoses.year_of_diagnosis` TO `year_of_diagnosis`,
RENAME COLUMN `treatments.therapeutic_agents` TO `therapeutic_agents`,
RENAME COLUMN `treatments.treatment_or_therapy` TO `treatment_or_therapy`,
RENAME COLUMN `treatments.treatment_outcome` TO `treatment_outcome`,
RENAME COLUMN `treatments.treatment_type` TO `treatment_type`
;
