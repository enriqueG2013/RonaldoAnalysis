--ENRIQUE GONZALEZ - RONALDO ANALYSIS PROJECT

--1) CLEAN DATA

--Remove 'Â' from player Names
select playerName from [Portfolio Project].dbo.homePlayers
where playerName like '%Ronaldo';


select trim('Â' from playerName) from [Portfolio Project].dbo.homePlayers
where playerName like '%Ronaldo';

update [Portfolio Project].dbo.homePlayers
set playerName = trim('Â ' from playerName);

--Remove time from Match Date

select matchDate, convert(date, matchDate) from [Portfolio Project].dbo.homePlayers;

Alter Table [Portfolio Project].dbo.homePlayers
add matchDateR1 date;

update [Portfolio Project].dbo.homePlayers
set matchDateR1 = convert(date, matchDate);

--Clean formation column

select homeTeamTacticalSchema from [Portfolio Project].dbo.homePlayers
where playerName like '%Ronaldo';

select trim('()â—†' from homeTeamTacticalSchema) from [Portfolio Project].dbo.homePlayers
where playerName like '%Ronaldo';

update [Portfolio Project].dbo.homePlayers
set homeTeamTacticalSchema = trim('()â—†' from homeTeamTacticalSchema;


--2) PREPARE DATA FOR ANALYSIS

--Ronaldo's Home Tactical Schema Goals
select homeTeamTacticalSchema, sum(goals) as RonaldoGoals from [Portfolio Project].dbo.homePlayers
where playerName like '%Ronaldo'
group by homeTeamTacticalSchema;

--Ronaldo's goals vs Away Team'e Tactical Schema
select awayTeamTacticalSchema, sum(goals) as RonaldoGoals from [Portfolio Project].dbo.homePlayers
where playerName like '%Ronaldo'
group by awayTeamTacticalSchema;

--Ronaldo's Home Tactical Schema Goals vs Away Team's Tactical Schema
select homeTeamTacticalSchema, awayTeamTacticalSchema, sum(goals) as 'Ronaldo Goals' from [Portfolio Project].dbo.homePlayers
where playerName like '%Ronaldo'
group by homeTeamTacticalSchema, awayTeamTacticalSchema;

--Ronaldo's Home Tactical Schema Goal Percentage
select homeTeamTacticalSchema, (sum(goals) / 42)*100 as PercentGoals   from [Portfolio Project].dbo.homePlayers
where playerName like '%Ronaldo'
group by homeTeamTacticalSchema;