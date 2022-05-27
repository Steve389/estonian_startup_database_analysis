USE Estonia_Startup_DB;

CREATE TABLE if not exists Estonia_Startup_Database_2019_Q3 (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
Startup VARCHAR(20),
Sector VARCHAR(20),
Business_Model VARCHAR(20),
Employee_count INT,
Employment_taxes VARCHAR(20),
Turnover VARCHAR(20),
Year_Founded INT,
Website VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE if not exists Estonia_Startup_Database_2019_Q4 (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
Startup VARCHAR(20),
Sector VARCHAR(20),
Business_Model VARCHAR(20),
Employee_count INT,
Employment_taxes VARCHAR(20),
Turnover VARCHAR(20),
Year_Founded INT,
Website VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE if not exists Estonia_Startup_Database_2020_Q1 (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
Startup VARCHAR(20),
Sector VARCHAR(20),
Business_Model VARCHAR(20),
Employee_count INT,
Employment_taxes VARCHAR(20),
Turnover VARCHAR(20),
Year_Founded INT,
Website VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE if not exists Estonia_Startup_Database_2020_Q2 (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
Startup VARCHAR(20),
Sector VARCHAR(20),
Business_Model VARCHAR(20),
Employee_count INT,
Employment_taxes VARCHAR(20),
Turnover VARCHAR(20),
Year_Founded INT,
Website VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE if not exists Estonia_Startup_Database_2020_Q3 (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
Startup VARCHAR(20),
Sector VARCHAR(20),
Business_Model VARCHAR(20),
Employee_count INT,
Employment_taxes VARCHAR(20),
Turnover VARCHAR(20),
Year_Founded INT,
Website VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE if not exists Estonia_Startup_Database_2020_Q4 (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
Startup VARCHAR(20),
Sector VARCHAR(20),
Business_Model VARCHAR(20),
Employee_count INT,
Employment_taxes VARCHAR(20),
Turnover VARCHAR(20),
Year_Founded INT,
Website VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE if not exists Estonia_Startup_Database_2021_Q1 (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
Startup VARCHAR(20),
Sector VARCHAR(20),
Business_Model VARCHAR(20),
Employee_count INT,
Employment_taxes VARCHAR(20),
Turnover VARCHAR(20),
Year_Founded INT,
Website VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE if not exists Estonia_Startup_Database_2021_Q2 (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
Startup VARCHAR(20),
Sector VARCHAR(20),
Business_Model VARCHAR(20),
Employee_count INT,
Employment_taxes VARCHAR(20),
Turnover VARCHAR(20),
Year_Founded INT,
Website VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE if not exists Estonia_Startup_Database_2021_Q3 (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
Startup VARCHAR(20),
Sector VARCHAR(20),
Business_Model VARCHAR(20),
Employee_count INT,
Employment_taxes VARCHAR(20),
Turnover VARCHAR(20),
Year_Founded INT,
Website VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE if not exists Estonia_Startup_Database_2021_Q4 (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
Startup VARCHAR(20),
Sector VARCHAR(20),
Business_Model VARCHAR(20),
Employee_count INT,
Employment_taxes VARCHAR(20),
Turnover VARCHAR(20),
Year_Founded INT,
Website VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE if not exists Estonia_Startup_Database_2022_Q1 (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
Startup VARCHAR(20),
Sector VARCHAR(20),
Business_Model VARCHAR(20),
Employee_count INT,
Employment_taxes VARCHAR(20),
Turnover VARCHAR(20),
Year_Founded INT,
Website VARCHAR(50),
PRIMARY KEY (id)
);

-- 1.How many people were employed by startups in Q1 2021?

-- In my interpretation, there are two answers to this question : one is to simply show how many people were employed 
-- by startups as of Q1 2021, another one is to see whether there was a growth in the number of startup employees between
-- Q1 2021 and Q4 2020. However, since we don't have the data of how many people were laid off, the second answer is more 
-- difficult. As a result, I will show sum the number of startup employees from the Q1 2021 table

SELECT SUM(Employee_count) FROM Estonia_Startup_DB.Estonia_Startup_Database_2021_Q1;


-- 2. Name TOP 3 sectors based on turnover in Q1 2022

-- In order to answer I will first select the columns that contain the string value M (milions). After that, I will 
-- simply ORDER BY turnover in descending order and only keep the first 3 top values by using the LIMIT statement

SELECT Sector, Turnover FROM Estonia_Startup_DB.Estonia_Startup_Database_2022_Q1 
WHERE Turnover LIKE '%M%'
ORDER BY Turnover
DESC 
LIMIT 3
;

-- 3. How many startups which were founded between 2019-2021 had 1 or more employees in Q1 2022? Name also top 3 
-- startups from that list based on employee count.

-- To answer the first question I will simply count the number of startups where the values of the column Year_Founded 
-- are between 2019 and 2021

SELECT COUNT(Startup) FROM Estonia_Startup_DB.Estonia_Startup_Database_2022_Q1
WHERE Year_Founded BETWEEN 2019 and 2021 ;

-- After this, I will select the startups that were founded between 2019 and 2021 and that have at least one employee. 
-- Finally, I will order by Employee_count and just keep the top 3 values.

SELECT Startup FROM Estonia_Startup_DB.Estonia_Startup_Database_2022_Q1
WHERE Year_Founded BETWEEN 2019 and 2021 
AND Employee_count > 1
ORDER BY Employee_count
DESC
LIMIT 3;

-- 4. How much employment taxes were paid by Fintech startups in Q3 2021? Name the Advanced Manifacturing and Industry 
-- sector startups which had 100 or more employees in the same quarter.

-- First I will need to remove some characters from the Employment_taxes column.

UPDATE Estonia_Startup_DB.Estonia_Startup_Database_2021_Q3 SET Employment_taxes = REPLACE(Employment_taxes, '?', ' ');

UPDATE Estonia_Startup_DB.Estonia_Startup_Database_2021_Q3 SET Employment_taxes = REPLACE(Employment_taxes, 'M', ' ');

-- At this point I will create two separate tables: one with the values in millions, one with the values in thousands.

CREATE TABLE if not exists Estonia_Startup_Database_2021_Q3_Employment_taxes_M 
SELECT * FROM Estonia_Startup_DB.Estonia_Startup_Database_2021_Q3
WHERE Employment_taxes NOT LIKE '%K%';

CREATE TABLE if not exists Estonia_Startup_Database_2021_Q3_Employment_taxes_K 
SELECT * FROM Estonia_Startup_DB.Estonia_Startup_Database_2021_Q3
WHERE Employment_taxes LIKE '%K%';

-- Now I will work separately on these two tables to get my insights: I will calculate the amound of taxes paid in milions and in thousands.
-- However, there is another issue to solve; the table with the values in milions also contain the values that are less than a thousand: 
-- I will have to include these too in my calculations. The first query will give me the sum of taxes paid per sector that were less than 
-- one thousand per company, the second one the values in milions.

SELECT SUM(Employment_taxes), Sector FROM Estonia_Startup_DB.Estonia_Startup_Database_2021_Q3_Employment_taxes_M
WHERE Employment_taxes NOT LIKE '%.%'
GROUP BY Sector;

SELECT SUM(Employment_taxes), Sector FROM Estonia_Startup_DB.Estonia_Startup_Database_2021_Q3_Employment_taxes_M
WHERE Employment_taxes LIKE '%.%'
GROUP BY Sector;

-- Now I will do the same query in the table with the values in thousands. First though, I will have to get rid of the K character.

UPDATE Estonia_Startup_DB.Estonia_Startup_Database_2021_Q3_Employment_taxes_K SET Employment_taxes = REPLACE(Employment_taxes, 'K', ' ');

SELECT SUM(Employment_taxes), Sector FROM Estonia_Startup_DB.Estonia_Startup_Database_2021_Q3_Employment_taxes_K
GROUP BY Sector;

-- Advanced Manifacturing and Industry sector startuos that had more than 100 employees in Q3 2021

SELECT Startup, Sector, Employee_count FROM Estonia_Startup_DB.Estonia_Startup_Database_2021_Q3
WHERE Sector = 'Advanced'
AND Employee_count > 100
;

-- 5. How many startups are using AI, Data Analytics or smart home as technology in Q1 2022? How many of them were 
-- founded before 2015 and which startup from the latter list had the most employees in Q1 2022?

-- This can be answered by just checking the actual database website where you can filter by different technologies, 
-- year founded and you can check the number of employees per company.
-- The number of startups using these technologies in Q1 2022 is 532. 33 of them were founded before 2015 and out 
-- of these, Starship is the company with the highest employee count in Q1 2022.










