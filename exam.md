1.
```sql
CREATE TABLE movies (
  id serial PRIMARY KEY,
  title text NOT NULL,
  year integer NOT NULL CHECK (LENGTH(year::text) = 4),
  run_time integer NOT NULL
);

```
2.
```sql
INSERT INTO movies 
            (title, year, run_time)
    VALUES ('Gravity', 2013, 91),
           ('M*A*S*H', 1970, 116),
           ('My Fair Lady', 1964, 170),
           ('Ocean''s Eleven', 2001, 116),
           ('The Perfect Storm', 2000, 130),
           ('While You Were Sleeping', 1995, 103),
           ('2001: A Space Odyssey', 1968, 149);

```

3.
```sql
SELECT title AS "Movie Title", year AS "Released", run_time AS "Run Time"
FROM movies
WHERE year < 2000
ORDER BY run_time DESC
LIMIT 3;
```

4.
```sql
CREATE TABLE actors (
  id serial PRIMARY KEY,
  name text NOT NULL
);
```
```sql
INSERT INTO actors (name)
    VALUES ('Abe Vigoda'),
           ('Audrey Hepburn'),
           ('Barbara Billingsley'),
           ('Elliot Gould'),
           ('George Clooney'),
           ('Sandra Bullock');
```
5.
```sql
ALTER TABLE movies ADD COLUMN actor_id REFERENCES actors(id);
```
```sql
ALTER TABLE actors ADD COLUMN movie_id REFERENCES movies(id);
```
```sql
CREATE TABLE movies_actors (
  id serial PRIMARY KEY,
  movie_id integer 
    REFERENCES movies(id) 
    ON DELETE CASCADE
    NOT NULL,
  actor_id integer 
    REFERENCES actors(id)
    ON DELETE CASCADE
    NOT NULL
);
```

```sql
INSERT INTO movies_actors (movie_id, actor_id)
    VALUES (4, 5),
           (4, 4),
           (5, 5),
           (2, 4),
           (3, 2),
           (1, 6),
           (1, 5),
           (6, 6);
INSERT INTO movies_actors (movie_id, actor_id)          
    VALUES (7);
```

6.
```sql
SELECT actors.name FROM actors
INNER JOIN movies_actors ON actors.id = actor_id
INNER JOIN movies ON movie_id = movies.id
WHERE movies.title = 'Gravity'
ORDER BY actors.id DESC;
```
```sql
SELECT movies.title FROM movies
INNER JOIN movies_actors ON movies.id = movie_id
INNER JOIN actors ON actor_id = actors.id
WHERE actors.name = 'George Clooney'
ORDER BY movies.id DESC;
```

7.
```sql
SELECT actors.name AS "Actor", COUNT(movies_actors.movie_id) AS "Number of Movies"
FROM actors
INNER JOIN movies_actors ON actors.id = actor_id
GROUP BY actors.name
HAVING COUNT(movies_actors.movie_id) >= 2;
```

8.
```sql
SELECT name AS "Actor"
FROM actors
WHERE actors.id NOT IN (SELECT actor_id FROM movies_actors);
```

```sql
SELECT title AS "Movie Title" 
FROM movies
WHERE movies.id NOT IN (SELECT movie_id FROM movies_actors);
```

9.
```sql
ALTER TABLE movies ADD CHECK (year >= 1878);
```
INSERT INTO movies (title, year, run_time)
    VALUES ('My Movie', 1800, 115);
10.
```sql

```

11.
```sql

```

12.
```sql

```

13.
```sql

```

14.
```sql

```

15.
```sql

```

16.
```sql

```

17.
```sql

```

18.
```sql

```

19.
```sql

```

20.
```sql

```