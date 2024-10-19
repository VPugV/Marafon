select distinct u."FirstName", u."LastName", rnr."CountryCode"
from "User" u
inner join "Runner" rnr on u."Email" = rnr."Email"
inner join "Role" r on u."RoleId" = r."RoleId"
inner join "Registration" reg on rnr."RunnerId" = reg."RunnerId"
inner join "RegistrationEvent" re on reg."RegistrationId" = re."RegistrationId"
inner join "Event" ev on re."EventId" = ev."EventId"
where r."RoleId" = 'R' and ev."MarathonId" = 5;