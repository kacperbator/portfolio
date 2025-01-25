-- 1. Display the first 10 records from the `city` table
SELECT * FROM city LIMIT 10;

-- 2. Display the first 10 records from the `country` table
SELECT * FROM country LIMIT 10;

-- 3. Display the first 10 records from the `countrylanguage` table
SELECT * FROM countrylanguage LIMIT 10;

-- 4. Calculate the average population of cities
SELECT AVG(Population) AS AvgCityPopulation FROM city;

-- 5. Find the country with the largest surface area
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 1;

-- 6. Calculate the average life expectancy across all countries
SELECT AVG(LifeExpectancy) AS AvgLifeExpectancy FROM country;

-- 7. Find the most common language (regardless of whether it is official)
SELECT Language, COUNT(*) AS LanguageCount
FROM countrylanguage
GROUP BY Language
ORDER BY LanguageCount DESC
LIMIT 1;

-- 8. List all cities in a specific country (e.g., 'USA')
SELECT c.Name AS CityName, c.District, c.Population
FROM city c
JOIN country co ON c.CountryCode = co.Code
WHERE co.Code = 'USA';

-- 9. Find the official languages spoken by a specific country (e.g., 'Poland')
SELECT cl.Language
FROM countrylanguage cl
JOIN country co ON cl.CountryCode = co.Code
WHERE co.Name = 'Poland' AND cl.IsOfficial = 'T';

-- 10. Find the country with the highest number of cities
SELECT co.Name AS CountryName, COUNT(c.ID) AS CityCount
FROM country co
JOIN city c ON co.Code = c.CountryCode
GROUP BY co.Name
ORDER BY CityCount DESC
LIMIT 1;

-- 11. Find cities in the region with the highest population
SELECT c.Name AS CityName, c.Population, co.Region
FROM city c
JOIN country co ON c.CountryCode = co.Code
WHERE co.Region = (
    SELECT Region
    FROM country
    GROUP BY Region
    ORDER BY SUM(Population) DESC
    LIMIT 1
)
ORDER BY c.Population DESC
LIMIT 10;

-- 12. Find the country with the highest GDP (GNP)
SELECT Name, GNP
FROM country
ORDER BY GNP DESC
LIMIT 1;

-- 13. Find the country with the highest number of languages
SELECT co.Name AS CountryName, COUNT(cl.Language) AS LanguageCount
FROM country co
JOIN countrylanguage cl ON co.Code = cl.CountryCode
GROUP BY co.Name
ORDER BY LanguageCount DESC
LIMIT 1;

-- 14. Find the top 5 most populous countries
SELECT Name, Population
FROM country
ORDER BY Population DESC
LIMIT 5;

-- 15. List all cities with populations greater than the average city population
SELECT Name, Population
FROM city
WHERE Population > (SELECT AVG(Population) FROM city)
ORDER BY Population DESC;

-- 16. Count how many countries belong to each continent
SELECT Continent, COUNT(*) AS CountryCount
FROM country
GROUP BY Continent
ORDER BY CountryCount DESC;

-- 17. Find the official languages spoken by countries in Europe
SELECT DISTINCT cl.Language
FROM countrylanguage cl
JOIN country co ON cl.CountryCode = co.Code
WHERE co.Continent = 'Europe' AND cl.IsOfficial = 'T';

-- 18. List the largest city by population in each country
SELECT co.Name AS CountryName, c.Name AS LargestCity, MAX(c.Population) AS CityPopulation
FROM country co
JOIN city c ON co.Code = c.CountryCode
GROUP BY co.Name
ORDER BY CityPopulation DESC;

-- 19. Find countries where more than one language is official
SELECT co.Name AS CountryName, COUNT(cl.Language) AS OfficialLanguageCount
FROM country co
JOIN countrylanguage cl ON co.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY co.Name
HAVING COUNT(cl.Language) > 1
ORDER BY OfficialLanguageCount DESC;

-- 20. List cities in countries with GDP > 1 trillion
SELECT c.Name AS CityName, c.Population, co.Name AS CountryName, co.GNP
FROM city c
JOIN country co ON c.CountryCode = co.Code
WHERE co.GNP > 1000000
ORDER BY co.GNP DESC, c.Population DESC;

-- 21. Find the top 5 regions with the highest average life expectancy
SELECT Region, AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM country
GROUP BY Region
ORDER BY AvgLifeExpectancy DESC
LIMIT 5;

-- 22. Find countries where English is an official language
SELECT DISTINCT co.Name AS CountryName
FROM country co
JOIN countrylanguage cl ON co.Code = cl.CountryCode
WHERE cl.Language = 'English' AND cl.IsOfficial = 'T'
ORDER BY co.Name;

-- 23. Calculate the population percentage of each city within its country
SELECT c.Name AS CityName, co.Name AS CountryName, 
       c.Population, co.Population AS CountryPopulation,
       ROUND((c.Population / co.Population) * 100, 2) AS PopulationPercentage
FROM city c
JOIN country co ON c.CountryCode = co.Code
WHERE co.Population > 0
ORDER BY PopulationPercentage DESC;