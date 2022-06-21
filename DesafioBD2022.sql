-- Listado completo

SELECT `empleados`.*, `departamento`.`nombre`, `presupuesto`.`Presupuesto`
FROM `empleados` 
	LEFT JOIN `departamento` ON `empleados`.`NroDpto` = `departamento`.`Id_dpto` 
	LEFT JOIN `presupuesto` ON `empleados`.`NroDpto` = `presupuesto`.`dpto`;




-- 2.1 obtener los apellidos de los empleados
SELECT `empleados`.`apellido`
FROM `empleados`;

-- 2.2 obtener los apellidos de los empleados sin repeticiones
SELECT DISTINCT `empleados`.`apellido`
FROM `empleados`;

-- 2.3 obtener los datos de los empleados que tengan el apellido Lopez
SELECT `empleados`.*, `departamento`.`nombre`, `presupuesto`.`Presupuesto`
FROM `empleados` 
	LEFT JOIN `departamento` ON `empleados`.`NroDpto` = `departamento`.`Id_dpto` 
	LEFT JOIN `presupuesto` ON `empleados`.`NroDpto` = `presupuesto`.`dpto`
WHERE `empleados`.`apellido` = 'Lopez';

-- 2.4 obtener los datos de los empleados que tengan el apellido Lopez y los que tengan apellido Perez
SELECT `empleados`.*, `departamento`.`nombre`, `presupuesto`.`Presupuesto`
FROM `empleados` 
	LEFT JOIN `departamento` ON `empleados`.`NroDpto` = `departamento`.`Id_dpto` 
	LEFT JOIN `presupuesto` ON `empleados`.`NroDpto` = `presupuesto`.`dpto`
WHERE `empleados`.`apellido` = 'Lopez' OR `empleados`.`apellido` = 'Perez';

-- 2.5 Obtener todos los datos de los empleados que trabajen en el departamento 14
SELECT `empleados`.*, `departamento`.`nombre`, `presupuesto`.`Presupuesto`
FROM `empleados` 
	LEFT JOIN `departamento` ON `empleados`.`NroDpto` = `departamento`.`Id_dpto` 
	LEFT JOIN `presupuesto` ON `empleados`.`NroDpto` = `presupuesto`.`dpto`
WHERE `empleados`.`NroDpto` = 14;

-- 2.6 Obtener todos los datos de los empleados que trabajen en el departamento 37 y 77
SELECT `empleados`.*, `departamento`.`nombre`, `presupuesto`.`Presupuesto`
FROM `empleados` 
	LEFT JOIN `departamento` ON `empleados`.`NroDpto` = `departamento`.`Id_dpto` 
	LEFT JOIN `presupuesto` ON `empleados`.`NroDpto` = `presupuesto`.`dpto`
WHERE `empleados`.`NroDpto` = 37 OR `empleados`.`NroDpto` = 77;

-- 2.7 Obtener los datos de los empleados cuyo apellido comience con P
SELECT `empleados`.*, `departamento`.`nombre`, `presupuesto`.`Presupuesto`
FROM `empleados` 
	LEFT JOIN `departamento` ON `empleados`.`NroDpto` = `departamento`.`Id_dpto` 
	LEFT JOIN `presupuesto` ON `empleados`.`NroDpto` = `presupuesto`.`dpto`
WHERE `empleados`.`apellido` LIKE 'P%';

-- 2.8 Obtener el presupuesto total de todos los departamentos
SELECT `departamento`.*, `presupuesto`.`Presupuesto`
FROM `departamento` 
	LEFT JOIN `presupuesto` ON `presupuesto`.`dpto` = `departamento`.`Id_dpto`;

-- 2.9 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento
SELECT `empleados`.`nombre`, `empleados`.`apellido`, `empleados`.`dni`, `empleados`.`NroDpto`, `departamento`.`nombre`, `presupuesto`.`Presupuesto`
FROM `empleados` 
	LEFT JOIN `departamento` ON `empleados`.`NroDpto` = `departamento`.`Id_dpto` 
	LEFT JOIN `presupuesto` ON `empleados`.`NroDpto` = `presupuesto`.`dpto`;


-- 2.10 Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto al nombre y presupuesto de su departamento
SELECT `empleados`.`nombre`, `empleados`.`apellido`, `departamento`.`nombre`, `presupuesto`.`Presupuesto`
FROM `empleados` 
	LEFT JOIN `departamento` ON `empleados`.`NroDpto` = `departamento`.`Id_dpto` 
	LEFT JOIN `presupuesto` ON `empleados`.`NroDpto` = `presupuesto`.`dpto`;

-- 2.11 Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60000
SELECT `empleados`.`nombre`, `empleados`.`apellido`, `departamento`.`nombre`, `presupuesto`.`Presupuesto`
FROM `empleados` 
	LEFT JOIN `departamento` ON `empleados`.`NroDpto` = `departamento`.`Id_dpto` 
	LEFT JOIN `presupuesto` ON `empleados`.`NroDpto` = `presupuesto`.`dpto`
WHERE `presupuesto`.`Presupuesto` > '60000';

-- 2.12 Añadir un nuevo departamento: Calidad con un presupuesto de 40000 y código 11, añadir un empleado vinculado al departamento recién creado: Esther Vazquez, DNI 89267109
SELECT `empleados`.*, `departamento`.`nombre`, `presupuesto`.`Presupuesto`
FROM `empleados` 
	LEFT JOIN `departamento` ON `empleados`.`NroDpto` = `departamento`.`Id_dpto` 
	LEFT JOIN `presupuesto` ON `empleados`.`NroDpto` = `presupuesto`.`dpto`;

-- 2.13 Aplicar un recorte presupuestario del 10% a todos los departamentos
UPDATE presupuesto SET Presupuesto = (Presupuesto*.9);
SELECT `departamento`.*, `presupuesto`.`Presupuesto`
FROM `departamento` 
	LEFT JOIN `presupuesto` ON `presupuesto`.`dpto` = `departamento`.`Id_dpto`;

-- 2.14 Reasignar a los empleados del departamento de investigación (código 77) al departamento de informática (código 14)
UPDATE empleados SET NroDpto = 14 WHERE NroDpto = 77;


-- 2.15 Despedir a los empleados del departamento de informática (código 14)
DELETE FROM empleados WHERE empleados.NroDpto = 14;

-- 2.16 Despedir a los empleados que trabajen en departamentos con un presupuesto superior a 90000
DELETE FROM empleados WHERE presupuesto.Presupuesto > 90000;
-- No hay departamentos con presupuesto mayor a 90000 porque se redujo un 10%