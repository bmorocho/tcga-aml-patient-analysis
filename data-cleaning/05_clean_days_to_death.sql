#Pull columns vital_status & days_to_death to assess data 
	#confirmed to contained blanks from 02_check_blank_data query
    
SELECT vital_status, days_to_death
FROM aml_data
;

#Pulling rows with vital_status = 'Dead' to explore mixed data values

SELECT vital_status, days_to_death
FROM aml_data
WHERE vital_status = 'Dead'
ORDER BY days_to_death
;

#Assessing all vital status with days_to_death = '--' & '0'

SELECT vital_status, days_to_death
FROM aml_data
WHERE days_to_death = '--' OR days_to_death = '0' 
;


#Converting '--' & '0' to NULL in days_to_death
	#'--' represents missing data per TCGA convention
    #'0' deemed clinically implausible & likely data entry error

UPDATE aml_data
SET days_to_death = NULL
WHERE days_to_death = '--' OR days_to_death = '0'
;

