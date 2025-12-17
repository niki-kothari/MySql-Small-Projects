create schema goodreads;
use goodreads;

/*
QUESTIONS:::::::::

1. Best rated books
2. Bifergate books according to the language code
3. arrange books by publications and author
4. count the number of books written by each author
5. -- find the average reviews written for all books of each author
6. arrange the books according to the year in which they were published
7. name the oldest book
8. show the books with more than 4 star rating 
9. -- find the average number of books by each author
10 List the books published in 2010
11 List the books published in January, 2010
12 list all the books of harry potter
*/

-- ANSWERS:::::::::

/* 1 */  select distinct title, authors, average_rating from books order by average_rating desc;
/* 2 */ select language_code, title, count(distinct title) from books group by language_code, title order by language_code;
/* 2 */ select language_code, title from books order by language_code, title;
/* 3 */ select publisher, authors, title from books order by publisher, authors;
/* 4 */ select authors, count(title) as 'Total books' from books group by authors order by authors;
/* 5 */ select authors, avg(text_reviews_count) as 'Average' from books group by authors order by Average desc;
/* 6 */ select title, year(publication_date) from books order by publication_date;
/* 7 */ select title, year(publication_date) from books order by publication_date limit 1;
/* 8 */ select title, average_rating from books where average_rating >= 4 order by average_rating desc;
/* 10 */ select title, publication_date from books where year(publication_date) = 1987;
/* 11 */ select title, publication_date from books where year(publication_date) = 1987 and monthname(publication_date) = 'July';
/* 12 */ select title from books where title like '%harry%potter%';
