MATCH (b:User)-[r:RATED]->(m:Movie), (b)-[s:PEARSON_SIM]-(a:User {userID:?1})
WHERE NOT((a)-[:RATED]->(m))
WITH m, s.similarity AS similarity, r.rating AS rating
ORDER BY m.name, similarity DESC
WITH m, COLLECT(rating)[0..10] as ratings
where size(ratings)>5 
WITH m, REDUCE(s = 0, i IN ratings | s + i)*1.0 / SIZE(ratings) AS reco
match (mv:Movie {movieID:m.movieID}) 
return mv.name as `Movie Name`,round(reco*10)/10 as `Predicted Rating`
order by reco DESC,mv.name DESC

