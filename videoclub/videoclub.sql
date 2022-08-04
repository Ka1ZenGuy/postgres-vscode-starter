/*
    # Práctica de modelado de datos 1: Base de datos de un videoclub.

    Es el año 1996 y aunque la gente habla de Internet, el videoclub es el rey del ocio doméstico.

    El "Videoclub León 2" nos ha encargado que preparemos una aplicación para gestionar el negocio.

    ## Requisitos

    1.- Necesitamos almacenar la información de los clientes:
        Nº de Socio
        Nombre completo
        Fecha de inscripción
        Fecha de pago de la última mensualidad

    2.- Necesitamos almacenar la información de las cintas de vídeo:
        Título
        Año de lanzamiento
        Sinopsis
        Precio

    3.- Necesitamos almacenar la información de los prestamos:
        Fecha de préstamo
        Fecha límite de devolución
        Película prestada
        Socio que ha tomado el préstamo
    
    4.- Necesitamos acceder de forma rápida a la facturación a través de una vista de todos los
    prestamos con su importe.

    5.- Necesitamos poder modificar de forma sencilla los datos de un socio, sin tener que afectar a múltiples tablas.

    6.- Necesitamos poder obtener de forma sencilla la lista de socios que no están al día con sus pagos.

    7.- Necesitamos poder obtener de forma sencilla la lista de socios que tienen préstamos pasados de fecha.

    8.- Necesitamos poder ver fácilmente cuántos préstamos acumula una cinta, y si son más de 40 borrarla del sistema.
*/

--@block Borrar todas las tablas de la base de datos si ya existen.
drop table if exists prestamos;
drop table if exists clientes;
drop table if exists cintas;
--@block Crear las tablas necesarias para la base de datos
 CREATE TABLE clientes (
    numero_socio       serial primary key not null, 
    nombre            text not null,
    fecha_inscripcion   DATE not null,
    fecha_ultimo_pago  DATE not null
 );

CREATE table cintas(
    id_cinta serial primary key not null,
    titulo              VARCHAR(100) not null,
    año_lanzamiento     DATE,
    Sinopsis            TEXT,
    Precio               NUMERIC(5,2) not null 
);
CREATE TABLE prestamos(
    id_alquiler serial primary key not null, 
    fecha_prestamo        DATE not null ,
    fecha_limite_devolucion DATE not null,
    pelicula_prestada       integer,
    socio_de_prestamo       INTEGER,
    CONSTRAINT cinta_id_cinta_fk
        FOREIGN key (pelicula_prestada)
        references cintas(id_cinta),
        constraint clientes_numero_socio_fk
        FOREIGN key (socio_de_prestamo)
        references clientes(numero_socio)

);

-- @block Obtener el precio de cada prestamo

SELECT 
*
FROM
prestamos Inner JOIN cintas
ON
prestamos.pelicula_prestada = cintas.id_cinta;



--@block Crear las vistas necesarias para simplificar búsquedas futuras.

--@block Hacer la entrada inicial de información

--@block Crear tantos bloques como hagan falta para realizar las acciones solicitadas