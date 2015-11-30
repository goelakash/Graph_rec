MATCH (u1:User {userID: ?1})-[r1:RATED]->(m1:Movie)
with u1,r1,m1
match (mv:Movie {movieID:m1.movieID}) 
RETURN mv.movieID AS `Movie ID`,mv.name as `Movie Name`, r1.rating AS `Rating`
ORDER BY mv.movieID ASC;
