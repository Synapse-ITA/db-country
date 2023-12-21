-- Selezionare tutte le nazioni il cui nome inizia con la P e la cui area è maggiore di 1000 kmq
select *
from countries
where name like 'p%' and area > 1000;

-- 2. Contare quante nazioni sono presenti nel database
select count(*) as countries_number
from countries;

-- 3. Selezionare il nome delle regioni del continente europeo, in ordine alfabetico
select r.name	
from regions r
join continents c on r.continent_id = c.continent_id
where c.name = 'Europe';

-- 4. Contare quante regioni sono presenti nel continente Africa
select count(*) as africa_regions
from regions r
join continents c on r.continent_id = c.continent_id
where c.name = 'Africa';

-- 5. Selezionare quali nazioni non hanno un national day
select count(*) as no_national_day_countries
from countries c 
where national_day is null;

-- 6. Per ogni nazione, in ordine alfabetico, selezionare il nome, la regione e il continente
select c.name as country_name, r.name as region_name, c2.name as continent_name
from countries c 
join regions r on c.region_id = r.region_id 
join continents c2 on r.continent_id = c2.continent_id
order by c.name asc;

-- 7. Selezionare le lingue ufficiali dell’Albania
select l.`language` 
from languages l
join country_languages cl on l.language_id = cl.language_id
join countries c on cl.country_id = c.country_id
where c.name = 'Albania' and cl.official = 1;

-- 8. Selezionare il Gross domestic product (GDP) medio dello United Kingdom tra il 2000 e il 2010
select avg(gdp) as media_gdp_unitedkingdom
from country_stats cs
join countries c on cs.country_id = c.country_id
where c.name = "United Kingdom" and year between 2000 and 2010;

-- 9. Selezionare tutte le nazioni in cui si parla hindi, ordinate dalla più estesa alla meno estesa
select c.name, c.area 
from countries c
join country_languages cl on c.country_id = cl.country_id
join languages l on cl.language_id = l.language_id
where l.`language` = "Hindi"
order by c.area asc;

-- 10. Modificare la nazione di nome Italy, inserendo come national day il 2 giugno 1946
update countries
set national_day = '1946-06-02'
where countries.name = 'Italy';

-- 11. Selezionare le nazioni il cui national day è avvenuto prima del 1900, ordinate per national day dal più recente al meno recente
select *
from countries
where national_day < '1900-01-01'
order by national_day desc;

-- 12. Contare quante lingue sono parlate in Italia
select count(*) as numero_lingue_italia
from country_languages cl
join countries c on cl.country_id = c.country_id
where c.name = 'Italy';

-- 13. Per la regione Antarctica mostrare il valore dell’area totale e dell’area media delle nazioni
select r.name as region_name, sum(c.area) as area_totale, avg(c.area) as area_media
from countries c
join regions r on c.region_id = r.region_id
where r.name = 'Antarctica';







