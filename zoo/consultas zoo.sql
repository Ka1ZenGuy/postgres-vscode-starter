/*
    # Práctica de modelado de datos 1: Base de datos de un zoo.
    Estamos en 2045 y nos encontramos con el primer Zoo ético del mundo, donde los animales son robots hiper-realistas peluditos y achuchables.
    Es imprescindible tener un control exhaustivo.
    ## Requisitos
    1.- Necesitamos guardar la información de los animales
        Nombre
        Especie
        Sexo
        Edad
        Hábitat en el que vive
    
    2.- Necesitamos guardar la información de las especies de animales
        Nombre
        Peso máximo
        Esperanza de vida
        Peligrosidad (Baja / Media / Alta) <- Y NINGUN OTRO VALOR
        Dieta (carnívoro, piscívoro, herbívoro, omnívoro) <- Y NINGUN OTRO VALOR
    3.- Hábitats
        Nombre
        Tipo (Acuático, Selva, Sabana, Montaña, Desierto) <- Y NINGUN OTRO VALOR
        Tamaño (en metros cuadrados)
    4.- Visitantes
        Identificador (son anónimos)
        Edad
        Género (Masculino, Femenino, Otro) <- Y NINGUN OTRO VALOR
    5.- Visitas
        Visitante
        Hábitats visitados
        Duración de la visita
    6.- Queremos poder obtener de forma sencilla cuantas veces ha sido visitado cada animal.
    7.- Queremos poder comprobar si un visitante ha visitado a un animal concreto.
    8.- Queremos una lista de los 10 hábitats más populares.
    9- Queremos saber cual es el animal más popular entre visitantes menores de edad.
    10.- Queremos una lista de los animales ancianos (su edad es mayor que su esperanza de vida) para cuidarlos con más mimo.
    11.- Queremos una lista de los animales de especies peligrosas.
    12.- Queremos saber cual es el animal más popular entre personas de género femenino.
    13.- Queremos saber el tamaño total del zoo en metros cuadrados.
    14.- Queremos saber el porcentaje de animales de sexo masculino.
    15.- Queremos saber el porcentaje de carnívoros en cada hábitat.
*/

--@block Borrar todas las tablas de la base de datos si ya existen.
DROP TABLE IF EXISTS prestamos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS cintas;
--@block Crear las tablas necesarias para la base de datos
CREATE TABLE clientes(
    numero_de_socio SERIAL PRIMARY KEY NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    fecha_de_inscripcion DATE NOT NULL,
    fecha_ultima_mensualidad DATE NOT NULL
);
CREATE TABLE cintas(
    id_cinta SERIAL PRIMARY KEY NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    año_de_lanzamiento DATE,
    sinopsis TEXT,
    precio NUMERIC(5,2) NOT NULL
);
CREATE TABLE prestamos(
    id_alquiler SERIAL PRIMARY KEY NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_limite_devolucion DATE NOT NULL,
    pelicula_prestada INTEGER NOT NULL,
    socio INTEGER NOT NULL,
    CONSTRAINT cinta_id_cinta_fk
        FOREIGN KEY (pelicula_prestada)
        REFERENCES cintas(id_cinta),
    CONSTRAINT clientes_numero_de_socio_fk
        FOREIGN KEY (socio)
        REFERENCES clientes(numero_de_socio)
);


-- @block Obtener el precio de cada prestamo
SELECT
    sum(cintas.precio)
FROM
    prestamos INNER JOIN cintas
ON
    prestamos.pelicula_prestada = cintas.id_cinta;

-- @block dado el numero de socio, obtener el nombre
SELECT
    nombre
FROM
    clientes
WHERE
    numero_de_socio = 6;

-- @block Nombres de las películas alquiladas por el usuario 6
SELECT
    cintas.titulo
FROM
    prestamos INNER JOIN cintas
ON
    prestamos.pelicula_prestada = cintas.id_cinta
WHERE
    prestamos.socio = 6;

-- @block Mostrar una lista de peliculas y las veces que se ha alquilado
SELECT
    cintas.id_cinta, cintas.titulo, count(*) AS "Veces Alquilada"
FROM
    prestamos INNER JOIN cintas
ON
    prestamos.pelicula_prestada = cintas.id_cinta
GROUP BY
    cintas.id_cinta
ORDER BY "Veces Alquilada" DESC;

-- @block crear vista veces_alquilada
CREATE OR REPLACE VIEW veces_alquilada AS
SELECT
    cintas.id_cinta, cintas.titulo, count(*) AS "Veces Alquilada"
FROM
    prestamos INNER JOIN cintas
ON
    prestamos.pelicula_prestada = cintas.id_cinta
GROUP BY
    cintas.id_cinta
ORDER BY "Veces Alquilada" DESC;

-- @block Consultar vista, filtrando los resultados
SELECT * FROM veces_alquilada
WHERE "Veces Alquilada" > 15;

--@block
DROP VIEW veces_alquilada;