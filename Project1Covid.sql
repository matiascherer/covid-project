SELECT *
FROM CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3,4

SELECT *
FROM CovidVaccinations
ORDER BY 3,4

-- Verificar datatype de todas colunas de uma tabela

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CovidDeaths'
ORDER BY COLUMN_NAME DESC;

-- Alterar datatype de determinada coluna de uma tabela

ALTER TABLE CovidDeaths ALTER COLUMN total_deaths decimal

-- SELECT Data that we are going to use

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY 1,2


-- Looking at Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in brazil
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM CovidDeaths
WHERE Location LIKE '%zil%'
ORDER BY 1,2

-- Looking at Total Cases vs Population
--Shows what percentage of population got Covid
SELECT Location, date, population, total_cases, (total_cases/population)*100 AS PercentPopulationInfected
FROM CovidDeaths
--WHERE Location LIKE '%zil%'
ORDER BY 1,2

-- Looking at countries with Highest Infecction Rate Compared to Population
SELECT Location, population, MAX(total_cases) AS HighestInfecction, MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM CovidDeaths
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC

--Showing the countries with the Highest Death Count per Population
SELECT location, MAX(CAST(total_deaths AS int)) AS TotalDeathsCount
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathsCount DESC

--Showing the countries with the Highest Death Count per Population
SELECT location, MAX((total_deaths/population))*100 AS PercentPopulationDeaths
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY PercentPopulationDeaths DESC

--LET'S BREAK THINGS DOWN BY CONTINENT
-- Showing continents with the highest Death Count per population
SELECT continent, MAX(CAST(total_deaths AS int)) AS TotalDeathsCount
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathsCount DESC

-- GLOBAL NUMBERS

SELECT --date, 
SUM(CAST(New_Cases AS int)) AS Total_Cases, 
SUM(New_Deaths) AS Total_Deaths, 
CASE
	WHEN SUM(CAST(New_Cases AS int)) = 0 THEN NULL
	ELSE SUM(New_Deaths)/SUM(CAST(New_Cases AS int)) * 100
END AS DeathPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL
--AND location LIKE '%Brazil%'
--GROUP BY date
ORDER BY 1,2

-- Looking at Total Population vs vaccinations

SELECT dea.Continent, dea.Location, dea.Date, Population, vac.New_Vaccinations, 
SUM(vac.New_Vaccinations) OVER (PARTITION BY dea.Location ORDER BY dea.Location, 
dea.Date) AS RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY  2,3

-- CTE

WITH PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
AS
(
SELECT dea.Continent, dea.Location, dea.Date, Population, vac.New_Vaccinations, 
SUM(vac.New_Vaccinations) OVER (PARTITION BY dea.Location ORDER BY dea.Location, 
dea.Date) AS RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY  2,3
)
SELECT *, (RollingPeopleVaccinated/CAST(Population AS decimal))*100
FROM PopvsVac

--TEMP Table
DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.Continent, dea.Location, dea.Date, Population, vac.New_Vaccinations, 
SUM(vac.New_Vaccinations) OVER (PARTITION BY dea.Location ORDER BY dea.Location, 
dea.Date) AS RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT *, (RollingPeopleVaccinated/CAST(Population AS decimal))*100
FROM #PercentPopulationVaccinated

-- Creating View to store data for later visulatizations

CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.Continent, dea.Location, dea.Date, Population, vac.New_Vaccinations, 
SUM(vac.New_Vaccinations) OVER (PARTITION BY dea.Location ORDER BY dea.Location, 
dea.Date) AS RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT *
FROM PercentPopulationVaccinated