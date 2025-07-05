Select *
From 2022_world_cup_squads;

-- WorldCup 2022 Squad Table
-- Average age of every team
Select team, Avg(Age) as Avg_Age
From 2022_world_cup_squads
Group by team
Order by Avg_Age;

-- Players with the highest goals for Country
SELECT Player, team, Goals, Club
FROM 2022_world_cup_squads
ORDER BY Goals DESC
LIMIT 10;

-- Players with the Most World Cup Goals
SELECT Player, team, WC_Goals, Club
FROM 2022_world_cup_squads
ORDER BY WC_Goals DESC
LIMIT 10;

-- Average WC goals per position
Select Position, Avg(WC_Goals) as Avg_WC_Goals
From 2022_world_cup_squads
Group by Position
Order by Avg_WC_Goals Desc;

-- Club and League with the most WorldCup Players
Select League, Count(League) As League_name
From 2022_world_cup_squads
Group by League
Order by League_name Desc;

Select Club, Count(Club) As Club_name
From 2022_world_cup_squads
Group by Club
Order by Club_name Desc;