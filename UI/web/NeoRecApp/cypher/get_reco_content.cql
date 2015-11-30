match (u:User{userID:1})-[r:RATED]->(m:Movie)-[:GENRE]-(g)
with u,collect(m) as mlist,g
with u,g,size(mlist) as msize
with u,g,msize order by msize desc
with u,collect(g)[0..5] as glist
with u,glist
// got favorite genres in glist
match (:User)-[r:RATED]->(m:Movie)-[:GENRE]-(g) 
where not ((u)-[:RATED]->(m))
with g,m,glist,collect(r) as rlist
where g in glist //and size(rlist)>5
return  distinct m order by m.avg_rating DESC
