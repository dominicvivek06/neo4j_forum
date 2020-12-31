MATCH (n) 
UNWIND keys(n) as property 
RETURN labels(n) as node,id(n) as node_id , property, n[property] as value