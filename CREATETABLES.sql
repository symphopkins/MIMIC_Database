-- CREATE TABLES
CREATE TABLE admissions (
    subject_id INT,
    hadm_id INT,
    admittime TIMESTAMP,
    dischtime TIMESTAMP,
    deathtime TIMESTAMP,
    admission_type TEXT,
    admit_provider_id TEXT,
    admission_location TEXT,
    discharge_location TEXT,
    insurance TEXT,
    language TEXT,
    marital_status TEXT,
    race TEXT,
    edregtime TIMESTAMP,
    edouttime TIMESTAMP,
    hospital_expire_flag INT
);

CREATE TABLE caregiver (
    caregiver_id INT PRIMARY KEY
);

CREATE TABLE chartevents (
    subject_id INT,
    hadm_id INT,
    stay_id INT,
    caregiver_id INT,
    charttime TIMESTAMP,
    storetime TIMESTAMP,
    itemid INT,
    value TEXT,
    valuenum FLOAT,
    valueuom TEXT,
    warning INT
);

CREATE TABLE d_hcpcs (
    code TEXT,
    category INT,
    long_description TEXT,
    short_description TEXT
);

CREATE TABLE d_icd_diagnoses (
    icd_code TEXT,
    icd_version INT,
    long_title TEXT
);

CREATE TABLE d_icd_procedures (
    icd_code TEXT,
    icd_version INT,
    long_title TEXT
);

CREATE TABLE d_items (
    itemid INT PRIMARY KEY,
    label TEXT,
    abbreviation TEXT,
    linksto TEXT,
    category TEXT,
    unitname TEXT,
    param_type TEXT,
    lownormalvalue FLOAT,
    highnormalvalue FLOAT
);

CREATE TABLE d_labitems (
    itemid INT,
    label TEXT,
    fluid TEXT,
    category TEXT
);

CREATE TABLE datetimeevents (
    subject_id INT,
    hadm_id INT,
    stay_id INT,
    caregiver_id INT,
    charttime TIMESTAMP,
    storetime TIMESTAMP,
    itemid INT,
    value TIMESTAMP,
    valueuom TEXT,
    warning INT
);

CREATE TABLE drgcodes (
    subject_id INT,
    hadm_id INT,
    drg_type TEXT,
    drg_code TEXT,
    description TEXT,
    drg_severity INT,
    drg_mortality INT
);

CREATE TABLE emar (
    subject_id INT,
    hadm_id INT,
    emar_id TEXT,
    emar_seq INT,
    poe_id TEXT,
    pharmacy_id INT,
    enter_provider_id TEXT,
    charttime TIMESTAMP,
    medication TEXT,
    event_txt TEXT,
    scheduletime TIMESTAMP,
    storetime TIMESTAMP
);

CREATE TABLE icustays (
    subject_id INT,
    hadm_id INT,
    stay_id INT,
    first_careunit TEXT,
    last_careunit TEXT,
    intime TIMESTAMP,
    outtime TIMESTAMP,
    los FLOAT
);

CREATE TABLE ingredientevents (
    subject_id INT,
    hadm_id INT,
    stay_id INT,
    caregiver_id INT,
    starttime TIMESTAMP,
    endtime TIMESTAMP,
    storetime TIMESTAMP,
    itemid INT,
    amount FLOAT,
    amountuom TEXT,
    rate FLOAT,
    rateuom TEXT,
    orderid INT,
    linkorderid INT,
    statusdescription TEXT,
    originalamount FLOAT,
    originalrate FLOAT
);

CREATE TABLE inputevents (
    subject_id INT,
    hadm_id INT,
    stay_id INT,
    caregiver_id INT,
    starttime TIMESTAMP,
    endtime TIMESTAMP,
    storetime TIMESTAMP,
    itemid INT,
    amount FLOAT,
    amountuom TEXT,
    rate FLOAT,
    rateuom TEXT,
    orderid INT,
    linkorderid INT,
    ordercategoryname TEXT,
    secondaryordercategoryname TEXT,
    ordercomponenttypedescription TEXT,
    ordercategorydescription TEXT,
    patientweight FLOAT,
    totalamount FLOAT,
    totalamountuom TEXT,
    isopenbag INT,
    continueinnextdept INT,
    statusdescription TEXT,
    originalamount FLOAT,
    originalrate FLOAT
);

