<div align="center">
    <a href="https://sqlbolt.com/" target="_blank">
        <img alt="logo" width="45" height="45" src="https://raw.githubusercontent.com/FJrodafo/University/main/Languages/SQL/SQLBolt/Assets/Logo.png" />
    </a>
</div>

## Index

1. [SELECT queries 101](#select-queries-101)
2. [Queries with constraints (Pt. 1)](#queries-with-constraints-pt-1)
3. [Queries with constraints (Pt. 2)](#queries-with-constraints-pt-2)
4. [Filtering and sorting Query results]()

## SELECT queries 101

<details>
<summary>Table</summary>

| id  | title               | director       | year | length_minutes |
| --- | ------------------- | -------------- | ---- | -------------- |
| 1   | Toy Story           | John Lasseter  | 1995 | 81             |
| 2   | A Bug's Life        | John Lasseter  | 1998 | 95             |
| 3   | Toy Story 2         | John Lasseter  | 1999 | 93             |
| 4   | Monsters, Inc.      | Pete Docter    | 2001 | 92             |
| 5   | Finding Nemo        | Andrew Stanton | 2003 | 107            |
| 6   | The Incredibles     | Brad Bird      | 2004 | 116            |
| 7   | Cars                | John Lasseter  | 2006 | 117            |
| 8   | Ratatouille         | Brad Bird      | 2007 | 115            |
| 9   | WALL-E              | Andrew Stanton | 2008 | 104            |
| 10  | Up                  | Pete Docter    | 2009 | 101            |
| 11  | Toy Story 3         | Lee Unkrich    | 2010 | 103            |
| 12  | Cars 2              | John Lasseter  | 2011 | 120            |
| 13  | Brave               | Brenda Chapman | 2012 | 102            |
| 14  | Monsters University | Dan Scanlon    | 2013 | 110            |
</details>
<br />

```sql
-- Find the title of each film

SELECT title FROM movies;
```

```sql
-- Find the director of each film

SELECT director FROM movies;
```

```sql
-- Find the title and director of each film

SELECT title, director FROM movies;
```

```sql
-- Find the title and year of each film

SELECT title, year FROM movies;
```

```sql
-- Find all the information about each film

SELECT * FROM movies;
```

## Queries with constraints (Pt. 1)

<details>
<summary>Table</summary>

| id  | title               | director       | year | length_minutes |
| --- | ------------------- | -------------- | ---- | -------------- |
| 1   | Toy Story           | John Lasseter  | 1995 | 81             |
| 2   | A Bug's Life        | John Lasseter  | 1998 | 95             |
| 3   | Toy Story 2         | John Lasseter  | 1999 | 93             |
| 4   | Monsters, Inc.      | Pete Docter    | 2001 | 92             |
| 5   | Finding Nemo        | Andrew Stanton | 2003 | 107            |
| 6   | The Incredibles     | Brad Bird      | 2004 | 116            |
| 7   | Cars                | John Lasseter  | 2006 | 117            |
| 8   | Ratatouille         | Brad Bird      | 2007 | 115            |
| 9   | WALL-E              | Andrew Stanton | 2008 | 104            |
| 10  | Up                  | Pete Docter    | 2009 | 101            |
| 11  | Toy Story 3         | Lee Unkrich    | 2010 | 103            |
| 12  | Cars 2              | John Lasseter  | 2011 | 120            |
| 13  | Brave               | Brenda Chapman | 2012 | 102            |
| 14  | Monsters University | Dan Scanlon    | 2013 | 110            |
</details>
<br />

```sql
-- Find the movie with a row id of 6

SELECT * FROM movies WHERE id = 6;
```

```sql
-- Find the movies released in the years between 2000 and 2010

SELECT * FROM movies WHERE year BETWEEN 2000 AND 2010;
```

```sql
-- Find the movies not released in the years between 2000 and 2010

SELECT * FROM movies WHERE year NOT BETWEEN 2000 AND 2010;
```

```sql
-- Find the first 5 Pixar movies and their release year

SELECT * FROM movies WHERE id BETWEEN 1 AND 5;
```

## Queries with constraints (Pt. 2)

<details>
<summary>Table</summary>

| id  | title               | director       | year | length_minutes |
| --- | ------------------- | -------------- | ---- | -------------- |
| 1   | Toy Story           | John Lasseter  | 1995 | 81             |
| 2   | A Bug's Life        | John Lasseter  | 1998 | 95             |
| 3   | Toy Story 2         | John Lasseter  | 1999 | 93             |
| 4   | Monsters, Inc.      | Pete Docter    | 2001 | 92             |
| 5   | Finding Nemo        | Andrew Stanton | 2003 | 107            |
| 6   | The Incredibles     | Brad Bird      | 2004 | 116            |
| 7   | Cars                | John Lasseter  | 2006 | 117            |
| 8   | Ratatouille         | Brad Bird      | 2007 | 115            |
| 9   | WALL-E              | Andrew Stanton | 2008 | 104            |
| 10  | Up                  | Pete Docter    | 2009 | 101            |
| 11  | Toy Story 3         | Lee Unkrich    | 2010 | 103            |
| 12  | Cars 2              | John Lasseter  | 2011 | 120            |
| 13  | Brave               | Brenda Chapman | 2012 | 102            |
| 14  | Monsters University | Dan Scanlon    | 2013 | 110            |
| 87  | WALL-G              | Brenda Chapman | 2042 | 97             |
</details>
<br />

```sql
-- Find all the Toy Story movies

SELECT * FROM movies WHERE title LIKE 'Toy Story%';
```

```sql
-- Find all the movies directed by John Lasseter

SELECT * FROM movies WHERE director = 'John Lasseter';

SELECT * FROM movies WHERE director LIKE 'john lasseter';
```

```sql
-- Find all the movies (and director) not directed by John Lasseter

SELECT * FROM movies WHERE director != 'John Lasseter';

SELECT * FROM movies WHERE director NOT LIKE 'john lasseter';
```

```sql
-- Find all the WALL-* movies

SELECT * FROM movies WHERE title LIKE 'WALL-_';
```

## Filtering and sorting Query results

<details>
<summary>Table</summary>

| id  | title               | director       | year | length_minutes |
| --- | ------------------- | -------------- | ---- | -------------- |
| 1   | Cars 2              | John Lasseter  | 2011 | 120            |
| 2   | Up                  | Pete Docter    | 2009 | 101            |
| 3   | Finding Nemo        | Andrew Stanton | 2003 | 107            |
| 4   | Ratatouille         | Brad Bird      | 2007 | 115            |
| 5   | WALL-E              | Andrew Stanton | 2008 | 104            |
| 6   | Toy Story           | John Lasseter  | 1995 | 81             |
| 7   | A Bug's Life        | John Lasseter  | 1998 | 95             |
| 8   | Toy Story 2         | John Lasseter  | 1999 | 93             |
| 9   | Brave               | Brenda Chapman | 2012 | 102            |
| 10  | Monsters University | Dan Scanlon    | 2013 | 110            |
| 11  | Monsters, Inc.      | Pete Docter    | 2001 | 92             |
| 12  | Cars                | John Lasseter  | 2006 | 117            |
| 13  | Toy Story 3         | Lee Unkrich    | 2010 | 103            |
| 14  | The Incredibles     | Brad Bird      | 2004 | 116            |
</details>
<br />

```sql
-- List all directors of Pixar movies (alphabetically), without duplicates

SELECT DISTINCT director FROM movies ORDER BY director;
```

```sql
-- List the last four Pixar movies released (ordered from most recent to least)

SELECT * FROM movies ORDER BY year DESC LIMIT 4;
```

```sql
-- List the first five Pixar movies sorted alphabetically

SELECT * FROM movies ORDER BY title LIMIT 5;
SELECT * FROM movies ORDER BY title ASC LIMIT 5;
```

```sql
-- List the next five Pixar movies sorted alphabetically

SELECT * FROM movies ORDER BY title LIMIT 5 OFFSET 5;
```

## Simple SELECT Queries

<details>
<summary>Table</summary>

| city                | country       | population | latitude  | longitude   |
| ------------------- | ------------- | ---------- | --------- | ----------- |
| Guadalajara         | Mexico        | 1500800    | 20.659699 | -103.349609 |
| Toronto             | Canada        | 2795060    | 43.653226 | -79.383184  |
| Houston             | United States | 2195914    | 29.760427 | -95.369803  |
| New York            | United States | 8405837    | 40.712784 | -74.005941  |
| Philadelphia        | United States | 1553165    | 39.952584 | -75.165222  |
| Havana              | Cuba          | 2106146    | 23.05407  | -82.345189  |
| Mexico City         | Mexico        | 8555500    | 19.432608 | -99.133208  |
| Phoenix             | United States | 1513367    | 33.448377 | -112.074037 |
| Los Angeles         | United States | 3884307    | 34.052234 | -118.243685 |
| Ecatepec de Morelos | Mexico        | 1742000    | 19.601841 | -99.050674  |
| Montreal            | Canada        | 1717767    | 45.501689 | -73.567256  |
| Chicago             | United States | 2718782    | 41.878114 | -87.629798  |
</details>
<br />

```sql
-- List all the Canadian cities and their population

SELECT * FROM north_american_cities WHERE country = 'Canada';
```

```sql
-- Order all the cities in the United States by their latitude from north to south

SELECT *
FROM north_american_cities
WHERE country = 'United States'
ORDER BY latitude DESC;
```

```sql
-- List all the cities west of Chicago, ordered from west to east

SELECT *
FROM north_american_cities
WHERE longitude < -87.63
ORDER BY longitude;
```

```sql
-- List the two largest cities in Mexico (by population)

SELECT * FROM north_american_cities
WHERE country = 'Mexico'
ORDER BY population DESC
LIMIT 2;
```

```sql
-- List the third and fourth largest cities (by population) in the United States and their population

SELECT * FROM north_american_cities
WHERE country = 'United States'
ORDER BY population DESC
LIMIT 2
OFFSET 2;
```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>