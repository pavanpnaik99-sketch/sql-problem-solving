select
    p.firstName,
    p.lastname,
    a.city,
    a.state
from
    person p
    left join Address a on p.personid = a.personid