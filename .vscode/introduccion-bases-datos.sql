-- Borra la tabla si existe--
DROP TABLE IF EXISTS lista_dulces;

-- Crea la tabla --
create table lista_dulces(
    nombre_dulce text,
    descripcion_dulce text
);
