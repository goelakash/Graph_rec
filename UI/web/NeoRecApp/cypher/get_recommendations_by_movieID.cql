MATCH (b:User)-[r:RATED]->(m:Movie), (b)-[s:PEARSON_SIM]-(a:User {userID: ?1 })
WHERE NOT((a)-[:RATED]->(m))
WITH m, s.similarity AS similarity, r.rating AS rating
ORDER BY m.movieID, similarity DESC
WITH m, COLLECT(rating)[0..3] AS ratings
WITH m, REDUCE(s = 0, i IN ratings | s + i)*1.0 / SIZE(ratings) AS reco
ORDER BY TOINT(m.movieID) ASC
RETURN m.movieID AS `Movie ID`, reco AS `Predicted Rating`;
