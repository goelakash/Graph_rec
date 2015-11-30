match (m:Movie)<-[r:RATED]-(u:User)
with m,collect(r.rating) as ratings
with m,reduce(s=0,i in ratings | s+i)*1.0/size(ratings) as avg
set m.avg_rating = round(avg*10)*1.0/10 
return m
order by m.movieID
