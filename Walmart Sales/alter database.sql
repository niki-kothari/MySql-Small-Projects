create database walmart_niki;
use walmart_niki;

alter table walmartsalesdata
add column Time_of_day varchar(10);

update walmartsalesdata
set Time_of_day =
(case
	when time between '00:00:00' and '11:59:59' then 'Morning'
    when time between '12:00:00' and '15:59:59' then 'Afternoon'
    when time between '16:00:00' and '20:59:59' then 'Evening'
    else 'Night'
end);

alter table walmartsalesdata
add column day_name varchar(10);

/*
select dayname(date) from walmartsalesdata;
select monthname(date) from walmartsalesdata;
*/

update walmartsalesdata
set day_name = dayname(date);

alter table walmartsalesdata
add column month_name varchar(10);

update walmartsalesdata
set month_name = monthname(date);
