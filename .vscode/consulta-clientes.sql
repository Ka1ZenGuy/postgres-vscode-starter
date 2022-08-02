SELECT
    nombre,
    primer_apellido,
    segundo_apellido,
    telefono
    FROM clientes
    WHERE
         nombre like  '%A' AND
         primer_apellido like '%A' AND
         segundo_apellido like '%D'
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

         -- @block Total de ventas a empresa a serize en baleares 
         SELECT 
         SUM(importe_total_de_pedidos)
         FROM
         clientes
         Where 
         provincia = 'Baleares' AND 
         empresa = 'forize';
         GROUP BY empresa;

         -- @block Numero de pedidos realizados desde Canarias (S/C y Las Palmas)

        SELECT 
        SUM(pedidos)
        FROM clientes
        WHERE 
        provincia = 'Santa Cruz de Tenerife' OR
        provincia = 'Las Palmas';

        -- @block Media de pedidos relizados por provincia
        SELECT
             provincia,ROUND(AVG(pedidos),2)
        FROM
        clientes
        GROUP BY provincia;

        --@block Consultas para mostrar las primeras 5 páginas de 10 resultados de la tabla 
        SELECT
        *
        FROM
        clientes
        LIMIT   10 OFFSET 0;

        -- @block Segunda página
        SELECT * FROM clientes Limit 10 OFFSET 10;

        -- @block Tercera página
        SELECT * From clientes Limit 10 OFFSET 20;
        -- @block Cuarta página
        SELECT * From clientes Limit 10 OFFSET 30;

         -- @block Quinta página
        SELECT * From clientes Limit 10 OFFSET 40;

        -- @block obtener la lista de clientes que vive en un Ático 
        SELECT * from clientes where direccion LIKE '%Ático%';
--Consultas destructivas--
        -- @block Borrar clientes con N/A en provincia 
        DELETE from clientes
        where provincia = '#N/A'

    -- @block Actualizar la fecha del último contacto de todos los clientes
    -- de la empresa laudism a Current_date

   UPDATE clientes
     SET ultima_vez_contactado = current_date
     where
     empresa = 'laudism'; 

    -- @block   Nuevo pedido de una persona

    Update clientes
    SET
    pedidos = pedidos + 1, 
    importe_total_de_pedidos = importe_total_de_pedidos + 100
    where
    correo_electronico ='pmenas@susise.com';

    -- @block Ver Resultado
    select correo_electronico, pedidos, importe_total_de_pedidos
    from    clientes
    where correo_electronico = 'pmenas@susise.com';

    -- @block Ha caido un meteorito en Soria, borra a todos los clientes de la zona
    Delete from clientes where provincia = 'Soria';

    -- @block Ascender a Carlos Rodrigo Falcón a director comercial 
    Update clientes
    SET
    cargo = 'Director Comercial' 
    where nombre = 'Carlos' AND 
    primer_apellido = 'Rodrigo' and
    segundo_apellido = 'Falcón';

    -- @block Cambiar a angélica de la empresa lunize cambia  de trabajo a malend
    -- como responsable de ventas, también se ha mudado a calle Falsa, 123, Santa Cruz de Tenerife, Santa Cruz de Tenerife.
    update clientes
    Set
    cargo = 'Responsable de Ventas',
    direccion = 'calle Falsa, 123, Santa Cruz de Tenerife, Santa Cruz de Tenerife',
    empresa = 'malend',
    ultima_vez_contactado = '2020-01-10',
    provincia = 'Santa Cruz de Tenerife',
    Ciudad = 'Santa Cruz de Tenerife'
    where
    nombre = 'Angélica';







