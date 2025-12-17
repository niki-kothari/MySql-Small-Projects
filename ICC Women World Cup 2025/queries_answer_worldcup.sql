use women_world_cup;

/* ::::::::::: QUESTIONS :::::::::: */

-- 1. what is the highest score and strike rate of the player who won the player of the match award in semi final 2 ?
/* method 1 - sub query */
select player_name, highest_score, strike_rate from top_run_scorers where player_name = 
(select player_of_match from match_results where match_type like 'semi final 2');

/* method 2 - join */
select player_name, highest_score, strike_rate from top_run_scorers as a
inner join match_results as b on a.player_name = b.player_of_match
where match_type = 'Semi Final 2';

-- 2. total how many group stage matches were played by each team.
select team1 as 'Team Name', count(*) as 'Total Group Stage Games' from match_results where match_type = 'group stage' group by team1;

-- 3. what is the highest total scored at the venue where final match was played?
select a.venue, highest_total from venue_statistics as a
inner join match_results as b on a.venue = b.venue
where match_type = 'final';

-- 4. How many days world cup was played/ It took how many days for world cup to finish?
select concat('It took ', datediff(max(date),min(date)), ' days to finish the world cup series.') as 'Number of days' from match_results;

-- 5. How many times India won the toss and decided to bat first?
select count(*) from match_results where toss_winner = 'India' and toss_decision = 'Bat';

-- 6. Who won the most total matches in this world cup?
select winner, count(*) as 'Matches Won' from match_results group by winner order by count(*) desc;

-- 7. which player of the match bowled more than 60 overs?
select player_of_match, overs from match_results
inner join top_wicket_takers
on match_results.player_of_match = top_wicket_takers.player_name
where player_of_match in (
select player_name from top_wicket_takers where overs > 60);

-- 8. which team qualified for the semi-finals and what are their win-percentage?
select a.team, win_percentage, qualification from points_table as a
inner join team_statistics as b on a.team = b.team
where qualification like '%qualified%semi%final%';

-- 9. list the teams who lost all the matches
select team, matches, wins, losses from points_table where matches = losses;

-- 10. list the team whose win_percentage was more than 70
select team, win_percentage from team_statistics where win_percentage >= 70;

-- 11. Find the average of all teams.
select team, truncate((avg_first_innings + avg_second_innings)/2,2) as Average from team_statistics order by Average desc; 

-- 12. Net run rate of all teams.
select team, net_run_rate  from points_table;

-- 13. List the total runs scored by all teams in this tournament.
with temp_match_result as
(select team1, team2,
case when team1_score = 'no result' then 0 else substring_index(replace(team1_score, '(', '/'), '/',1) end as team1_int_score,
case when team2_score = 'no result' then 0 else substring_index(replace(team2_score, '(', '/'), '/',1) end as team2_int_score
from match_results)

SELECT team1, sum(team1_int_score) +
       (SELECT sum(team2_int_score) FROM temp_match_result as b WHERE a.team1 = b.team2)
	as 'Total Runs Scored'
FROM temp_match_result as a group by team1;

-- 14. List the team who have total score of more than 1500 runs in all matches.
with temp_match_result as
(select team1, team2,
case when team1_score = 'no result' then 0 else substring_index(replace(team1_score, '(', '/'), '/',1) end as team1_int_score,
case when team2_score = 'no result' then 0 else substring_index(replace(team2_score, '(', '/'), '/',1) end as team2_int_score
from match_results)

SELECT team1, sum(team1_int_score) +
       (SELECT sum(team2_int_score) FROM temp_match_result as b WHERE a.team1 = b.team2)
	as Total_Runs_Scored
FROM temp_match_result as a group by team1
having Total_Runs_Scored >= 1500
order by Total_Runs_Scored desc;

-- 15 which bowler took the most wickets?
select player_name, team, wickets from top_wicket_takers order by wickets desc limit 1;

-- 16 which bowler took the least wickets?
select player_name, team, wickets from top_wicket_takers order by wickets limit 1;

-- 17 which team losses more than 3 matches?
select team, losses from team_statistics where losses > 3 order by losses;

-- 18 which teams won against India?
select team1, team2, match_type, winner from match_results where (team1 = 'India' or team2 = 'India') and winner != 'India';

-- 19 which teams lost against India?
select team1, team2, match_type, winner from match_results where (team1 = 'India' or team2 = 'India') and winner = 'India';

-- 20 who won player of the tournament award and what was her score/wickets?
select a.player_name, runs, wickets from top_run_scorers as a 
inner join top_wicket_takers as b on a.player_name = b.player_name
where a.player_name = (
select recipient from tournament_awards_records where award_category = 'Player of the tournament');

-- 21 which team lost against India by more than 50 runs?
select team1, team2, winner, substring_index(margin, ' ',1) as Margin from match_results 
where ((team1 = 'India' or team2 = 'India') and winner = 'India') and margin > 50;

-- 22 which teams won by more than 10 runs? 
select team1, team2, winner, substring_index(margin, ' ',1) as Margin from match_results 
where margin > 10 and margin like '%runs%';

-- 23 which teams lost by less than 5 wickets?
select team1, team2, winner, substring_index(margin, ' ',1) as Margin from match_results 
where margin > 7 and margin like '%wickets%';

-- 24 how many games were played in india?
select distinct count(*) as 'Matches Played' from match_results where venue in (
select venue from venue_statistics where country = 'India');

-- 25 how many games were played in sri lanka?
select distinct count(*) as 'Matches Played' from match_results where venue in (
select venue from venue_statistics where country like '%Sri%lanka%');

-- 26. which cricketer won the most player of the match award?
select player_of_match, count(*) as won from match_results group by player_of_match order by won desc;

-- 27. name the team who won most awards in this tournament.
select team, count(*) as awards from tournament_awards_records group by team order by awards desc limit 1;

-- 28. list the teams with net run rate less than 0.
select team, net_run_rate from points_table where net_run_rate < 0;

-- 29. how many wicket takers(bowlers) from top 10 bowlers are from india?
select player_name, b.rank, wickets from (select * from top_wicket_takers limit 10) as b where team = 'India';

-- 30. How many times a team won the toss and decided to bat first at particular venue?
select venue, count(*) from match_results where toss_decision = 'bat' group by venue;
