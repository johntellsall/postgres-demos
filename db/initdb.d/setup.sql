create table beer(value varchar);

CREATE EXTENSION redis_fdw;
CREATE SERVER redis_server
    FOREIGN DATA WRAPPER redis_fdw
    OPTIONS (address 'beer-redis', port '6379');
CREATE USER MAPPING FOR PUBLIC SERVER redis_server;

CREATE FOREIGN TABLE redis_db0 (key text, val text)
    SERVER redis_server
    OPTIONS (database '0');
CREATE FOREIGN TABLE myredishash (key text, val text[])
    SERVER redis_server
    OPTIONS (database '0', tabletype 'hash', tablekeyprefix 'mytable:'); 

INSERT INTO myredishash (key, val) VALUES (
    'mytable:r1','{prop1,val1,prop2,val2}');

-- psql -h localhost -Upostgres -c 'select * from myredishash'
-- redis-cli -p 6380 hgetall mytable:r1
