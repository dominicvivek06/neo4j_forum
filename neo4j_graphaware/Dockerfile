FROM neo4j
ENV NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
    NEO4J_HOME="/var/lib/neo4j"

COPY ./graphaware.conf "${NEO4J_HOME}"/conf
ADD https://neo4j-plugins-public.s3.eu-west-1.amazonaws.com/graphaware-server-community-4.2.0.58.jar "${NEO4J_HOME}"/plugins
ADD https://neo4j-plugins-public.s3.eu-west-1.amazonaws.com/graphaware-uuid-4.1.4.58.19.jar "${NEO4J_HOME}"/plugins