
Use Portifolio

drop table if exists netflix
create table netflix
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
)

select * from netflix

insert into netflix
select *
from netflix_test

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Objectives

	--Analyzing the distribution of content types (movies vs TV shows).
		-- Big numbers

			select type, COUNT(*) as distribution from netflix
			group by type

		-- Analysis

			with Bignum as (
				select type, count(type) as distribution_number, country
				from netflix
				where country = 'canada' --SELECT THE COUNTRY
				group by type, country
			),
				Distribution_Percentage as (
				select type, cast(COUNT(*)*100/sum(COUNT(*)) over() as decimal (4,2)) AS distribution_percentage, country
				from netflix
				where country = 'canada' --SELECT THE COUNTRY
				group by type, country
			)
			select bn.type, bn.distribution_number, dp.distribution_percentage, bn.country from Distribution_Percentage dp join Bignum bn on dp.type = bn.type

			-- The distribution of movies is massively larger than tv shows. You can select the country to see local distribution.
			
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--Identifying the most common ratings for movies and TV shows.

		select top 10 type, rating, count(*) as rating_count from netflix
		group by type, rating
		order by rating_count desc
		-- We can see that the mature audience only is the most common rating for both movies and tv shows. The second most common is simmilar on the two of them too, being the TV-14.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--Listing and analyzing content based on release years, countries, and durations.

		-- Analysing how the production of each rating class of each content type changes over the years

		select type, release_year, count(*) as number_of_productions, rating from netflix
		where type = 'Movie'  -- See the how the production of movies and tv shows have been changing over the last 25 years
		group by type, release_year, rating 
		order by release_year desc
		-- Exporting this data to a python plataform and using the pandas and matplotlib library, we can see more clearly how the content production has been changing over the years. No valuable
		--insight was taken from this analysis

		-- Analysing the distribution of content based on the rating for each country

		select ltrim(rtrim(value)) as countries, rating, count(*) as rating_count from netflix
		cross apply
		string_split(country, ',')
		--where country = 'Brazil'
		group by value, rating
		order by rating_count desc

		-- Analysing the content distribution on each country
		
		select  
			ltrim(rtrim(value)) as countries, count(*) as distribution
		from netflix
		cross apply 
		string_split(country, ',')
		--where type = 'Movie' or 'TV Show' filter
		group by value
		order by distribution desc




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	--Exploring and categorizing content based on specific criteria and keywords.

		-- Categorizing content based on general classification

		select listed_in, count(*) as number_of_content from netflix	
		group by listed_in 
		order by number_of_content desc

		-- Movies with <= 90 min

		with Movies_less_than_90min as (
		select title, try_cast(replace(duration, 'min', '') as int) as duration_min_or_season from netflix where type = 'Movie'
		) select title, duration_min_or_season from Movies_less_than_90min
		where duration_min_or_season <= 90
		order by duration_min_or_season desc

		-- tv shows with < 1 season

		with season as (
		select title, try_cast(replace(duration, 'Season', '') as int) as seasons from netflix where type = 'TV Show'
		) select title, seasons from season 
		where seasons = 1
		
		--Categorizing the content based on the presence of the keywords 'kill' and 'violence' in 
		--the description field. Labeling content containing these keywords as 'Bad' and all other 
		--content as 'Good'. Counting how many items fall into each category.

		with label as (
		select *,
		case
			when description like '%kill%' or description like '%violence%' then 'bad content'
			else 'good content'
			end as category
		from netflix
		)
		select type, category,COUNT(*) as category_count from label
		group by category, type, category
		order by category_count desc