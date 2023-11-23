# covid-project
This project utilizes Excel, SQL, and Tableau to analyze public data related to the COVID-19 pandemic. The comprehensive analysis provides insights into key metrics, trends, and patterns, offering a valuable resource for understanding the impact of the virus.

**Skills used:** Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types, DataViz on Tableau (Tables, Map Charts, Bar Charts and Line Charts with Forecast).

**Data source:** https://ourworldindata.org/coronavirus

**Data range:** Jan/2020 - Jul/2023

![image](https://github.com/matiascherer/covid-project/assets/63814565/5bad4b8a-9c61-4bac-9d3b-3d115fb2f1da)

# Data Exploration and Preparation
Below is an overview of the key queries executed for data exploration and analysis:

- Initial exploration of the dataset, filtering out records with a null continent, and ordering by location and date.
- Alteration of the data type of the total_deaths column to decimal.
- Selection of relevant columns for analysis: location, date, total_cases, new_cases, total_deaths, and population.
- Initial exploration of the CovidVaccinations dataset, ordering by location and date.
- Analysis of total cases vs. total deaths to understand the likelihood of death if contracting COVID-19 in Brazil.
- Examination of total cases vs. population to determine the percentage of the population infected.
- Analysis of the the vaccinated population per country over time.

**Example:**

![image](https://github.com/matiascherer/covid-project/assets/63814565/17ad32a2-da97-47ac-85f5-ea665c2308b6)


# Main insights

- C

# Data Visualization
Below is an overview of the key queries executed for data visualization on **Tableau**:

- Total cases, total deaths and death percentage (global).
- Total deaths per continent.
- Total infections and percentage per country.
- Total infections and percentage per country over time.
- Total Cases share per Continent over time.

![image](https://github.com/matiascherer/covid-project/assets/63814565/479fb6b5-fef1-4c72-884e-3848bc9b1d10)

![image](https://github.com/matiascherer/covid-project/assets/63814565/9ef80719-4fae-471d-95cd-cfdfc0c74131)


**Access the interactive dashboards here:** 

- https://public.tableau.com/app/profile/matias.scherer/viz/CovidProject_16912046095940/Painel1
- https://public.tableau.com/app/profile/matias.scherer/viz/CovidProject2_17006999399440/Painel2?publish=yes
