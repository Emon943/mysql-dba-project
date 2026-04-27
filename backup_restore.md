Basic Full Database Backup
mysqldump -u root -p db_name > backup.sql

Backup All Databases
mysqldump -u root -p --all-databases > all_backup.sql

Backup Specific Tables
mysqldump -u root -p db_name table1 table2 > tables_backup.sql

Backup with Compression (Recommended for large DB)
mysqldump -u root -p db_name | gzip > backup.sql.gz

Backup with Structure + Data + Routines + Triggers
mysqldump -u root -p --routines --triggers db_name > full_backup.sql

Only Structure (No Data)
mysqldump -u root -p --no-data db_name > schema.sql

Only Data (No Structure)
mysqldump -u root -p --no-create-info db_name > data.sql



Restore Single Database
mysql -u root -p db_name < backup.sql

Restore All Databases
mysql -u root -p < all_backup.sql

Restore from Compressed Backup
gunzip < backup.sql.gz | mysql -u root -p db_name