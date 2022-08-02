drop table if EXISTS empleados;
drop table if EXISTS empresas; 

CREATE TABLE empresas (
  id_empresa serial not null primary key,
  nombre VARCHAR(30) not null,
  sede VARCHAR(40) not null,
  sector VARCHAR (40) not null 
);

CREATE table empleados ( 
    id_empleado serial not null PRIMARY key,
    nombre VARCHAR(20) not null,
    apellido VARCHAR(40) not null, 
    id_empresa integer not null, 
    CONSTRAINT  empleado_empresa_id_fk 
    FOREIGN key (id_empresa)
    REFERENCES empresas (id_empresa)

);

-- @block añadir los datos 

INSERT into empresas (nombre, sector, sede)
VALUES
('City Network', 'S/C Tenerife', 'Diseño de interiores'),
('Kft Innovación', 'S/C Tenerife', 'Publicidad'),
('Praxis Consulting', 'Las Palmas', 'Contabilidad y Finanzas'),
('Robody', 'S/C Tenerife', 'Publicidad');

INSERT into empleados (nombre,apellido, id_empresa)
VALUES
('Roque', 'Salcedo', 1),
('Maria Estrella', 'Sabater',1),
('Eider', 'Serrano', 2),
('Rufina', 'Bilbao', 3),
('Regina', 'Puente', 4);

-- @block 
Select * FROM empleados;

-- @block join
select * FROM 
empleados.nombre
empleados.apellido
empresas.nombre AS 


  FROM Inner Join empresas On empleados.id_empresa = empresas.id_empresa;