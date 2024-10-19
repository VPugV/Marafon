select u."Password", "DateOfBirth", DATE_PART('YEAR', AGE(CURRENT_DATE, r."DateOfBirth")) as age
from "User" u
inner join "Runner" r on r."Email" = u."Email"
where u."Password" like '______%' and u."Password" ~ '[a-z]' and u."Password" ~ '[1-9]'
and u."Password" ~ '[!@#$%^]' and DATE_PART('YEAR', AGE(CURRENT_DATE, r."DateOfBirth")) > 10;