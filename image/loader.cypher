match (n) detach delete(n);


:auto
USING PERIODIC COMMIT 10 LOAD CSV WITH HEADERS FROM "file:///book.csv" AS line FIELDTERMINATOR ','
MERGE (b:book{isbn:line.isbn,title:line.title,yop:line.yearofpub,publisher:line.publisher,url:line.imgmedium})
return b;

