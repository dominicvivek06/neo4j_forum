:clear

match (n) detach delete (n);

merge (n:Truck{truck_id:1}) ;

merge (l:Location{name:"Austin"});
match (n:Truck{truck_id:1}), (l:Location{name:"Austin"})
merge (n)-[p:Position{date:date('2020-12-20'),current:True}]->(l);

merge (l:Location{name:"Houston"});
match (n:Truck{truck_id:1}), (l:Location{name:"Houston"})
merge (n)-[p:Position{date:date('2020-12-21'),current:True}]->(l);

merge (l:Location{name:"Dallas"});
match (n:Truck{truck_id:1}), (l:Location{name:"Dallas"})
merge (n)-[p:Position{date:date('2020-12-22'),current:True}]->(l);


query**
match (t:Truck{truck_id:1})-[r:Position]->(l:Location)
with max(r.date) as max_date,t,l
match (t)-[r]->(l)
where r.date=max_date
return t.truck_id,r.date,r.current,l.name ;

match (t:Truck{truck_id:1})-[r:Position]->(l:Location)
return t.truck_id,r.date,r.current,l.name


**query 
match (t:Truck{truck_id:1})-[r:Position]->(l:Location)
with max(r.date) as max_date,t,l
match (t)-[r]->(l)
where r.date=max_date
set r.current=False
with t
merge (l:Location{name:"Houston"})
merge (t)-[r:Position{date:date('2020-12-21'),current:True}]->(l)
return distinct t.truck_id,r.date,r.current,l.name ;


match (t:Truck{truck_id:1})-[r:Position]->(l:Location)
return t.truck_id,r.date,r.current,l.name


match (t:Truck{truck_id:1})-[r:Position]->(l:Location)
with max(r.date) as max_date,t,l
match (t)-[r]->(l)
where r.date=max_date
set r.current=False
with t
merge (l:Location{name:"Dallas"})
merge (t)-[r:Position{date:date('2020-12-22'),current:True}]->(l)
return distinct t.truck_id,r.date,r.current,l.name ;




match (t:Truck)-[r:Position]->(l:Location)
with  max(r.date) as max_date
match (t)-[r:Position{date:max_date}]->(l)
return t,r,l