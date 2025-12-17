create schema zomato_niki;
use zomato_niki; 

CREATE TABLE goldusers_signup(userid integer,gold_signup_date date); 
INSERT INTO goldusers_signup(userid,gold_signup_date) 
 VALUES (1,'2017-09-22'),
(3,'2017-04-21');

CREATE TABLE users(userid integer,signup_date date); 
INSERT INTO users(userid,signup_date) 
 VALUES (1,'2014-09-02'),
(2,'2015-01-15'),
(3,'2014-04-11');

CREATE TABLE sales(userid integer,created_date date,product_id integer); 
INSERT INTO sales (userid, created_date, product_id)
VALUES 
(1, '2017-04-19', 2),
(3, '2019-12-18', 1),
(2, '2020-07-20', 3),
(1, '2019-10-23', 2),
(1, '2018-03-19', 3),
(3, '2016-12-20', 2),
(1, '2016-11-09', 1),
(1, '2016-05-20', 3),
(2, '2017-09-24', 1),
(1, '2017-03-11', 2),
(1, '2016-03-11', 1),
(3, '2016-11-10', 1),
(3, '2017-12-07', 2),
(3, '2016-12-15', 2),
(2, '2017-11-08', 2),
(2, '2018-09-10', 3);

CREATE TABLE product(product_id integer,product_name text,price integer); 
INSERT INTO product(product_id,product_name,price) 
 VALUES
(1,'p1',980),
(2,'p2',870),
(3,'p3',330);

-- ## Q1) What is the total amount each customer spent on zomato ?
select userid, sum(price) from sales inner join product on sales.product_id = product.product_id group by userid;

-- ## Q2) How many days has each customer visited zomato ?
select userid, count(distinct created_date) from sales group by userid;

-- ## Q3) What is the most purchased item on the menu & how many times it was purchased by all customers ?
select userid, count(product_id) as Number_of_product_purchased from sales where product_id = (select product_id from sales group by product_id order by count(product_id) desc limit 1) group by userid;

-- ## Q4) Which item was first purchased by customer after they become a member ?
select sales.userid, created_date, product_id, gold_signup_date from sales inner join goldusers_signup on sales.userid = goldusers_signup.userid;
