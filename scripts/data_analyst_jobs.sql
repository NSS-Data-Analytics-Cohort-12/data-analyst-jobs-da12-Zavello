-- 1.	How many rows are in the data_analyst_jobs table?

-- Select *
-- From data_analyst_jobs;

-- 1793

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

-- Select *
-- From data_analyst_jobs
-- Limit (10);

-- ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

-- Select location, Count(location)
-- From data_analyst_jobs
-- Where location = 'TN' Or location = 'KY'
-- Group By location;

-- TN = 21 postings, KY = 6 postings

-- 4.	How many postings in Tennessee have a star rating above 4?

-- Select location, Count(star_rating) As postings_over_4_stars
-- From data_analyst_jobs
-- Where star_rating >= 4 AND location = 'TN'
-- Group By location;

-- 4 postings over 4 star ratings

-- 5.	How many postings in the dataset have a review count between 500 and 1000?

-- Select Count(title) As postings_btwn_500_1000
-- From data_analyst_jobs
-- Where review_count Between 500 And 1000;

-- 151 jobs postings

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

-- Select location As state, Round(Avg(star_rating),2) As avg_rating
-- From data_analyst_jobs
-- Where location Is Not NULL
-- Group By location
-- Order By avg_rating DESC;

-- Nebraska has the highest rating.

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

-- Select Count(Distinct title) As unique_titles
-- From data_analyst_jobs;

-- 881 unique job titles

-- 8.	How many unique job titles are there for California companies?

-- Select location, Count(Distinct title)
-- From data_analyst_jobs
-- Where location = 'CA'
-- Group By location;

-- 230 unique positions in California

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

-- Select company, Round(Avg(star_rating),2)
-- From data_analyst_jobs
-- Where review_count > 5000
-- 	And company IS NOT NULL
-- Group By company;

-- 40 companies over 5000 review

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

-- Select company, Round(Avg(star_rating),2)As avg_rating
-- From data_analyst_jobs
-- Where review_count > 5000
-- 	And company IS NOT NULL
-- Group By company
-- Order By avg_rating DESC;

-- Unilever is the highest with 4.2 stars

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

-- Select Count(title) As titles_with_analyst
-- From data_analyst_jobs
-- Where Lower(title) Like '%analyst%';

-- 1669 jobs with 'Analyst' in the title

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

-- Select title
-- From data_analyst_jobs
-- Where Lower(title) Not Like ('%analyst%')
-- 	And Lower(title) Not Like ('%analytics%');

-- Tableau is the shared name.

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

Select domain, count(title) As postings
From data_analyst_jobs
Where days_since_posting > 21
	And domain IS NOT Null
	And lower(skill) Like '%sql%' 
Group by domain
Order by postings DESC;

-- Internet and Software, Banks and Financial Services, and Consulting and Business Service.

-- Select domain, Sum(Count(title)) As total_postings
-- From data_analyst_jobs
-- Where days_since_posting > 21
-- 	And domain IS NOT Null
-- 	And lower(skill) Like '%sql%' 
-- Group by domain
-- Order by postings DESC;

