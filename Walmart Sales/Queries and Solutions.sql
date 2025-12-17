/* GENERIC QUESTIONS */

-- 1) How many unique cities does the data have?
select distinct(city) from walmartsalesdata;

-- 2) In which city is each branch?
select distinct branch, city from walmartsalesdata;

/* ### Product
1. How many unique product lines does the data have?<br>
2. What is the most common payment method?<br>
3. What is the most selling product line?<br>
4. What is the total revenue by month?<br>
5. What month had the largest COGS?<br>
6. What product line had the largest revenue?<br>
7. What is the city with the largest revenue?<br>
8. What product line had the largest VAT?<br>
9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales<br>
10. Which branch sold more products than average product sold?<br>
11.What is the most common product line by gender?<br>
12. What is the average rating of each product line?<br>
*/

/* 1 */ select distinct product_line from walmartsalesdata;
/* 2 */ select payment, count(payment) from walmartsalesdata group by payment order by count(payment) desc limit 1;
/* 3 */ select product_line, count(product_line) from walmartsalesdata group by product_line;
/* 4 */ select month_name, sum(total) from walmartsalesdata group by month_name;
/* 5 */ select month_name, max(cogs) from walmartsalesdata group by month_name;
/* 6 */ select product_line, max(total) from walmartsalesdata group by product_line;
/* 7 */ select city, count(total), sum(total) from walmartsalesdata group by city order by count(total) desc limit 1;
/* 8 */ select product_line, max(Tax_5) from walmartsalesdata group by product_line;
/* 9 */ 
/* 10 */ select branch, sum(quantity) as total_qty from walmartsalesdata group by branch having sum(quantity) > (select avg(quantity) from walmartsalesdata);
/* 11 */ select gender, product_line, count(gender) as total_gen from walmartsalesdata group by gender, product_line order by total_gen desc;
/* 12 */ select product_line, avg(rating) from walmartsalesdata group by product_line;

/*
## Sales
1. Number of sales made in each time of the day per weekday<br>
2. Which of the customer types brings the most revenue?<br>
3. Which city has the largest tax percent/ VAT (Value Added Tax)?<br>
4. Which customer type pays the most in VAT?<br>
*/

/* 1 */ select day_name, time_of_day, count(*) as deliveries from walmartsalesdata group by day_name, time_of_day order by deliveries desc;
/* 2 */ select customer_type, sum(revenue) from walmartsalesdata group by customer_type;
/* 3 */ select city, avg(tax_5) from walmartsalesdata group by city order by avg(tax_5) desc;
/* 4 */ select customer_type, sum(tax_5) as 'Tax Paid' from walmartsalesdata group by customer_type order by 'Tax Paid';

/*
### Customer
1. How many unique customer types does the data have?<br>
2. How many unique payment methods does the data have?<br>
3. What is the most common customer type?<br>
4. Which customer type buys the most?<br>
5. What is the gender of most of the customers?<br>
6. What is the gender distribution per branch?<br>
7. Which time of the day do customers give most ratings?<br>
8. Which time of the day do customers give most ratings per branch?<br>
9. Which day fo the week has the best avg ratings?<br>
10. Which day of the week has the best average ratings per branch?<br>
*/

/* 1 */ select count(distinct customer_type) from walmartsalesdata;
/* 2 */ select count(distinct payment) from walmartsalesdata;
/* 3 */ select customer_type, count(*) from walmartsalesdata group by customer_type;
/* 4 */ select customer_type, count(*) from walmartsalesdata group by customer_type;
/* 5 */ select gender, count(*) from walmartsalesdata group by gender;
/* 6 */ select branch, gender, count(*) from walmartsalesdata group by branch, gender order by branch;
/* 7 */ select time_of_day, count(rating) as rating from walmartsalesdata group by time_of_day order by rating desc;
/* 8 */ select branch, time_of_day, count(rating) as rating from walmartsalesdata group by branch, time_of_day order by branch, rating desc;
/* 9 */ select day_name , avg(rating) as avg_rating from walmartsalesdata group by day_name order by avg_rating;
/* 10 */ select branch, day_name , avg(rating) as avg_rating from walmartsalesdata group by branch, day_name order by branch, avg_rating desc;
