create schema fasos_niki;
use fasos_niki;

CREATE TABLE driver(driver_id integer,reg_date date); 
INSERT INTO driver(driver_id,reg_date) VALUES (1,'2021-01-01'), (2,'2021-01-03'), (3,'2021-01-08'), (4,'2021-01-15');

CREATE TABLE ingredients(ingredients_id integer,ingredients_name varchar(60)); 
INSERT INTO ingredients(ingredients_id ,ingredients_name) VALUES (1,'BBQ Chicken'), (2,'Chilli Sauce'), (3,'Chicken'), (4,'Cheese'), (5,'Kebab'), (6,'Mushrooms'), (7,'Onions'), (8,'Egg'), (9,'Peppers'), (10,'schezwan sauce'), (11,'Tomatoes'), (12,'Tomato Sauce');

CREATE TABLE rolls(roll_id integer,roll_name varchar(30)); 
INSERT INTO rolls(roll_id ,roll_name) VALUES (1	,'Non Veg Roll'), (2	,'Veg Roll');

CREATE TABLE rolls_recipes(roll_id integer,ingredients varchar(24));
INSERT INTO rolls_recipes(roll_id ,ingredients) VALUES (1,'1,2,3,4,5,6,8,10'), (2,'4,6,7,9,11,12');

CREATE TABLE driver_order(order_id integer,driver_id integer,pickup_time datetime,distance VARCHAR(7),duration VARCHAR(10),cancellation VARCHAR(23));
INSERT INTO driver_order(order_id, driver_id, pickup_time, distance, duration, cancellation) 
VALUES
(1, 1, '2021-01-01 18:15:34', '20km', '32 minutes', ''),
(2, 1, '2021-01-01 19:10:54', '20km', '27 minutes', ''),
(3, 1, '2021-01-03 00:12:37', '13.4km', '20 mins', 'NaN'),
(4, 2, '2021-01-04 13:53:03', '23.4', '40', 'NaN'),
(5, 3, '2021-01-08 21:10:57', '10', '15', 'NaN'),
(6, 3, NULL, NULL, NULL, 'Cancellation'),
(7, 2, '2020-01-08 21:30:45', '25km', '25mins', NULL),
(8, 2, '2020-01-10 00:15:02', '23.4 km', '15 minute', NULL),
(9, 2, NULL, NULL, NULL, 'Customer Cancellation'),
(10, 1, '2020-01-11 18:50:20', '10km', '10minutes', NULL);

CREATE TABLE customer_orders(order_id integer,customer_id integer,roll_id integer,not_include_items VARCHAR(4),extra_items_included VARCHAR(4),order_date datetime);
INSERT INTO customer_orders(order_id, customer_id, roll_id, not_include_items, extra_items_included, order_date)
VALUES
(1, 101, 1, '', '', '2021-01-01 18:05:02'),
(2, 101, 1, '', '', '2021-01-01 19:00:52'),
(3, 102, 1, '', '', '2021-01-02 23:51:23'),
(3, 102, 2, '', 'NaN', '2021-01-02 23:51:23'),
(4, 103, 1, '4', '', '2021-01-04 13:23:46'),
(4, 103, 1, '4', '', '2021-01-04 13:23:46'),
(4, 103, 2, '4', '', '2021-01-04 13:23:46'),
(5, 104, 1, NULL, '1', '2021-01-08 21:00:29'),
(6, 101, 2, NULL, NULL, '2021-01-08 21:03:13'),
(7, 105, 2, NULL, '1', '2021-01-08 21:20:29'),
(8, 102, 1, NULL, NULL, '2021-01-09 23:54:33'),
(9, 103, 1, '4', '1,5', '2021-01-10 11:22:59'),
(10, 104, 1, NULL, NULL, '2021-01-11 18:34:49'),
(10, 104, 1, '2,6', '1,4', '2021-01-11 18:34:49');

/* ROLL METRICS */

-- ## 1. How Many rolls were ordered ?
select count(roll_id) from customer_orders;

-- ## 2. How many unique customer orders were made ?
select count(distinct customer_id) from customer_orders;

-- ## 3. How Many Succesful orders were delivered by each driver ?
select driver_id, count(distinct order_id) from driver_order where cancellation not in ('Cancellation', 'Customer Cancellation') group by driver_id;

-- ## 4. How Many veg & non veg rolls were ordered by each customer ?
select a.*, b.roll_name from (select customer_id, roll_id, count(roll_id) from customer_orders group by customer_id, roll_id) a inner join rolls b on a.roll_id = b.roll_id;

