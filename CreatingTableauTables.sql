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

-- 5

WITH CTE AS
	(SELECT
		FORMAT(Date, 'yyyy-MM') AS MonthYear,
		Continent,
		MAX(Population) AS Population,
		SUM(Total_Cases) AS Total_Cases
	FROM CovidDeaths
	WHERE Continent IS NOT NULL AND DATE >= '2020-03-01'
	GROUP BY FORMAT(Date, 'yyyy-MM'), Continent),
	
	CTE2 AS
		(SELECT 
			MonthYear,
			Continent,
			MAX(Population) AS Total_Population,
			SUM(Total_Cases) AS Total_Cases,
			SUM(SUM(Total_Cases)) OVER (PARTITION BY MonthYear) AS Total_Cases_All_Continents,
			SUM(SUM(Population)) OVER (PARTITION BY MonthYear) AS Total_Population_All_Continents
		FROM CTE
		GROUP BY MonthYear, Continent)

SELECT 
	MonthYear,
	Continent,
	Total_Cases,
	Total_Cases_All_Continents,
	(Total_Cases/Total_Cases_All_Continents) AS Total_Cases_Share,
	Total_Population,
	Total_Population_All_Continents,
	(Total_Population*1.0/Total_Population_All_Continents) AS Total_Population_Share
FROM CTE2
ORDER BY MonthYear, Continent
 
