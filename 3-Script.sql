select m."MarathonName", ev."EventName", to_char( (re."RaceTime" ||'seconds')::interval, 'HH24:MI:SS' )
as race_time, ROW_NUMBER() OVER(PARTITION BY ev."EventName" ORDER BY re."RaceTime" asc) AS position
from "Event" ev
inner join "Marathon" m on ev."EventId" = ev."EventId"
inner join "RegistrationEvent" re on ev."EventId" = re."EventId"
where "RaceTime" is not null and "RaceTime"!=0
order by ev."EventName" asc, race_time asc