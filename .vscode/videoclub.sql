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
drop table if exists clientes;
drop table if exists cintas;
drop table if exists prestamos;
--@block Crear las tablas necesarias para la base de datos
 CREATE TABLE clientes(
    numero_socio       serial primary key not null, 
    nombre            text not null,
    fecha_inscripcion   DATE not null,
    fecha_ultimo_pago  DATE not null





 );

CREATE table cintas(
    id_cinta serial primary key not null,
    Título              VARCHAR(100) not null,
    año_lanzamiento     DATE,
    Sinopsis            TEXT,
    Precio               NUMERIC(5,2) not null 
);
CREATE TABLE prestamos(
    id_alquiler serial primary key not null, 
    fecha_prestamo        DATE not null ,
    fecha_limite_devolucion DATE not null,
    pelicula_prestada       integer,
    Socio_de_prestamo       INTEGER
    CONSTRAINT cinta_id_cinta_fk
        FOREIGN key (pelicula_prestada)
        references cintas(id_cinta),
        constraint clientes_numero_socio_fk
        FOREIGN key (socio)
        references clientes(numero_socio)

);

insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Willy', '3/12/1986', '3/12/2009');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Modestine', '10/15/2012', '1/4/2000');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Curt', '8/15/2006', '8/12/2010');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Dulce', '7/9/2005', '4/16/2007');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Dari', '11/23/1989', '3/27/2008');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Jervis', '1/12/2001', '7/26/2016');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Eddi', '4/17/1996', '11/6/2007');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Mirna', '3/26/2014', '4/4/1997');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Mateo', '8/13/2000', '10/12/2019');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Poppy', '4/23/1987', '9/29/2018');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Michaeline', '11/2/2019', '7/19/2007');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Allegra', '9/12/1994', '1/3/2020');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Elisabet', '3/25/1996', '6/4/1997');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Yank', '2/23/2016', '8/1/2009');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Case', '9/2/2012', '10/8/2001');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Dorita', '9/15/1994', '3/30/2005');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Jarid', '5/12/2010', '4/1/2009');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Pamella', '5/12/2000', '6/21/2014');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Clayton', '7/22/2015', '4/7/1998');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Warde', '8/24/2008', '2/12/2018');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Dianna', '7/14/2013', '4/29/2016');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Lenna', '12/20/2013', '4/18/2020');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Averil', '10/27/2000', '7/12/2007');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Verge', '11/30/2009', '9/28/1998');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Allan', '10/1/1995', '8/12/2008');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Salim', '8/3/1982', '11/13/1996');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Rriocard', '4/23/1985', '12/15/2006');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Misty', '9/29/2012', '4/20/2014');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Harriet', '9/3/2003', '1/13/2007');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Hillel', '8/14/2019', '2/19/2010');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Marvin', '11/10/2004', '10/15/2014');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Jayme', '6/26/1986', '4/1/2017');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Drucie', '7/3/1987', '4/20/2007');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Matthiew', '5/20/2017', '10/28/2015');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Bentley', '9/12/2015', '3/26/2006');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Antonie', '11/23/1989', '5/14/2011');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Griff', '6/1/1984', '12/7/2017');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Cris', '6/9/1997', '1/20/2013');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Jean', '6/14/2004', '5/28/2013');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Alden', '8/1/2017', '11/27/2011');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Ruthe', '1/20/2016', '4/28/2011');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Lammond', '6/20/2021', '3/13/2021');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Stanislaw', '4/24/1999', '6/13/2019');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Raphael', '11/12/2020', '2/8/2021');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Sergio', '2/12/2019', '6/5/2015');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Ashbey', '5/31/1995', '2/2/2014');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Cello', '10/25/1997', '6/15/2011');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Tomas', '9/24/2017', '7/15/2014');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Randi', '7/20/1997', '4/11/2006');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Octavius', '9/14/2000', '12/12/2016');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Natasha', '8/28/1993', '8/28/2011');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Griffie', '7/11/1987', '3/4/1999');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Marcella', '10/9/1999', '6/28/2011');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Nathanil', '8/5/2013', '1/19/2015');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Field', '11/13/2007', '3/30/2002');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Harrison', '8/27/2013', '9/3/2014');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Rene', '7/18/2009', '3/31/1999');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Benjy', '5/17/1989', '11/21/1998');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Berne', '1/18/1984', '9/25/2011');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Neron', '9/14/1993', '6/23/2013');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Zola', '12/15/2018', '7/6/2001');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Errick', '3/20/2018', '10/13/2008');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Tessa', '12/7/1997', '6/11/2000');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Flint', '8/5/1997', '1/16/2015');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Sibyl', '7/3/2014', '7/3/2009');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Alaric', '5/3/1988', '2/26/2015');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Murry', '9/12/1993', '6/10/2015');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Zuzana', '3/13/2008', '10/10/2014');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Max', '5/20/1987', '8/25/2001');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Lou', '9/17/2014', '2/21/1999');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Jack', '2/25/2018', '7/27/2010');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Flory', '2/26/2007', '2/5/2003');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Jose', '9/19/1987', '11/14/2003');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Amberly', '2/28/1990', '11/4/2001');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Bobina', '3/1/2008', '10/5/1996');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Ford', '4/25/1982', '6/6/2000');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Anallese', '3/18/2006', '10/1/2017');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Delila', '8/23/2003', '1/21/2000');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Dona', '7/30/2010', '10/19/2005');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Gerianna', '8/31/2015', '1/13/2006');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Elijah', '5/27/1985', '8/11/2001');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Farr', '1/15/2020', '4/12/2020');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Bettine', '12/25/2018', '3/8/2001');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Jada', '9/17/1984', '6/14/2014');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Farleigh', '4/9/2009', '10/28/2005');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Corey', '8/22/2009', '11/7/1996');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Rici', '8/12/1990', '4/3/2014');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Marco', '6/1/2004', '6/14/1997');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Terry', '2/22/1986', '3/16/1999');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Phil', '1/8/2021', '2/4/2018');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Gradeigh', '8/30/2003', '6/9/2020');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Hedvige', '12/21/2006', '12/23/1996');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Laurence', '1/9/2013', '6/28/2015');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Cristian', '3/20/1988', '8/16/2001');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Jermayne', '1/25/2009', '10/12/2014');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Orson', '11/6/1999', '6/17/2010');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Sherwood', '1/30/1981', '1/7/2010');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Nike', '1/16/1985', '1/5/2013');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Dorry', '7/13/2011', '4/23/2014');
insert into Clientes (nombre, fecha_inscripcion, fecha_ultimo_pago) values ('Noelani', '7/21/2005', '11/5/2012');

--@block Crear las vistas necesarias para simplificar búsquedas futuras.

--@block Hacer la entrada inicial de información

--@block Crear tantos bloques como hagan falta para realizar las acciones solicitadas