gosu postgres postgres --single template1 -E <<-EOSQL
	CREATE EXTENSION unaccent;
	DROP DATABASE postgres;
	CREATE DATABASE postgres TEMPLATE template1;
EOSQL