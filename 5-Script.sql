select distinct u."FirstName", u."LastName", rnr."Email", rgs."RegistrationStatus", ev."EventTypeId"
from "User" u
inner join "Role" r on u."RoleId" = r."RoleId"
inner join "Runner" rnr on u."Email" = rnr."Email"
inner join "Registration" reg on rnr."RunnerId" = reg."RunnerId"
inner join "RegistrationEvent" re on reg."RegistrationId" = re."RegistrationId"
inner join "Event" ev on re."EventId" = ev."EventId"
inner join "RegistrationStatus" rgs on reg."RegistrationStatusId" = rgs."RegistrationStatusId"
where rgs."RegistrationStatusId" = 1
order by ev."EventTypeId" asc;

select count(*) from (select distinct u."FirstName", u."LastName", rnr."Email", rgs."RegistrationStatus"
from "User" u
inner join "Role" r on u."RoleId" = r."RoleId"
inner join "Runner" rnr on u."Email" = rnr."Email"
inner join "Registration" reg on rnr."RunnerId" = reg."RunnerId"
inner join "RegistrationEvent" re on reg."RegistrationId" = re."RegistrationId"
inner join "Event" ev on re."EventId" = ev."EventId"
inner join "RegistrationStatus" rgs on reg."RegistrationStatusId" = rgs."RegistrationStatusId"
where ev."EventTypeId" = 'FM' and rgs."RegistrationStatusId" = 1) as asd