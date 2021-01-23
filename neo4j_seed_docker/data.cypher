//skip null values
LOAD CSV WITH HEADERS FROM 'file:///countries.csv' AS row
WITH row WHERE row.id IS NOT NULL
MERGE (c:Country {id:row.id,countryName: row.name});