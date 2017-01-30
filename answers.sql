1

-----

Select all fields for all brands in the brands table.

The result set for this query should be every record in the brands table.

-----


SELECT * FROM brands;


==========
2

-----

Select all fields for all car models made by Pontiac in the
models table.

The result set should be:
 model_id | year | brand_id |    name    
----------+------+----------+------------
       24 | 1961 | pon      | Tempest
       26 | 1962 | pon      | Grand Prix
       35 | 1963 | pon      | Grand Prix
       41 | 1964 | pon      | LeMans
       42 | 1964 | pon      | Bonneville
       43 | 1964 | pon      | Grand Prix
(6 rows)


-----


SELECT * 
FROM models
WHERE brand_id = 'pon';


==========
3

-----

Select the brand id and model name for all models made in
1964 from the models table.

The result set should be:
 brand_id |    name     
----------+-------------
 che      | Corvette
 for      | Mustang
 for      | Galaxie
 pon      | LeMans
 pon      | Bonneville
 pon      | Grand Prix
 ply      | Fury
 stu      | Avanti
 aus      | Mini Cooper
(9 rows)
 

-----


SELECT brand_id, name
FROM models
WHERE year = '1964';


==========
4

-----

Select the model name, brand name, and headquarters for
the Ford Mustang from the models and brands tables.

The result set should be:
 model_name | brand_name | headquarters 
------------+------------+--------------
 Mustang    | Ford       | Dearborn, MI
 (1 rows)


-----


SELECT DISTINCT m.name AS model_name, b.name AS brand_name, headquarters
    FROM models AS m
    JOIN brands AS b ON b.brand_id = m.brand_id
    WHERE m.name = 'Mustang';


==========
5

-----

Select all rows for the three oldest brands from the brands
table.

The result set should be:
 brand_id |    name    | founded |    headquarters     | discontinued 
----------+------------+---------+---------------------+--------------
 stu      | Studebaker |    1852 | South Bend, Indiana |         1967
 ram      | Rambler    |    1901 | Kenosha, Washington |         1969
 cad      | Cadillac   |    1902 | New York City, NY   |             
(3 rows)


-----


SELECT *
    FROM brands
    ORDER BY founded ASC 
    LIMIT 3;


==========
6

-----

Count the Ford models in the database. The output should be a
number.

The result set should be:
 count 
-------
     6
(1 row)


-----


SELECT COUNT(*)
FROM models
WHERE brand_id = 'for';


==========
7

-----

Select the brand name of any and all car brands that are not
discontinued.

The result set should be:
   name    
-----------
 Ford
 Chrysler
 Citroen
 Chevrolet
 Cadillac
 BMW
 Buick
 Tesla
 Subaru
(9 rows)


-----


SELECT name FROM brands WHERE discontinued IS NULL;


==========
12

-----

Write a query that selects the name and year founded for brands that do NOT have any
models in the models table.

The correct result set is:

 name  | founded
-------+---------
 Tesla |    2003
(1 rows)

-----


SELECT b.name, founded
FROM brands AS b
LEFT JOIN models AS m
ON b.brand_id = m.brand_id
WHERE m.model_id IS NULL
;


==========
14

-----

Using a subquery, select the name and year of any model whose
year is the same year that ANY brand was founded.

The result set should be:

   name    | year 
-----------+------
 Imperial  | 1926
 Corvette  | 1953
 Corvette  | 1954
 Fleetwood | 1954
(4 rows)

-----


SELECT DISTINCT name, year
FROM models
WHERE year IN
(SELECT founded FROM brands)
ORDER BY year ASC
;