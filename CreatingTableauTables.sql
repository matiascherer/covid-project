-- Creating Tables for Tableau viz

-- 1

SELECT SUM(CAST(New_Cases AS bigint)) AS Total_Cases, SUM(CAST(New_Deaths AS decimal)) AS Total_Deaths, 
SUM(CAST(New_Deaths AS decimal))/SUM(CAST(New_Cases AS bigint))*100 AS DeathPercentage
FROM CovidDeaths

-- 2

SELECT location, SUM(CAST(New_Deaths AS int)) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NULL 
AND location NOT IN ('World', 'Lower middle income', 'Low income', 'Upper middle income', 'High income')
GROUP BY location
ORDER BY TotalDeathCount DESC

-- 3

SELECT Location, Population, MAX(Total_Cases) AS HighestInfecctionCount,
MAX(Total_Cases/Population) * 100 AS PercentPopulationInfected
FROM CovidDeaths
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC

-- 4

SELECT Location, Population, date, MAX(Total_Cases) AS HighestInfecctionCount,
MAX(Total_Cases/Population) * 100 AS PercentPopulationInfected
FROM CovidDeaths
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC, date DESC
 