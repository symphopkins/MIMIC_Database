# MIMIC Clinical Database 
## Overview

Built a PostgreSQL database from CSV files containing deidentified electronic health records, organizing the data into 26 tables. Executed complex SQL queries to analyze the tables, which included examining admission trends, ICU stays, and mortality rates.
Exported the resulting data to Power BI to generate a detailed report.

## Dataset

The dataset can be found at the following link: [MIMIC-IV Clinical Database Demo](https://physionet.org/content/mimic-iv-demo/2.2/#files-panel). 

![MIMIC Database Diagram](https://github.com/symphopkins/MIMIC_Database/blob/main/mimic_database_diagram.png)

## Usage
  
1. Create a database and then use the `CREATETABLES.sql` to create tables within the database.

2. Write your own queries or exceute the sql script `queries.sql` to create the tables used for the report.

## Citations

Johnson, A., Bulgarelli, L., Pollard, T., Horng, S., Celi, L. A., & Mark, R. (2023). MIMIC-IV Clinical Database Demo (version 2.2). PhysioNet. https://doi.org/10.13026/dp1f-ex47.

Goldberger, A., Amaral, L., Glass, L., Hausdorff, J., Ivanov, P. C., Mark, R., ... & Stanley, H. E. (2000). PhysioBank, PhysioToolkit, and PhysioNet: Components of a new research resource for complex physiologic signals. Circulation [Online]. 101 (23), pp. e215–e220.

## License

OdbL-1.0 License



