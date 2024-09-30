# Netflix Data Analysis - SQL Project

![Netflix Data Analysis](https://github.com/Veer041/SQL-Projects/blob/main/Netflix%20DataAnalysis%20SQL%20Project/Netflix_logo.jpg) 

## Project Overview

This project, titled **"Netflix Movies and TV Shows Data Analysis Using SQL"**, explores the vast Netflix content library to answer key business questions. By leveraging SQL, we analyze the catalog of movies and TV shows, focusing on various metrics such as content type, ratings, release year, duration, genre, and country of origin.

### Objectives
- **Content Distribution**: Analyze the distribution between movies and TV shows on Netflix.
- **Content Ratings**: Identify the most common ratings for both movies and TV shows.
- **Year-based Analysis**: List all movies released in a specific year (e.g., 2020).
- **Geographical Insights**: Discover the top 5 countries with the most Netflix content.
- **Content Duration**: Identify the longest movie available on the platform.
- **Recent Content**: Analyze content added over the last 5 years.

## Key Areas of Analysis
- **Popular Directors and Actors**: Find all movies or TV shows directed by 'Rajiv Chilaka' and count how many movies actor 'Salman Khan' appeared in.
- **Content by Genre**: Count the number of content items in each genre and list all documentaries.
- **Season-based TV Shows**: List all TV shows with more than 4 seasons.
- **Keyword Analysis**: Categorize content based on the presence of keywords like "kill" and "violence" in the description, labeling them as "Bad" or "Good".

## SQL Queries and Schema

The following schema was used to structure and analyze the Netflix dataset:
```sql
CREATE TABLE NETFLIX
(
 SHOW_ID VARCHAR(5) PRIMARY KEY,
 TYPE VARCHAR(10),
 TITLE VARCHAR(250),
 DIRECTOR VARCHAR(550),
 CASTS VARCHAR(1050),
 COUNTRY VARCHAR(550),
 DATE_ADDED VARCHAR(55),
 RELEASE_YEAR INT,
 RATING VARCHAR(15),
 DURATION VARCHAR(15),
 LISTED_IN VARCHAR(250),
 DESCRIPTION VARCHAR(550)
);
