Select *
From international_matches;

-- Average goals throughout
Select Tournament, AVG(Home_Goals + Away_goals) AS Average_Goals
From international_matches
Group by Tournament
Order by Average_Goals Desc;

-- Average Goals in World Cup Qualification matches and friendlies.
Select Tournament, AVG(Home_Goals + Away_goals) AS Average_Goals
From international_matches
Where Tournament = 'FIFA World Cup Qualification';

Select Tournament, AVG(Home_Goals + Away_goals) AS Average_Goals
From international_matches
Where Tournament = 'Friendly';

-- Comparison in Avg Goals between World Cup Qualification matches and friendlies.
Select Tournament, AVG(Home_Goals + Away_goals) AS Average_Goals
From international_matches
Where Tournament = 'Friendly';

SELECT 'FIFA World Cup Qualification' AS match_type, ROUND(AVG(`Home_Goals` + `Away_Goals`), 2) AS avg_goals
FROM world_cup_matches

UNION ALL

SELECT 'Friendly' AS match_type, ROUND(AVG(home_goals + away_goals), 2) AS avg_goals
FROM international_matches
WHERE Tournament = 'Friendly';
