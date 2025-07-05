Use worldcup_db;

Select *
From 2022_world_cup_groups;

Select *
From 2022_world_cup_matches;

Select *
From 2022_world_cup_squads;

Select *
From international_matches;

Select *
From world_cup_matches;

Select *
From world_cups;

-- WorldCups Table
-- Countries that hosted worldcups most often
Select host_country, Count(*) as Times_Hosted
From world_cups
Group by Host_country
Order by Times_Hosted Desc;

-- Average goals per match in each worldcup season
Select Year, Host_Country, Round(goals_scored/matches_played, 2) As Avg_Goals_Per_Match
From world_cups;

-- Most Successful countries
-- Most Worldcup wins
SELECT Winner, COUNT(*) AS times_won
FROM world_cups
GROUP BY Winner
ORDER BY times_won DESC;

-- Most Runner-ups
SELECT Runners_up, COUNT(*) AS times
FROM world_cups
GROUP BY Runners_up
ORDER BY times DESC;

-- Most Third Places
SELECT Third, COUNT(*) AS Times
FROM world_cups
GROUP BY Third
ORDER BY Times DESC;

-- Most Fourth
SELECT Fourth, COUNT(*) AS times
FROM world_cups
GROUP BY Fourth
ORDER BY Times DESC;

SELECT Country, COUNT(*) AS top_4_appearances
FROM (
    SELECT Winner AS Country FROM world_cups
    UNION ALL
    SELECT Runners_Up FROM world_cups
    UNION ALL
    SELECT Third FROM world_cups
    UNION ALL
    SELECT Fourth FROM world_cups
) AS all_positions
GROUP BY Country
ORDER BY top_4_appearances DESC;

-- WorldCup 2022 Groups Table
-- Strongest group based on Ranking
Select `Group`, avg(Fifa_Ranking) as Avg_Ranking
From 2022_world_cup_groups
Group by `Group`
Order by Avg_Ranking;