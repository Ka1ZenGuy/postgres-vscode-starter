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
--@block Queremos poder obtener de forma sencilla cuantas veces ha sido visitado cada animal
SELECT
animales.id_animal, animales.nombre, count(*) AS "Numero de visitas"
FROM
visitas_habitats
INNER JOIN animales
ON visitas_habitats.id_habitat = animales.id_habitat
group by animales.id_animal
order by "Numero de visitas" DESC
LIMIT 10;

-- @block Queremos poder comprobar si un visitante ha visitado a un animal concreto.
    SELECT
    visitantes.id_nombre, animales.id_habitat, count(*) AS "Visitas de Visitante"
    FROM
    visitantes

--@block Queremos poder obtener de forma sencilla cuantas veces ha sido visitado cada animal.
SELECT
    animales.id_animal,
    animales.nombre,
    count(*) AS "Numero de visitas"
FROM 
    visitas_habitats 
    INNER JOIN animales 
    ON visitas_habitats.id_habitat = animales.id_habitat
GROUP BY animales.id_animal
ORDER BY "Numero de visitas" DESC;

--@block Queremos poder comprobar si un visitante ha visitado a un animal concreto.
SELECT 
    visitantes.id_visitante,
    animales.id_animal,
    animales.nombre
FROM 
    visitantes 
    INNER JOIN visitas 
    ON visitantes.id_visitante = visitas.id_visitante
    INNER JOIN visitas_habitats
    ON visitas.id_visita = visitas_habitats.id_visita
    INNER JOIN animales
    ON visitas_habitats.id_habitat = animales.id_habitat
WHERE
    visitantes.id_visitante = 8 AND
    animales.id_animal = 5;
--@block Queremos una lista de los 10 hábitats más populares.
SELECT
    habitats.id_habitat, habitats.nombre, count(*) AS "Visitas"
FROM
    habitats
    INNER JOIN visitas_habitats
    ON habitats.id_habitat = visitas_habitats.id_habitat
GROUP BY habitats.id_habitat
ORDER BY "Visitas" DESC
LIMIT 10;
--@block Queremos saber cual es el animal más popular entre visitantes menores de edad.
SELECT 
    animales.id_animal, 
    animales.nombre, 
    count(*) AS "Numero de Visitas"
FROM 
    visitantes
    INNER JOIN visitas
    ON visitantes.id_visitante = visitas.id_visitante
    INNER JOIN visitas_habitats
    ON visitas.id_visita = visitas_habitats.id_visita
    INNER JOIN habitats
    ON visitas_habitats.id_habitat = habitats.id_habitat
    INNER JOIN animales
    ON habitats.id_habitat = animales.id_habitat
WHERE visitantes.edad < 18
GROUP BY animales.id_animal
ORDER BY "Numero de Visitas" DESC
LIMIT 1;
--@block Queremos una lista de los animales ancianos (su edad es mayor que su esperanza de vida) para cuidarlos con más mimo.
SELECT 
    animales.id_animal, 
    animales.nombre, 
    especies.nombre, 
    animales.edad, 
    especies.esperanza_de_vida
FROM animales INNER JOIN especies
ON animales.id_especie = especies.id_especie
WHERE animales.edad > especies.esperanza_de_vida;
--@block Queremos una lista de los animales de especies peligrosas.
SELECT
    animales.id_animal, animales.nombre
FROM animales INNER JOIN especies
ON animales.id_especie = especies.id_especie
WHERE
    especies.peligrosidad = 'Alta' OR
    especies.peligrosidad = 'Media';
--@block Queremos saber cual es el animal más popular entre personas de género femenino.
--@block Queremos saber el tamaño total del zoo en metros cuadrados.
--@block Queremos saber el porcentaje de animales de sexo masculino.
--@block Queremos saber el porcentaje de carnívoros en cada hábitat.

--@block La distribución de Género de los visitantes que han visitado a animales de peligrosidad baja.
SELECT
* 
FROM visitantes
INNER JOIN visitas
ON visitantes.id_visitante = visitas.id_visitante
INNER JOIN visitas_habitats
on visitas.id_visita = visitas_habitats.id_visita
INNER JOIN animales
ON visitas_habitats.id_habitat = animales.id_habitat
INNER JOIN especies
on animales.id_especies = especies.id_especie
WHERE especies.peligrosidad = 'Baja'; 

SELECT especies.id_especie, especies.nombre, string_agg(animales.nombre, ',')
from animales
inner join especie
on animales.id_especia = especies.id_especie
group by especies.id_especie;

-- @block el peso maximo total de todos los animales que viven en cada habitat
SELECT
habitats.id_habitat, habitat.nombre, count (animales.id_animal),
sum (especies.peso_maximo)
from habitats
inner join animales
ON habitats.id_habitat = animales.id_habitat
inner join especies
on animales.id_especie = especies.id_especie
GROUP by habitats.id_habitat;

--@block top 5 de habitats populares por numero de visitas
select 
habitats.tipo, count(*) as "visitas"
from visitas_habitats
INNER JOIN habitats
ON visitas_habitats.id_habitat = habitats.id_habitat
group by habitats.tipo
order BY "visitas" DESC
limit 5;