-- ## 5. How many of each type of roll was delivered ?
-- select a.*, b.roll_name from (select roll_id, count(roll_id) from customer_orders group by roll_id) a inner join rolls b on a.roll_id = b.roll_id;
select roll_id, count(roll_id) from customer_orders where order_id in (select order_id from (SELECT *, CASE WHEN cancellation IN ('Cancellation','Customer Cancellation') THEN 'c' ELSE 'nc' END AS order_cancel_details FROM driver_order) as a where order_cancel_details = 'nc') group by roll_id;

-- ## 6. What was the maximum number of rolls delivered in a single order ?
select order_id, count(roll_id) from (select * from customer_orders where order_id in ( SELECT order_id FROM (SELECT *, CASE WHEN cancellation IN ('Cancellation','Customer Cancellation') THEN 'c' ELSE 'nc' END AS order_cancel_details FROM driver_order)as a where order_cancel_details='nc'))b group by order_id;

-- ## 7. For each customer, how many delivered rolls had at least 1 change and how many had no changes ?
with temp_customer_orders (order_id, customer_id, new_not_include, new_extra_item) as 
(select order_id, customer_id,
case when not_include_items is null or not_include_items = '' or not_include_items = 'NaN' then 0 else not_include_items end as new_not_include,
case when extra_items_included is null or extra_items_included = '' or extra_items_included = 'NaN' then 0 else extra_items_included end as new_extra_item
from customer_orders),

temp_driver_order (order_id, driver_id, pickup_time, distance, duration, new_cancellation) as 
(select order_id, driver_id, pickup_time, distance, duration, 
case when cancellation in ('Cancellation','Customer Cancellation') then 0 else 1 end as new_cancellation 
from driver_order) 

select customer_id, changes_made, count(order_id) from (
select *, case when new_not_include = 0 and new_extra_item = 0 then 'no change' else 'change' end changes_made from temp_customer_orders 
where order_id in(select order_id from temp_driver_order where new_cancellation != 0)) a
group by customer_id, changes_made;

-- ## 8. How many rolls were delivered that had both exculsions & extras ?
with temp_customer_orders (order_id, customer_id, new_not_include, new_extra_item) as 
(select order_id, customer_id,
case when not_include_items is null or not_include_items = '' or not_include_items = 'NaN' then 0 else not_include_items end as new_not_include,
case when extra_items_included is null or extra_items_included = '' or extra_items_included = 'NaN' then 0 else extra_items_included end as new_extra_item
from customer_orders),

temp_driver_order (order_id, driver_id, pickup_time, distance, duration, new_cancellation) as 
(select order_id, driver_id, pickup_time, distance, duration, 
case when cancellation in ('Cancellation','Customer Cancellation') then 0 else 1 end as new_cancellation 
from driver_order) 

select change_made, COUNT(change_made) from
(select *, case when new_not_include != 0 and new_not_include != 0 then 'include exclude item both changed' else 'include or exclude atleast one changed' end change_made from temp_customer_orders
where order_id in (select order_id from temp_driver_order where new_cancellation != 0)) a
group by change_made;

/*
WITH temp_customer_orders (order_id,customer_id,roll_id,not_include_items,extra_items_included,order_date)
as (SELECT order_id,customer_id,roll_id, 
CASE WHEN not_include_items IS null OR not_include_items='' THEN 0 ELSE not_include_items end as new_not_include_items,
CASE WHEN extra_items_included IS null OR extra_items_included=''or extra_items_included='NaN' THEN 0 ELSE extra_items_included end
as new_extra_items_included, order_date FROM customer_orders),

temp_driver_order(order_id,driver_id,pickup_time,distance,duration,new_cancellation) 
as ( SELECT order_id,driver_id,pickup_time,distance,duration,
CASE WHEN cancellation in ('Cancellation','Customer Cancellation') THEN 0 ELSE 1 end 
AS new_cancellation FROM driver_order)

SELECT chg_no_chg,COUNT(chg_no_chg) FROM
(SELECT *, CASE WHEN not_include_items!=0 AND extra_items_included!=0 THEN 'both incl & excl' ELSE 'at least one of them incl or excl' END chg_no_chg FROM temp_customer_orders 
WHERE order_id in (SELECT order_id FROM temp_driver_order WHERE new_cancellation!=0)) a
GROUP BY chg_no_chg;
*/