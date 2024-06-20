<div align="center">
    <a href="https://sqlbolt.com/" target="_blank">
        <img alt="logo" height="45" src="https://raw.githubusercontent.com/FJrodafo/University/main/Languages/SQL/SQLBolt/Assets/Logo.png" />
    </a>
</div>

## Index

1. [SELECT queries 101](#select-queries-101)
2. [Queries with constraints (Pt. 1)](#queries-with-constraints-pt-1)
3. [Queries with constraints (Pt. 2)](#queries-with-constraints-pt-2)

## SELECT queries 101

<details>
<summary>Show/Hide table</summary>

| Id  | Title               | Director       | Year | Length_minutes |
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
</br>

```sql
-- Find the title of each film

SELECT Title FROM movies;
```

```sql
-- Find the director of each film

SELECT Director FROM movies;
```

```sql
-- Find the title and director of each film

SELECT Title, Director FROM movies;
```

```sql
-- Find the title and year of each film

SELECT Title, Year FROM movies;
```

```sql
-- Find all the information about each film

SELECT * FROM movies;
```

## Queries with constraints (Pt. 1)

<details>
<summary>Show/Hide table</summary>

| Id  | Title               | Director       | Year | Length_minutes |
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
</br>

```sql
-- Find the movie with a row id of 6

SELECT * FROM movies WHERE Id = 6;
```

```sql
-- Find the movies released in the years between 2000 and 2010

SELECT * FROM movies WHERE Year BETWEEN 2000 AND 2010;
```

```sql
-- Find the movies not released in the years between 2000 and 2010

SELECT * FROM movies WHERE Year NOT BETWEEN 2000 AND 2010;
```

```sql
-- Find the first 5 Pixar movies and their release year

SELECT Year FROM movies WHERE Id BETWEEN 1 AND 5;
```

## Queries with constraints (Pt. 2)
