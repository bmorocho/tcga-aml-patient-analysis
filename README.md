# tcga-aml-patient-analysis

##Overview
SQL analysis of AML patient clinical data obtained from The Cancer Genome Atlas (TCGA-LAML). This project covers data cleaning and exploratory outcomes analysis.

---

## Dataset
- **Source:** The Cancer Genome Atlas (TCGA) via the NCI GDC Portal. Data can be downloaded at portal.gdc.cancer.gov by searching for project TCGA-LAML, clicking the Clinical dropdown and selecting TSV. Select the following columns for import: cases.submitter_id, demographic.age_at_index, demographic.days_to_death, demographic.race, demographic.sex_at_birth, demographic.vital_status, diagnoses.age_at_diagnosis, diagnoses.days_to_diagnosis, diagnoses.days_to_last_follow_up, diagnoses.days_to_recurrence, diagnoses.eln_risk_classification, diagnoses.fab_morphology_code, diagnoses.primary_diagnosis, diagnoses.prior_malignancy, diagnoses.prior_treatment, diagnoses.progression_or_recurrence, diagnoses.residual_disease, diagnoses.year_of_diagnosis, treatments.therapeutic_agents, treatments.treatment_or_therapy, treatments.treatment_outcome, treatments.treatment_type
- **Disease:** Acute Myeloid Leukemia (AML)
- **Program:** TCGA
- **Total Cases:** 397 rows (200 unique patients, ~2 rows per patient due to multiple treatment entries)
- **Columns (post-cleaning):** 17

---

## Tools Used
- MySQL Workbench
- NCI GDC Portal

---

## Repository Structure
tcga-aml-patient-analysis/
  README.md
  data_cleaning/
    01_rename_columns.sql
    02_check_blank_data.sql
    03_NULL_check.sql
    04_drop_columns.sql
    05_clean_days_to_death.sql
    06_clean_missing_values.sql
    07_duplicate_check.sql
    08_modify_data_types.sql
data_analysis/
    01_survival_rate.sql
    02_avg_age_at_diagnosis_by_sex.sql
    03_age_group_distribution.sql
    04_fab_morphology_distribution.sql
    05_avg_survival_by_fab_morphology.sql
    06_above_avg_follow_up.sql
    07_rank_by_age_per_fab_group.sql

--- 

## Part 1 — Data Cleaning 
The TCGA-LAML clinical dataset required extensive cleaning before analysis could begin due to the complexity of real-world clinical data. 

1. **Rename columns** — Column names containing periods (e.g. diagnoses.fab_morphology_code) caused errors when referenced in queries. All columns were renamed to snake_case to remove periods and standardize column names.
2. **Check for blank data** — Used conditional aggregation with SUM and CASE WHEN to identify columns containing TCGA's missing data convention '--' across all columns.
3. **NULL check** — Verified that fully blank columns contained no true NULL values, confirming they were entirely blank.
4. **Drop columns** — Dropped 5 columns confirmed to be blank: days_to_recurrence, eln_risk_classification, progression_or_recurrence, residual_disease, and treatment_outcome. The days_to_diagnosis column was also dropped as all values were 0 and determined to have no analytical value.
5. **Clean days_to_death** — Further investigation revealed two distinct groups of '--' values: 132 patients marked 'Alive' where no death date is expected, and 26 patients marked 'Dead' with no recorded death date (likely due to data collection/entry error). '0' values for deceased patients were deemed clinically implausible for this project and likely represented additional data entry errors. Both '--' and '0' were converted to NULL to avoid skewing analysis.
6. **Clean missing values** — Converted remaining '--' values to NULL in days_to_last_follow_up and therapeutic_agents columns.
7. **Duplicate check** — Used ROW_NUMBER() with PARTITION BY to investigate duplicate cases_submitter_id values. Confirmed that duplicates are intentional — each patient has two rows representing different therapeutic agents (Hydroxyurea and Tretinoin).
8. **Modify data types** — Converted age_at_index, days_to_death, age_at_diagnosis, days_to_last_follow_up from TEXT to INT and year_of_diagnosis from TEXT to YEAR after removing '--' missing values.

---

## Part 2 — Analysis

### Q1: What is the overall survival rate among AML patients in this dataset?
**Skills:** Subqueries in SELECT and FROM, DISTINCT, arithmetic calculation

**Result:** 33.5% of AML patients in this dataset were alive at time of data collection (67 out of 200 unique patients).

---

### Q2: What is the average age at diagnosis by sex?
**Skills:** AVG, GROUP BY, DISTINCT, subquery in FROM, arithmetic calculation

**Result:** Male patients had an average age at diagnosis of ~55.7 years and female patients ~55.2 years.

---

### Q3: What is the distribution of AML patients by age group?
**Skills:** CASE WHEN, COUNT, DISTINCT, subquery in FROM

**Result:** 38 patients were under 40, 78 were between 40-60, and 84 were over 60.

---

### Q4: What is the distribution of AML patients by FAB morphology subtype?
**Skills:** GROUP BY, COUNT, ORDER BY, window functions, PARTITION BY

**Result:** M1 and M2 were the most common subtypes with 44 patients each.

---

### Q5: What is the average days to death for deceased patients by FAB morphology code?
**Skills:** AVG, GROUP BY, DISTINCT, subquery in FROM, WHERE

**Result:** Average days to death among deceased patients by FAB subtype: M0 (~518 days), M1 (~471 days), M2 (~341 days), M3 (~463 days), M4 (~433 days), M5 (~203 days), M6 (~265 days), M7 (~294 days). Not Classified returned NULL due to no recorded death dates.

---

### Q6: Find patients whose days to last follow up was above average.
**Skills:** Subqueries in FROM and WHERE, DISTINCT, AVG

**Result:** 68 patients had days to last follow up above the dataset average of ~557 days.

---

### Q7: Rank patients by age at diagnosis within each FAB morphology group
**Skills:** DENSE_RANK(), PARTITION BY, ORDER BY, FLOOR(), subquery in FROM, DISTINCT

**Result:** All 200 unique patients returned with rankings assigned within each FAB morphology group.

---

## SQL Skills Demonstrated
- SELECT, FROM, WHERE, GROUP BY, ORDER BY, LIMIT
- Aggregate functions: COUNT, SUM, AVG
- Conditional aggregation: SUM(CASE WHEN ... THEN 1 END)
- Subqueries in FROM and WHERE
- Window functions: RANK(), DENSE_RANK(), ROW_NUMBER() with PARTITION BY and ORDER BY
- Data cleaning: ALTER TABLE, DROP COLUMN, RENAME COLUMN, MODIFY COLUMN, UPDATE SET
- NULL and blank value checks using IS NULL and = '--'
- Duplicate detection using ROW_NUMBER() and PARTITION BY
- Arithmetic calculations and type conversion using FLOOR()

