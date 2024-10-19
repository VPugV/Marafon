select u."FirstName", u."LastName",  DATE_PART('YEAR', AGE(CURRENT_DATE, rnr."DateOfBirth")) as age, g."Gender", m."MarathonName", ev."EventName",  c."CountryName", 
TO_CHAR((re."RaceTime" || ' seconds')::interval, 'HH24:MI:SS') as race_time,
ROW_NUMBER() OVER (PARTITION BY ev."EventName" ORDER BY re."RaceTime" ASC) AS position
FROM "Event" ev
INNER JOIN "Marathon" m ON ev."EventId" = ev."EventId"
inner join "Country" c on m."CountryCode" = c."CountryCode"
INNER JOIN "RegistrationEvent" re ON ev."EventId" = re."EventId"
inner join "Registration" reg on re."RegistrationId" = reg."RegistrationId" 
inner join "Runner" rnr on reg."RunnerId" = rnr."RunnerId"
inner join "User" u on u."Email" = rnr."Email"
inner join "Gender" g on rnr."GenderId" =  g."GenderId" 
where re."RaceTime" != 0
ORDER BY ev."EventName" asc, g."Gender" asc, race_time asc;

select ev."EventName", count(re."RaceTime") as vseg_runners, to_char( (round(avg(re."RaceTime"), 0) ||'seconds')::interval, 'HH24:MI:SS' ) as sred_time
from "Event" ev
inner join "RegistrationEvent" re on ev."EventId" = re."EventId"
where re."RaceTime" != 0
group by ev."EventName"
order by ev."EventName"