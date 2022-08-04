drop TABLE if exists aficion_persona,
DROP table if exists personas, 
drop table if exists aficiones

CREATE TABLE personas (
id_persona            Serial not null primary key,
nombre               VARCHAR(30),
aficion 
);

CREATE table aficiones (
    id_aficion serial not null PRIMARY key,
    nombre VARCHAR(30)
);


CREATE TABLE aficion_persona(
id_aficion INTEGER,
id_persona INTEGER,
constraint aficion_persona_aficion_fk
FOREIGN KEY (id_aficion)
REFERENCES aficiones(id_aficion);
constraint aficion_persona_persona_fk
FOREIGN key (id_persona)
REFERENCES persona(id_persona)
)

-- @block Añadir los datos

insert into aficiones(nombre)
values   
('Padel'),
('Senderismo'),
('Pintar'),
('Ajedrez'),
('Musica'),
('Series'),
('Escalada');
insert INTO personas (nombre)
VALUES
('Alicia'),
('Bernardo'),
('Carmen'),
('Dario'),
('Elisa');

INSERT into aficion_persona (id_persona, id_aficion)
VALUES
(1,1),
(1,3),
(1,4),
(2,2),
(2,4),
(3,1),
(3,2),
(4,3),
(5,7);

-- @block Consulta

select * 
FROM personas Inner Join aficion_persona
ON personas.id_persona = aficion_; 
inner join aficiones
on aficion_persona.id_aficion= aficiones.id_aficion;




