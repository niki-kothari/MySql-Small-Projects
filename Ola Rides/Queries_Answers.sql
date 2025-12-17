use ola_niki;

/*
QUESTIONS
1. Total trips
2. Total Drivers
3. Total Earnings
4. Total completed trips
5. Total searches
6. Total searches which got estimate
7. Total searches for quotes
8. Total searches which got quotes
9. Total driver cancelled
10. Total OTP entered
11. Total end ride
12. Average distance per trip
13. Average fare per trip
14. Distance travelled
15. Which 2 locations had the most trips
16. Top 5 earnings drivers
17. Which duration had most trips
18. Search to estimate rates
19. Which area got the highest fares, cancellations?
*/
/* 1 */ select count(distinct tripid) from trips;
/* 2 */ select count( distinct id) from assembly; -- select distinct count(driverid) from trips;
/* 3 */ select sum(fare) from trips;
/* 4 */ select count(tripid) from trip_details where end_ride = 1;
/* 5 */ select count(searches) from trip_details;
/* 6 */ select count(searches_got_estimate) from trip_details;
/* 7 */ select count(searches_for_quotes) from trip_details;
/* 8 */ select count(searches_got_quotes) from trip_details;
/* 9 */ select count(*) - sum(driver_not_cancelled) from trip_details;
/* 10 */ select sum(otp_entered) from trip_details;
/* 11 */ select sum(end_ride) from trip_details;
/* 12 */ select avg(distance) from trips;
/* 13 */ select avg(fare) from trips;
/* 14 */ select sum(distance) from trips;
/* 15 */ select loc_from, loc_to, count(distinct tripid) from trips group by loc_from, loc_to;
/* 16 */ select driverid, sum(fare) total_fare from trips group by driverid order by total_fare desc;
/* 17 */ select duration, count(tripid) as total_trips from trips group by duration order by total_trips desc;
/* 18 */ select sum(searches_got_estimate) * 100/ sum(searches) from trip_details;
/* 19.1 */ select loc_from, sum(fare) loc_fare from trips group by loc_from order by loc_fare;
/* 19.2 */ select count(distinct tripid) - sum(driver_not_cancelled) from trip_details;
