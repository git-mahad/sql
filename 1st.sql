Select 
	p.firstName, 
	p.lastName, 
	a.city, a,state
from person as p
left join address as a on
p.personid = a.personid