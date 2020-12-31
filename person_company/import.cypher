match (n) detach delete (n);

USING PERIODIC COMMIT 100 load csv with headers from 'file:///p.csv' as row  with row where row.person_id is not null merge (p:Person {id: row.person_id}) set p.name=row.person_name
merge (o:Orgaization {id: row.organization_id}) set o.name=row.organization_name
with split(row.relation, 'O')[0] as per, "O"+split(row.relation, 'O')[1] as company
match (p:Person{id:per}) match(o:Orgaization{id:company}) 
merge (p)-[r:LINKS]->(o)
 return p.id,p.name,r,o.id,o.name;
 
 