# Netflix movies and TV shows data analysis using SQL
![Netflix Logo](https://github.com/DannielLisardo/portfolio.netflix/blob/main/logo.png)

## Overview
This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to extract valuable insights and answer various business questions based on the dataset. The following README provides a detailed account of the project's objectives, business problems, solutions, findings, and conclusions.

## Objectives

--Analyzed the distribution of content types (Movies vs. TV Shows) 
I compared the number of movies and TV shows in the catalog and examined how this distribution varied across different countries.

--Explored content ratings
I identified the most common ratings globally and analyzed the differences between movies and TV shows. Additionally, I observed the distribution of specific ratings by country.

--Assessed production trends over time
I investigated how content production changed over the years, categorizing by content type (movies and TV shows) and ratings.

--Categorized and filtered content based on specific criteria
I classified content as "good" or "bad" based on the presence of keywords in descriptions, identified movies with a runtime of 90 minutes or less, and selected TV shows with only one season.

--Analyzed content distribution by country
I separated countries listed in each row individually and determined the number of pieces of content distributed in each country.

--Grouped content by genre
I counted and listed the number of pieces of content associated with each genre in the listed_in column.

## Dataset

The data for this project is sourced from the Kaggle dataset:

- **Dataset Link:** [Movies Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

## Schema

```sql
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    	show_id	nvarchar(255),
	type	nvarchar(255),
	title	nvarchar(255),
	director	nvarchar(255),
	cast	nvarchar(max),
	country	nvarchar(255),
	date_added	nvarchar(255),
	release_year	nvarchar(255),
	rating	nvarchar(255),
	duration	nvarchar(255),
	listed_in	nvarchar(255),
	description nvarchar(max)
);
```

Business Problems and Solutions
1. Analyze the Distribution of Content Types (Movies vs. TV Shows)
sql
Copiar
Editar
SELECT 
    type,
    COUNT(*) AS distribution 
FROM netflix 
GROUP BY type;
Objective: Determine the distribution of content types on Netflix (Movies vs. TV Shows).

2. Analyze the Distribution of Content Types by Country
sql
Copiar
Editar
WITH Bignum AS (
    SELECT 
        type, 
        COUNT(type) AS distribution_number, 
        country 
    FROM netflix 
    WHERE country = 'Canada' -- SELECT THE COUNTRY 
    GROUP BY type, country
),  
Distribution_Percentage AS (
    SELECT 
        type, 
        CAST(COUNT(*) * 100 / SUM(COUNT(*)) OVER () AS DECIMAL(4, 2)) AS distribution_percentage, 
        country 
    FROM netflix 
    WHERE country = 'Canada' -- SELECT THE COUNTRY 
    GROUP BY type, country
)  
SELECT 
    bn.type, 
    bn.distribution_number, 
    dp.distribution_percentage, 
    bn.country 
FROM Distribution_Percentage dp 
JOIN Bignum bn 
ON dp.type = bn.type;
Objective: Analyze the distribution of content types (Movies vs. TV Shows) for a specific country.

3. Identify the Most Common Ratings for Movies and TV Shows
sql
Copiar
Editar
SELECT 
    type, 
    rating, 
    COUNT(*) AS rating_count 
FROM netflix 
GROUP BY type, rating 
ORDER BY rating_count DESC;
Objective: Identify the most frequently assigned ratings for Movies and TV Shows on Netflix.

4. Analyze Content Production Trends Over the Years
sql
Copiar
Editar
SELECT 
    type, 
    release_year, 
    COUNT(*) AS number_of_productions, 
    rating 
FROM netflix 
WHERE type = 'Movie' -- Filter by Movies or TV Shows 
GROUP BY type, release_year, rating 
ORDER BY release_year DESC;
Objective: Examine how content production has evolved over the years, broken down by type and rating.

5. Categorize Content Based on Genres
sql
Copiar
Editar
SELECT 
    listed_in, 
    COUNT(*) AS number_of_content 
FROM netflix 
GROUP BY listed_in 
ORDER BY number_of_content DESC;
Objective: Categorize content based on genres and analyze the number of items in each category.

6. Identify Short Movies and Limited TV Shows
Movies with Duration ≤ 90 Minutes
sql
Copiar
Editar
WITH Movies_less_than_90min AS (
    SELECT 
        title, 
        TRY_CAST(REPLACE(duration, 'min', '') AS INT) AS duration_min_or_season 
    FROM netflix 
    WHERE type = 'Movie'
)  
SELECT 
    title, 
    duration_min_or_season 
FROM Movies_less_than_90min 
WHERE duration_min_or_season <= 90 
ORDER BY duration_min_or_season DESC;
TV Shows with Less Than 1 Season
sql
Copiar
Editar
WITH Season AS (
    SELECT 
        title, 
        TRY_CAST(REPLACE(duration, 'Season', '') AS INT) AS seasons 
    FROM netflix 
    WHERE type = 'TV Show'
)  
SELECT 
    title, 
    seasons 
FROM Season 
WHERE seasons = 1;
Objective: Identify Movies with a runtime of 90 minutes or less and TV Shows with only one season.

7. Categorize Content Based on Keywords
sql
Copiar
Editar
WITH Label AS (
    SELECT 
        *, 
        CASE 
            WHEN description LIKE '%kill%' OR description LIKE '%violence%' THEN 'Bad Content' 
            ELSE 'Good Content' 
        END AS category 
    FROM netflix
)  
SELECT 
    category, 
    COUNT(*) AS total_content 
FROM Label 
GROUP BY category;
Objective: Categorize content as 'Bad' if it contains keywords such as 'kill' or 'violence,' otherwise categorize it as 'Good.'

## Findings and Conclusion

- **Content Distribution:** The dataset contains a diverse range of movies and TV shows with varying ratings and genres.
- **Common Ratings:** Insights into the most common ratings provide an understanding of the content's target audience.
- **Geographical Insights:** The count of content releases by Brazil highlight regional content distribution.
- **Content Categorization:** Categorizing content based on specific keywords helps in understanding the nature of content available on Netflix.

This analysis provides a comprehensive view of Netflix's content and can help inform content strategy and decision-making.





