# Extract Whole Data from Form & Other Form
select * from city;
select * from cmdev.emp;

# Extract Whole Data with Particular Columns from Form
select Name, District, Population from city;

# Extract & Transform & Rename the Data
select population*12 as AnnualPayment from city;

# Extract Whole Data with Particular Conditions about Integer from Form
select * from city where Population > 100000;
select * from city where Population between 10000 and 100000;

# Extract Whole Data with Particular Conditions about String from Form
select * from cmdev.emp where ename like 'S%';     # "like" means "data could include", "%" means " there could be some characters after the designated character" (Here is "S").
select * from cmdev.emp where ename like '%N%';  

# Extract Null Data & Non-null Data
select * from cmdev.emp where comm is null;
select * from cmdev.emp where comm is not null;

# Order the Data
select * from city order by Population desc;     #  "asc" means "ascending", and "desc" means "descending".
select * from city order by Population asc, CountryCode asc; 

# Limit the Number of Data We Extracted
select * from cmdev.emp order by salary asc limit 5;

# Excluded The Same Data
select distinct * from cmdev.emp order by manager;