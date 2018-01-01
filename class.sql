use world;
select * from city;

desc countrylanguage;

select count(*) from countrylanguage where CountryCode = "IND";

desc country;

select population from country where code = "IND";


select count(*) from country;

select count(distinct language) from countrylanguage where IsOfficial = 1;
select count(distinct CountryCode) from countrylanguage where language = "hindi";


select * from country;
select * from countrylanguage;

select distinct CountryCode from countrylanguage group by countryCode having count(Language)>5;


select a.continent from (select continent,sum(surfaceArea) as area from country group by continent) as a order by a.area desc limit 1;

select a.continent from (select continent,sum(surfaceArea) as area from country group by continent) as a order by a.area limit 1;

select a.continent from (select continent,sum(surfaceArea) as area from country group by continent) as a where a.area = max(a.area);

select continent,avg(lifeExpectancy) as area from country where continent = "Asia";

select avg(lifeExpectancy) from country;

delimiter $$
create  PROCEDURE `demoprocedure` (IN cityid int)
begin
	select * from city where id = cityid;
end$$
delimiter ;


call demoprocedure(5);



delimiter $$
create  PROCEDURE `demoprocedure` (IN cityid int, out popcount int)
begin
	declare tempvar int;
	select Population into tempvar from city where id = cityid;
    set popcount = tempvar;
end$$
delimiter ;


call demoprocedure();


select now();

select sysdate();


select * from city;

create view vw_asiacountries as select Name from country where continent = 'asia';

select * from vw_asiacountries;


create or replace view vw_africacountries as select c.Name as country,cc.Name as city from country as c right outer join city cc on c.Code = cc.CountryCode where c.continent = 'africa';

select * from vw_africacountries;
select count(*) from vw_africacountries;


select c.Name as country,cc.Name as city from country as c right outer join city cc on c.Code = cc.CountryCode where c.continent = 'africa';


delimiter $$
create function whichCountry(cityname varchar(30))
returns varchar(30)
begin
	return (select country.name from country join city on country.Code = city.CountryCode where city.Name = cityname limit 1);
end$$
delimiter ;

select whichCountry("Hyderabad");


select * from city;

drop function whichCountry;

delimiter $$
create function getCity(countryname varchar(30))
returns varchar(30)
begin
	return (select city.name from country join city on country.Code = city.CountryCode where country.Name = countryname limit 1);
end$$
delimiter ;

select getCity("Afghanistan");


select * from city;

drop function getCity;

select * from city join country on city.countrycode = country.code;


select * from country where country.name like "af%";




drop procedure countrylangs;
delimiter $$
create procedure `countrylangs` ()
begin
select country.name,countrylanguage.language from country right outer join countrylanguage on country.code = countrylanguage.countrycode;
end$$
delimiter ;

call countrylangs();

select * from countrylanguage;
customer

drop procedure insLangToCountry;
delimiter $$
create procedure `insLangToCountry` ( IN countryname varchar(30), IN languagename varchar(30))
begin
	declare countrycode varchar(30);
    select country.code into countrycode from country where country.name=countryname limit 1;
	if (select count(*) from countrylanguage where countrylanguage.CountryCode = countrycode) = 0 then
		insert into countrylanguage (CountryCode,Language,Isofficial, Percentage)values(countrycode,languagename,"F", 0.0);
	end if;
end$$

delimiter ;


call insLangToCountry("India", "kilkili");


select * from countrylanguage where countrycode = "Ind";


