Select *
From world_cup_matches;

-- WorldCup Matches Table
-- Average goals per match by stage
SELECT 
  Stage,
  AVG(Home_Goals + Away_Goals) AS avg_goals_per_match,
  COUNT(*) AS total_matches
FROM world_cup_matches
GROUP BY Stage
ORDER BY avg_goals_per_match DESC;

-- Most goal-rich matches.
Select Year, Stage, Home_Team, Away_team, Home_Goals, Away_Goals, (Home_Goals + Away_Goals) As Total_goals
From world_cup_matches
Order by Total_goals Desc
Limit 10;

-- Frequency of different win conditions (penalties, extra time) / need to prune table
Select Win_Conditions, Count(*)
From world_cup_matches
group by Win_Conditions;

-- Average goals per match by stage
SELECT 
  Stage,
  AVG(Home_Goals + Away_Goals) AS avg_goals_per_match,
  COUNT(*) AS total_matches
FROM world_cup_matches
GROUP BY Stage
ORDER BY avg_goals_per_match DESC;

-- Most goal-rich matches.
Select Year, Stage, Home_Team, Away_team, Home_Goals, Away_Goals, (Home_Goals + Away_Goals) As Total_goals
From world_cup_matches
Order by Total_goals Desc
Limit 10;

-- Frequency of different win conditions (penalties, extra time) / need to prune table
Select Win_Conditions, Count(*)
From world_cup_matches
group by Win_Conditions;

-- Time-Based Trends
-- Scoring Trend Over Decades
SELECT 
  FLOOR(Year / 10) * 10 AS decade,
  ROUND(AVG(Home_Goals + Away_Goals), 2) AS avg_goals_per_match,
  COUNT(*) AS match_count
FROM world_cup_matches
GROUP BY decade
ORDER BY decade;

-- Team performance over the years
SELECT 
  team,
  COUNT(*) AS matches_played,
  SUM(CASE WHEN result = 'Win' THEN 1 ELSE 0 END) AS wins,
  ROUND(SUM(CASE WHEN result = 'Win' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS win_percentage,
  SUM(goals_scored) AS total_goals,
  ROUND(AVG(goals_scored), 2) AS avg_goals_per_match
FROM (
  -- Transform into one row per team per match
  SELECT 
    Year,
    `Home_Team` AS team,
    `Home_Goals` AS goals_scored,
    `Away_Goals` AS goals_conceded,
    CASE 
      WHEN `Home_Goals` > `Away_Goals` THEN 'Win'
      WHEN `Home_Goals` = `Away_Goals` THEN 'Draw'
      ELSE 'Loss'
    END AS result
  FROM world_cup_matches

  UNION ALL

  SELECT 
    Year,
    `Away_Team` AS team,
    `Away_Goals` AS goals_scored,
    `Home_Goals` AS goals_conceded,
    CASE 
      WHEN `Away_Goals` > `Home_Goals` THEN 'Win'
      WHEN `Away_Goals` = `Home_Goals` THEN 'Draw'
      ELSE 'Loss'
    END AS result
  FROM world_cup_matches
) AS team_matches
GROUP BY team
ORDER BY win_percentage DESC, matches_played DESC;