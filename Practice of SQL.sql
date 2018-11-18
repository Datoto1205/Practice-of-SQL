# Extract
select * from city;

SELECT Name, District, Population FROM city;

#SELECT population*12 AS AnnualPayment FROM city

SELECT * FROM city WHERE Population > 100000;
SELECT * FROM city WHERE Population BETWEEN 10000 AND 100000

#SELECT job FROM cmdev.emp