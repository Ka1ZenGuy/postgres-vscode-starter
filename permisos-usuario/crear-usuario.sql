CREATE user test with PASSWORD 'test';

-- @block   consulta de prueba 
select * 
from    animales;
-- @block consulta prueba 
-- conn test
select  *
from visitas;

--@block @conn Postgres
grant SELECT on animales TO test;
-- @block 
REVOKE all on animales FROM test;
