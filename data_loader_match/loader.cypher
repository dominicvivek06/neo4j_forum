match (n) detach delete(n);


:auto
USING PERIODIC COMMIT 10 LOAD CSV WITH HEADERS FROM "file:///emp.csv" AS line FIELDTERMINATOR ','
MERGE (e:employee{emp_id:line.emp_id,name:line.emp_name})
return e;

:auto
USING PERIODIC COMMIT 10 LOAD CSV WITH HEADERS FROM "file:///dept.csv" AS line FIELDTERMINATOR ','
MERGE (d:department{dept_name:line.dept_name})
WITH d,line
MATCH (e:employee {emp_id:line.emp_id})
MERGE (d)-[r:has_route]->(e)
return d,r,e;