CREATE TABLE labevents (
    labevent_id INT,
    subject_id INT,
    hadm_id INT,
    specimen_id INT,
    itemid INT,
    order_provider_id TEXT,
    charttime TIMESTAMP,
    storetime TIMESTAMP,
    value TEXT,
    valuenum FLOAT,
    valueuom TEXT,
    ref_range_lower FLOAT,
    ref_range_upper FLOAT,
    flag TEXT,
    priority TEXT,
    comments TEXT
);

CREATE TABLE microbiologyevents (
    microevent_id INT,
    subject_id INT,
    hadm_id INT,
    micro_specimen_id INT,
    order_provider_id TEXT,
    chartdate DATE,
    charttime TIMESTAMP,
    spec_itemid INT,
    spec_type_desc TEXT,
    test_seq INT,
    storedate DATE,
    storetime TIMESTAMP,
    test_itemid INT,
    test_name TEXT,
    org_itemid INT,
    org_name TEXT,
    isolate_num INT,
    quantity TEXT,
    ab_itemid INT,
    ab_name TEXT,
    dilution_text TEXT,
    dilution_comparison TEXT,
    dilution_value FLOAT,
    interpretation TEXT,
    comments TEXT
);

CREATE TABLE omr (
    subject_id INT,
    chartdate DATE,
    seq_num INT,
    result_name TEXT,
    result_value TEXT
);

CREATE TABLE patients (
    subject_id INT,
    gender TEXT,
    anchor_age INT,
    anchor_year INT,
    anchor_year_group TEXT,
    dod DATE
);

CREATE TABLE pharmacy (
    subject_id INT,
    hadm_id INT,
    pharmacy_id INT,
    poe_id TEXT,
    starttime TIMESTAMP,
    stoptime TIMESTAMP,
    medication TEXT,
    proc_type TEXT,
    status TEXT,
    entertime TIMESTAMP,
    verifiedtime TIMESTAMP,
    route TEXT,
    frequency TEXT,
    disp_sched TEXT,
    infusion_type TEXT,
    sliding_scale TEXT,
    lockout_interval TEXT,
    basal_rate TEXT,
    one_hr_max TEXT,
    doses_per_24_hrs INT,
    duration TEXT,
    duration_interval TEXT,
    expiration_value TEXT,
    expiration_unit TEXT,
    expirationdate DATE,
    dispensation TEXT,
    fill_quantity INT
);

CREATE TABLE poe (
    poe_id TEXT,
    poe_seq INT,
    subject_id INT,
    hadm_id INT,
    ordertime TIMESTAMP,
    order_type TEXT,
    order_subtype TEXT,
    transaction_type TEXT,
    discontinue_of_poe_id TEXT,
    discontinued_by_poe_id TEXT,
    order_provider_id TEXT,
    order_status TEXT
);

CREATE TABLE poe_detail (
    poe_id TEXT,
    poe_seq INT,
    subject_id INT,
    field_name TEXT,
    field_value TEXT
);

CREATE TABLE prescriptions (
    subject_id INT,
    hadm_id INT,
    pharmacy_id INT,
    poe_id TEXT,
    poe_seq INT,
    order_provider_id TEXT,
    starttime TIMESTAMP,
    stoptime TIMESTAMP,
    drug_type TEXT,
    drug TEXT,
    formulary_drug_cd TEXT,
    gsn TEXT,
    ndc TEXT,
    prod_strength TEXT,
    form_rx TEXT,
    dose_val_rx TEXT,
    dose_unit_rx TEXT,
    form_val_disp TEXT,
    form_unit_disp TEXT,
    doses_per_24_hrs INT,
    route TEXT
);

CREATE TABLE procedureevents (
    subject_id INT,
    hadm_id INT,
    stay_id INT,
    caregiver_id INT,
    starttime TIMESTAMP,
    endtime TIMESTAMP,
    storetime TIMESTAMP,
    itemid INT,
    value FLOAT,
    valueuom TEXT,
    location TEXT,
    locationcategory TEXT,
    orderid INT,
    linkorderid INT,
    ordercategoryname TEXT,
    ordercategorydescription TEXT,
    patientweight FLOAT,
    isopenbag INT,
    continueinnextdept INT,
    statusdescription TEXT,
    originalamount FLOAT,
    originalrate FLOAT
);

CREATE TABLE services (
    subject_id INT,
    hadm_id INT,
    transfertime TIMESTAMP,
    prev_service TEXT,
    curr_service TEXT
);

CREATE TABLE transfers (
    subject_id INT,
    hadm_id INT,
    transfer_id INT,
    eventtype TEXT,
    careunit TEXT,
    intime TIMESTAMP,
    outtime TIMESTAMP
);
