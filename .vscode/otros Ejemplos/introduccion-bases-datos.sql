-- Borra la tabla si existe--
DROP TABLE IF EXISTS lista_dulces;
-- Crea la tabla --
create table lista_dulces(
    nombre_dulce text,
    descripcion_dulce text,
    precio_dulce text,
    stock_dulce text
);

-- Insertar datos en la tabla --
insert into lista_dulces (
         nombre_dulce,
        descripcion_dulce,
        precio_dulce
    )
VALUES (
        'Donut', 
        'Dulce con agujero',
        '1,50€'
    ),(
        'Pachanga', 
        'Dulce con crema',
        '1,25€'
    ),(
    'Berlina',
    'Hojaldre relleno de crema',
    '2,00€'
    );

    -- Ver contenido de lista_dulces-- 
 SELECT * 
 FROM lista_dulces;