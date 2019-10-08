FROM library/cassandra
COPY "./db_scripts/cassandra/otk_db_schema_cassandra.cql" "/schema.cql"
COPY "./db_scripts/cassandra/otk_db_keyspace.cql" "/keyspace.cql"
CMD /bin/bash -c "sleep 60 && echo loading cassandra keyspace/schema && cqlsh cassandra-otk-svc -f /keyspace.cql && cqlsh cassandra-otk-svc -k otk -f /schema.cql"
#Test