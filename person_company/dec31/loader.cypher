:auto
USING PERIODIC COMMIT 100 load csv with headers from 'file:///data.csv' as row  with row where row.col1 is not null merge (c1:Col1 {id: row.col1}) 
merge (c2:Col2 {id: row.col2}) 
merge (c1)-[r:HAS]->(c2)
with r,c1,c2,row
CALL apoc.create.setRelProperty(r, row.col4, row.col5)
YIELD rel
return c1,r,c2;