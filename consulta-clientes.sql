-- @block 
SELECT
    *
FROM clientes;

-- @block Telefono de los clientes que son
-- 'Responsable de Ventas' o "Comercial"
SELECT 
telefono, cargo
FROM
clientes
WHERE 
cargo = 'Responsable de ventas' OR 
cargo = 'Comercial';

-- @block Clientes que pertenecen a la empresa syer 
-- y no han sido contactados  desde el 1 de junio de 2021
SELECT
*
FROM
clientes
WHERE
empresa = 'syer'

-- @block Clientes de las provincias Madrid o Barcelona 
SELECT
*
FROM
clientes
WHERE
provincia = 'Madrid' OR
provincia = 'Barcelona';

-- @block Teléfono de un cliente que empezaba por c y su dirección contiene "Rosas"

SELECT
telefono
FROM
clientes
WHERE
nombre LIKE 'C%' AND 
direccion LIKE '%Rosas%'; 

-- @block Clientes con nombre o apellido empezando por la letra LABEL

SELECT 
*
FROM
clientes
WHERE 
nombre LIKE 'L%' OR
primer_apellido LIKE 'L%' OR 
segundo_apellido LIKE 'L%'; 

-- @block Clientes con nombre o apellido empezando por la letra 
-- y con pedidos de menos de 500€

SELECT 
*
FROM
clientes
WHERE 
(nombre LIKE 'L%' OR
primer_apellido LIKE 'L%' OR 
segundo_apellido LIKE 'L%') AND  
importe_total_de_pedidos < 500.00;  

-- @block Obtener los primeros 5 clientes (ordenados por nombre)

SELECT
*
FROM
clientes
order BY primer_apellido;
Limit 10;
OFFSET 5; 
-- @block Todas las empresas

SELECT DISTINCT empresa FROM clientes;

-- @block   Todas las provincias con clientes que se han gastado
-- mas de 1000
SELECT DISTINCT
    provincia
    FROM
    clientes
    WHERE
    importe_total_de_pedidos > 5000

    -- @block 10 personas con mayor importe de pedidos
    Select 
        concat(
            nombre, ' ', primer_apellido,' ', segundo_apellido
        ),
        importe_total_de_pedidos
    FROM
    clientes
    order by importe_total_de_pedidos DESC
    LIMIT 10; 

    -- @block numero de clientes en cada provincia
    select  
    provincia,
    COUNT(*)
    FROM
    clientes
    group by provincia;

    -- @block media de gasto por provincias
    Select 
    provincia,
    count (*),
    avg (importe_total_de_pedidos)
    FROM
    clientes
    group by provincia;

    -- @block

    select
    provincia AS "Las provincias que hay",
    sum (importe_total_de_pedidos) AS "Pedidos Totales",
    CAST(avg(importe_total_de_pedidos) As NUMERIC (8,2)) AS "Media de pedidos"
    FROM
    clientes
    group by provincia;

    -- @block 

    select concat (nombre, ' ', primer_apellido, ' ',segundo_apellido) AS "Nombre Completo", 
    importe_total_de_pedidos / pedidos AS "Media"
    FROM
    clientes;

    -- @block
    select 
      AGE('2015-1-1',fecha_de_nacimiento) AS "Edad"
      FROM
      clientes;

