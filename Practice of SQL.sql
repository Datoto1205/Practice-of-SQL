# The tutorial website I refered to: http://www.codedata.com.tw/database/mysql-tutorial-getting-started/
# Hello World
select "Hellow, MYSQL!";
select "Hello" || "SQL!";

# Extract Whole Data from Form & Other Form
select * from world.city;
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





# Obtain Particular Part From String & Length of String & Time
select substring("Advertisement", 2, 8);
select char_length(District) from world.city;
select hiredate + interval 36 day from cmdev.emp limit 10 ;

# Function of String
select ename, lower(ename) anotherName from cmdev.emp;     # lower() is a function which return the lower case of characters.
select ename, replace(ename, "S", "PP") from cmdev.emp;     # replace() is a function which could be used to change part of string.

# Function of Number
select 3.141592653, round(3.141592653), ceil(3.141592653), truncate(3.141592653, 4);      # Rounded with particular rules.
select pi(), rand(), sqrt(25);      # pi() is used to generate 3.1415~, rand() is used to generate a number which is between 0 and 1, and sqrt() is used to generate the root of particular number.alter

# Function of Date
select ename, hiredate, datediff('1988-01-01', hiredate) days from cmdev.emp;     # datediff() is a function which returns the days between two dates, there're two parameters in it.
select curdate(), month(curtime()), day(curtime()), hour(curtime()), minute(curtime());     # Return the time right now.
select Name, year(curdate()) - IndepYear  as LengthOfYearOfIndep from world.country;      # Year() is used to extract the year of particular date.
select "2018-06-25" as birthday, adddate("2018-06-25", 20), subdate("2018-06-25", 20);

# Control Flow-- If (If in Swift) & Case (Switch in Swift)
select Name, Population, if(Population > 1000000, "Crowded", "Better") Situation from world.country;      # if(condition, case1, case 2)
select Name, GNP, case
	when GNP < 1000 then "Poor"
    when GNP < 5000 and GNP >= 1000 then "Medium"
    else "Rich"
end PropertySituation from world.country;

# Distinguish Null
select Name, isnull(IndepYear) from world.country;      # 0 means not null, and vice versa.
select Name, ifnull(IndepYear, "Empty") Checked from world.country;

# Rename the form
select a.Name, a.Continent from world.country a;

#set





# Create A Database & Table
drop database if exists testDataBase1;
create database testDataBase1 character set big5;
drop table if exists testTable1;
use testDataBase1;

# Create Columns in Table
create table testTable1(
	Title varchar(20),
    ID int
);

# Add More Data into Table
insert into testTable1 values ("Apple", 1);
insert into testTable1 values ("Bird", 2), ("Cat", 3), ("Dog", 4), ("Egg", 5), ("Fog", 6), ("Good", 7), ("Hot", 8);
select * from testDataBase1.testTable1;

# Change A Lot of Data with Particular Rule
update testDataBase1.testTable1 set ID = ID + 100 where ID < 100;
select * from testDataBase1.testTable1;

# Delete Data from Table
delete from testDataBase1.testTable1 where ID = 104;
select * from testDataBase1.testTable1;
delete from testDataBase1.testTable1 order by ID limit 2;      # Order the data first, and delete the first 3 rows of data.

# I could follow the rule here to solve the problem of safe update mode: https://stackoverflow.com/questions/11448068/mysql-error-code-1175-during-update-in-mysql-workbench

# Enum & Add New Columns
alter table testTable1 add Region enum("Taiwan", "China", "America", "Japan", "France");      # We need to use "alter" if we want to change the constitution of the table afterward.

update testTable1 set Region = "China" where Title = "Egg";      # If the data I set in the column of enum was not involved in the enum I declare above, error would occur.
update testTable1 set Region = "Taiwan" where Title in ("Cat", "Dog", "Fog");      # Multiple conditions
update testTable1 set Region = "Japan" where ID >= 107;
select * from testDataBase1.testTable1;

# Set
alter table testTable1 add AlternativeCode set("A", "B", "C", "D", "E", "F", "G") first;
update testTable1 set AlternativeCode = [A, B] where ID <= 106;

# Change Columns & Delete Columns
alter table testTable1 change AlternativeCode SecondCode int after Region;
select * from testDataBase1.testTable1;

alter table testTable1 drop Region;
alter table testTable1 drop SecondCode;
select * from testDataBase1.testTable1;

# Delete All The Data from Table
truncate table testDataBase1.testTable1;
select * from testDataBase1.testTable1;