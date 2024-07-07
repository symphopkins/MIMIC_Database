-- Average Length of Stay by Admission Type
SELECT admission_type,
AVG(EXTRACT(EPOCH FROM (dischtime - admittime)) / 86400) AS avg_length_of_stay_days
FROM admissions
GROUP BY admission_type;


--DRG Severity, Length of Stay, and Mortality Rate
SELECT 
    dc.drg_severity,
    COUNT(*) AS total_icu_stays,
	 AVG(EXTRACT(EPOCH FROM (a.dischtime - a.admittime)) / 86400) AS avg_length_of_stay_days,
    SUM(CASE WHEN a.hospital_expire_flag = 1 THEN 1 ELSE 0 END) AS total_deaths,
    (SUM(CASE WHEN a.hospital_expire_flag = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS mortality_rate
FROM 
    drgcodes dc
JOIN 
    admissions a ON dc.hadm_id = a.hadm_id
JOIN
    icustays icu ON a.hadm_id = icu.hadm_id
GROUP BY 
    dc.drg_severity
ORDER BY 
    dc.drg_severity;

--DRG Mortality, Length of Stay, and Mortality Rate
SELECT 
    dc.drg_mortality,
    COUNT(*) AS total_icu_stays,
	 AVG(EXTRACT(EPOCH FROM (a.dischtime - a.admittime)) / 86400) AS avg_length_of_stay_days,
    SUM(CASE WHEN a.hospital_expire_flag = 1 THEN 1 ELSE 0 END) AS total_deaths,
    (SUM(CASE WHEN a.hospital_expire_flag = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS mortality_rate
FROM 
    drgcodes dc
JOIN 
    admissions a ON dc.hadm_id = a.hadm_id
JOIN
    icustays icu ON a.hadm_id = icu.hadm_id
GROUP BY 
    dc.drg_mortality
ORDER BY 
    dc.drg_mortality;

--Length of Stay by ICU Type
SELECT 
    first_careunit,
    AVG(EXTRACT(EPOCH FROM (outtime - intime)) / 86400) AS avg_length_of_stay_days
FROM 
    icustays
GROUP BY 
    first_careunit;
