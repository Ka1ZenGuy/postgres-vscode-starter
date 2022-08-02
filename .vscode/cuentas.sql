-- @block Crear tabla con Nombre y saldo 
DROP TABLE If EXISTS cuentas;
Create TABLE cuentas(
    Nombre               TEXT
    Saldo                Text
);
-- @block Añadir DNIS

alter table cuentas 
Add Column dni CHAR(9);

Update cuentas
SET dni = CASE nombre
WHEN 'Andrés' THEN '35264900N'
WHEN 'Blanca' THEN '21424292E'
WHEN 'Carlos' THEN '69541154X'
WHEN 'Diana' THEN '34493683P'
END;

-- @block Añadir los Apellidos

Alter table cuentas
Alter Column apellido type VARCHAR(40);
Update cuentas
WHEN 'Andrés' THEN 'Jerez Saenz'
WHEN 'Blanca' THEN 'Sampedro Huertas'
WHEN 'Carlos' THEN 'Peralta Manzanares'
WHEN 'Diana' THEN 'Palomino de Castro'
END;
