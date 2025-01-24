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

## 🎯 Business Objectives and Solutions

### 1️⃣ Analyze the Distribution of Content Types (Movies vs. TV Shows)
**Objective:** Compare the number of movies and TV shows in the catalog and examine how this distribution varies across different countries.  
**Solution:** The content types were grouped, and counts were calculated for each type, including variations by country.

---

### 2️⃣ Explore Content Ratings
**Objective:** Identify the most common ratings globally and analyze the differences between movies and TV shows. Additionally, observe how specific ratings are distributed by country.  
**Solution:** Rankings and counts of ratings were computed for both global and country-specific analyses.

---

### 3️⃣ Assess Production Trends Over Time
**Objective:** Investigate how content production has changed over the years, categorized by content type (movies vs. TV shows) and ratings.  
**Solution:** Content production data was grouped by year, type, and rating to uncover historical trends.

---

### 4️⃣ Categorize and Filter Content Based on Specific Criteria
**Objective:** Classify content as "good" or "bad" based on the presence of keywords in descriptions. Identify movies with a runtime of 90 minutes or less and TV shows with only one season.  
**Solution:** Filters and keyword-based categorization were applied to classify and retrieve content matching these specific criteria.

---

### 5️⃣ Analyze Content Distribution by Country
**Objective:** Determine the number of pieces of content distributed in each country by separating countries listed in each row individually.  
**Solution:** Countries were extracted from the dataset, grouped, and their respective content counts were calculated.

---

### 6️⃣ Group Content by Genre
**Objective:** Count and list the number of pieces of content associated with each genre in the `listed_in` column.  
**Solution:** Genres were extracted from the dataset, and counts for each were computed to summarize content distribution by genre.

---

## Findings and Conclusion

- **Content Distribution:** The dataset contains a diverse range of movies and TV shows with varying ratings and genres.
- **Common Ratings:** Insights into the most common ratings provide an understanding of the content's target audience.
- **Geographical Insights:** The count of content releases by Brazil highlight regional content distribution.
- **Content Categorization:** Categorizing content based on specific keywords helps in understanding the nature of content available on Netflix.

This analysis provides a comprehensive view of Netflix's content and can help inform content strategy and decision-making.





