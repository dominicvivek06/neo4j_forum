FROM neo4j

ENV NEO4J_HOME="/var/lib/neo4j" \
    NEO4J_PASSWD=neo4j_seed
    
COPY countries.csv ${NEO4J_HOME}/import/
COPY data_loader.cypher ${NEO4J_HOME}/import/

# set initial-password to start loading the data
# sleep for 10 secs for neo4j to start without any overlapping

CMD bin/neo4j-admin set-initial-password ${NEO4J_PASSWD} && \
    bin/neo4j start && sleep 10 && \
    if [ -f "${NEO4J_HOME}/import/data_loader.cypher" ]; then  \
        cat ${NEO4J_HOME}/import/data_loader.cypher | NEO4J_USERNAME=neo4j NEO4J_PASSWORD=${NEO4J_PASSWD} bin/cypher-shell --fail-fast && rm ${NEO4J_HOME}/import/*; \
    fi && /bin/bash
