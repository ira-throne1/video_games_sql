-- Exploratory data analysis aimed to find the best year in the history of video games
-- In the beginning of the project there were only two tables: 'game_sales.csv' and 'reviews.csv'

-- Select all information for the top best-selling games
-- Order the results from the best-selling to the tenth best-selling
SELECT TOP (10) *
FROM game_sales
ORDER BY Total_Shipped DESC


-- Join games_sales and reviews
-- Count how many games have no critic and user reviews
SELECT COUNT(Name) 'No_Scores'
FROM reviews rev
WHERE Critic_Score IS NULL AND User_Score IS NULL


-- Select average critic scores for each year, rounded
-- Group by release year
-- Order by the critics score and select top 10
WITH CTE_all_critic_reviews AS (
SELECT ROUND(AVG(Critic_Score), 2) cr_score, Year
FROM game_sales sal
JOIN reviews rev
	ON sal.Name = rev.Name AND sal.Platform = rev.Platform
WHERE Critic_Score IS NOT NULL
GROUP BY Year)

SELECT TOP(10) *
INTO all_critic_reviews
FROM CTE_all_critic_reviews
ORDER BY cr_score DESC


-- Count how many games were reviewed each year
-- Only return years with at least 4 reviewed games
WITH CTE_ten_critic_reviews AS (
SELECT ROUND(AVG(Critic_Score), 2) cr_score, COUNT(sal.Name) cr_games_reviewed, Year
FROM game_sales sal
JOIN reviews rev
	ON sal.Name = rev.Name AND sal.Platform = rev.Platform
WHERE Critic_Score IS NOT NULL
GROUP BY Year)

SELECT TOP(10) *
INTO ten_critic_reviews
FROM CTE_ten_critic_reviews
WHERE cr_games_reviewed > 9
ORDER BY cr_score DESC


-- Select years that were filtered out in the second table
SELECT *
FROM all_critic_reviews
EXCEPT
SELECT cr_score, Year
FROM ten_critic_reviews


-- Count how many games were reviewed each year
-- Only return years with at least 4 reviewed games
-- Select top 10 years for user scores
WITH CTE_ten_user_reviews AS (
SELECT ROUND(AVG(User_Score), 2) us_score, COUNT(sal.Name) us_games_reviewed, Year
FROM game_sales sal
JOIN reviews rev
	ON sal.Name = rev.Name AND sal.Platform = rev.Platform
WHERE User_Score IS NOT NULL
GROUP BY Year)

SELECT TOP(10) *
INTO ten_user_reviews
FROM CTE_ten_user_reviews
WHERE us_games_reviewed > 9
ORDER BY us_score DESC


-- Select years that were in top 10 for critics and top 10 for users (with at least ten reviews)
-- Save the results into a separate table
SELECT cr_score, cr_games_reviewed, us_score, us_games_reviewed, cr.Year
INTO best_reviews
FROM ten_user_reviews ur
JOIN ten_critic_reviews cr
ON ur.Year = cr.Year


-- Select year and sales for each year, sort them in a descending order
-- Only show years that are in best_reviews table
SELECT sal.Year, SUM(Total_shipped) sales
FROM game_sales sal
JOIN best_reviews br
	ON sal.Year = br.Year
GROUP BY sal.Year
ORDER BY sales DESC

-- Based on this analysis, the best year for video games was in 2013