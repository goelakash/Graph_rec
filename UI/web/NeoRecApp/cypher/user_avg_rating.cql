match (u:User {userID: ?1 })-[r:RATED]->(m:Movie)
with count(r) as n, SUM(r.rating) as sm,u
set u.avg_rating = round( (sm/(n*1.0))*100)/100
return u,sm,n, u.avg_rating  order by u.userID ASC

