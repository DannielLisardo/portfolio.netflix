# Netflix movies and TV shows data analysis using SQL
![Netflix Logo](https://github.com/DannielLisardo/portfolio.netflix/blob/main/logo.png)

## Overview
This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to extract valuable insights and answer various business questions based on the dataset. The following README provides a detailed account of the project's objectives, business problems, solutions, findings, and conclusions.


## 🎯 Business Objectives and Solutions

### 1️⃣ Analyzed the distribution of content types (Movies vs. TV Shows) 
I compared the number of movies and TV shows in the catalog and examined how this distribution varied across different countries.

### 2️⃣ Explored content ratings
I identified the most common ratings globally and analyzed the differences between movies and TV shows. Additionally, I observed the distribution of specific ratings by country.

### 3️⃣ Assessed production trends over time
I investigated how content production changed over the years, categorizing by content type (movies and TV shows) and ratings.

### 4️⃣ Categorized and filtered content based on specific criteria
I classified content as "good" or "bad" based on the presence of keywords in descriptions, identified movies with a runtime of 90 minutes or less, and selected TV shows with only one season.

### 5️⃣ Analyzed content distribution by country
I separated countries listed in each row individually and determined the number of pieces of content distributed in each country.

### 6️⃣ Grouped content by genre
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

---

## Findings and Conclusion

- **Content Distribution:** The dataset contains a diverse range of movies and TV shows with varying ratings and genres.
- **Common Ratings:** Insights into the most common ratings provide an understanding of the content's target audience.
- **Geographical Insights:** The count of content releases by Brazil highlight regional content distribution.
- **Content Categorization:** Categorizing content based on specific keywords helps in understanding the nature of content available on Netflix.

This analysis provides a comprehensive view of Netflix's content and can help inform content strategy and decision-making.





