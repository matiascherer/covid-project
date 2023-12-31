# covid-project
This project utilizes Excel, SQL, and Tableau to analyze public data related to the COVID-19 pandemic. The comprehensive analysis provides insights into key metrics, trends, and patterns, offering a valuable resource for understanding the impact of the virus.

**Skills used:** 
  - **SQL:** Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types.
  - **Tableau:** Tables, Map Charts, Bar Charts and Line Charts with Forecast.

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


# Main Insights

- Despite representing only 10% of the global population, **Europe accounted for one-third of the total infections during the period from March 2020 to July 2023**. Countries such as Austria, France, and Slovenia experienced infection rates surpassing 50% of their populations, contributing to the substantial concentration of cases on the continent. Among the potential causes for this notable phenomenon, the **unrestricted movement of people among European Union countries is highlighted**.
- Shortly after the onset of the pandemic, **the mortality rate (total deaths/total cases) in Brazil showed a continuous increase, reaching its peak on 01/05/2020 at 6.99%**. Subsequently, **this rate began to decline due to the strengthening of healthcare infrastructure and the implementation of social distancing measures**, even before the introduction of vaccines.
- During the selected period (03/2020 to 07/2023), **Peru was the country that experienced the highest proportional loss of lives relative to its population (0.65%)**. With 221 thousand deaths in a total population of 34 million people, this equates to **650 deaths per 100 thousand inhabitants**. Despite implementing strict social isolation measures since the beginning of the pandemic, **the slow pace of the vaccination campaign and the inadequacy of the country's healthcare system** are potential factors contributing to this situation.

# Data Visualization
Below is an overview of the key queries executed for data visualization on **Tableau**:

- Total Cases, Total Deaths and Death Percentage (Global).
- Total Deaths per Continent.
- Total Infections and Percentage per Country.
- Total Infections and Percentage per Country Over Time.
- Total Cases Share per Continent Over Time.

![image](https://github.com/matiascherer/covid-project/assets/63814565/479fb6b5-fef1-4c72-884e-3848bc9b1d10)

![image](https://github.com/matiascherer/covid-project/assets/63814565/9ef80719-4fae-471d-95cd-cfdfc0c74131)

# Resources

**Access the interactive dashboards here:** 

- https://public.tableau.com/app/profile/matias.scherer/viz/CovidProject_16912046095940/Painel1
- https://public.tableau.com/app/profile/matias.scherer/viz/CovidProject2_17006999399440/Painel2?publish=yes
