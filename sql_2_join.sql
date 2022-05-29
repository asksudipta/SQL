# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
select name,population
from city
where name like 'ping%' order by population;
#
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
#
select name ,Population
from city
where name like 'ran%' order by population desc;

#
# 3: Count all cities
select count(*)
from city;
#
#
# 4: Get the average population of all cities
#
select avg(population)
from city;
#
# 5: Get the biggest population found in any of the cities
#
select max(population) 
from city;
#
# 6: Get the smallest population found in any of the cities
#
select min(population)
from city;
#
# 7: Sum the population of all cities with a population below 10000
#
select sum(population)
from city
where population<10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
select count(name)
from city
where countrycode in('MOZ','VNM');
#
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
#
select countrycode,count(name)
 from city
 where countrycode in('MOZ','VNM')
 group by CountryCode;

#
# 10: Get average population of cities in MOZ and VNM
select avg(population)
from city
where CountryCode in ('MOZ','VNM');
#
#
# 11: Get the countrycodes with more than 200 cities
select countrycode,count(name)
from city
group by countrycode
having count(name) > 200;
#
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
select countrycode,count(name)
from city
group by countrycode
having count(name) > 200
order by count(name) ;
#
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
select cl.language,c.population
from city c,countrylanguage cl
where c.countrycode=cl.countrycode
and c.population between 400 and 500;
#
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
#
select c.name,cl.language,c.population
from city c,countrylanguage cl
where c.countrycode=cl.countrycode
and c.population between 500 and 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)

select cr.name,c.name ,c.population
from  city c,country cr
where c.countrycode=cr.code
and c.countrycode = (
					select c.countrycode
					from city c
					where c.population = 122199
                    );

#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
#
select cr.name,c.name ,c.population
from  city c,country cr
where c.countrycode=cr.code
and c.countrycode = (
					select c.countrycode
					from city c
					where c.population = 122199
                    )
and c.name  <> (
					select c.name
					from city c
					where c.population = 122199
                    )     ;               
                    
# 17: What are the city names in the country where Luanda is capital?

select name ,countrycode
from city 
where countrycode = (select countrycode from city where name='Luanda');
#
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren

select cr.region
from country cr,city ct
where cr.code=ct.countrycode 
and ct.name='Yaren';

#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
#
select ct.name,cl.language
from city ct,countrylanguage cl
where  ct.countrycode=cl.countrycode
and ct.name='riga';

# 20: Get the name of the most populous city
#
select name, max(POPULATION)
from country ;
 