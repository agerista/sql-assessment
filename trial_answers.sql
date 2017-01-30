1. SELECT * FROM brands;

2. SELECT * FROM models WHERE brand_id = 'pon';

3. SELECT brand_id, name FROM models WHERE year = '1964';

4.  SELECT DISTINCT m.name AS model_name, b.name AS brand_name, headquarters
    FROM models AS m
    JOIN brands AS b ON b.brand_id = m.brand_id
    WHERE m.name = 'Mustang';

5.  SELECT *
    FROM brands
    ORDER BY founded ASC 
    LIMIT 3;

6. SELECT COUNT(*)
    FROM models
    WHERE brand_id = 'for';

7. SELECT name FROM brands WHERE discontinued IS NULL;

8. SELECT * 
    FROM models
    ORDER BY name, model_id, year, brand_id
    LIMIT 10
    OFFSET 25;

 model_id | year | brand_id |   name   
----------+------+----------+----------
        6 | 1954 | che      | Corvette
        8 | 1955 | che      | Corvette
       10 | 1956 | che      | Corvette
       11 | 1957 | che      | Corvette
       13 | 1958 | che      | Corvette
       20 | 1960 | che      | Corvette
       38 | 1964 | che      | Corvette
       37 | 1963 | che      | Corvette
       25 | 1961 | che      | Corvette
       27 | 1962 | che      | Corvette

9. SELECT m.year, MAX(m.name), m.model_id, a.name
    FROM models as m
        LEFT JOIN awards AS a
        ON m.model_id = a.winner_id
    WHERE m.year > 1963
    GROUP BY m.year, m.model_id, a.name;

    

    
     year |    name     | model_id |       name        
------+-------------+----------+-------------------
 2015 | Malibu      |       47 | IIHS Safety Award
 2015 | Outback     |       48 | IIHS Safety Award
 1964 | Mustang     |       39 | 
 1964 | Mini Cooper |       46 | 
 1964 | Galaxie     |       40 | 
 1964 | Corvette    |       38 | 
 1964 | Bonneville  |       42 | 
 1964 | LeMans      |       41 | 
 1964 | Fury        |       44 | 
 1964 | Avanti      |       45 | 
 1964 | Grand Prix  |       43 |

10. SELECT b.name, 
            m.year, 
            m.name 
    FROM brands AS b
    LEFT JOIN models AS m
      ON b.brand_id = m.brand_id 
    GROUP BY b.name, m.year, m.name;

11. SELECT  b.name,
            m.name,
            m.year,
            b.discontinued,
            (b.discontinued - m.year) AS years_until_brand_discontinued 
    FROM models AS m
        LEFT JOIN brands AS b
            ON m.brand_id = b.brand_id
    WHERE b.discontinued IS NOT NULL 
    ORDER BY years_until_brand_discontinued;

13. SELECT b.brand_id
        FROM brands AS b
        LEFT JOIN models AS m
        ON b.brand_id = m.brand_id
        GROUP BY b.brand_id
        HAVING COUNT(*) > 5;

14. DISTINCT name, year
        FROM models
        WHERE year IN
        (SELECT founded FROM brands)
        ORDER BY year ASC;
