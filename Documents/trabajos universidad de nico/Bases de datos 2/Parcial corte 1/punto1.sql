--Funcion que imserta en la tabla employeeaudit cuando se realiza algun evento de la tabla employee
CREATE OR REPLACE FUNCTION employee_audit_fn()
	RETURNS TRIGGER
	LANGUAGE plpgsql
	AS
$$
DECLARE
	nombre_sucursal varchar;
	nombre_departamento varchar;
	nombre_posicion varchar;
	supervisorName varchar;
	direccion varchar;
	ciudad varchar;
	pais varchar;
BEGIN
	IF (TG_OP = 'INSERT') THEN
		SELECT name INTO nombre_sucursal FROM branchoffice WHERE branchoffice.branchid= NEW.branchid;
		SELECT name INTO nombre_departamento FROM department WHERE department.deparmentid= NEW.departmentid;
		SELECT name INTO nombre_posicion FROM position WHERE position.positionid = NEW.positionid;
		SELECT CONCAT(line1, ' ', line2) INTO direccion FROM address WHERE address.addressid = NEW.addressid;
		SELECT fullname INTO supervisorName FROM employee WHERE employee.employeeid = NEW.supervisorid;
		SELECT name INTO ciudad FROM city INNER JOIN address ON city.cityid = address.cityid WHERE address.addressid  = NEW.addressid;
		SELECT country.name INTO pais FROM country INNER JOIN city ON country.countryid = city.countryid INNER JOIN address ON address.cityid = city.cityid WHERE address.addressid  = NEW.addressid;
		
		INSERT INTO employeeaudit VALUES (NEW.employeeid, NEW.fullName, nombre_sucursal, nombre_departamento, 
										 nombre_posicion, direccion, NEW.supervisorid, ciudad, pais, 'INSERT', NOW());
		RETURN NEW;	
		
	ELSIF (TG_OP = 'UPDATE') THEN
		SELECT name INTO nombre_sucursal FROM branchoffice WHERE branchoffice.branchid= NEW.branchid;
		SELECT name INTO nombre_departamento FROM department WHERE department.deparmentid= NEW.departmentid;
		SELECT name INTO nombre_posicion FROM position WHERE position.positionid = NEW.positionid;
		SELECT CONCAT(line1, ' ', line2) INTO direccion FROM address WHERE address.addressid = NEW.addressid;
		SELECT fullname INTO supervisorName FROM employee WHERE employee.employeeid = NEW.supervisorid;
		SELECT name INTO ciudad FROM city INNER JOIN address ON city.cityid = address.cityid WHERE aaddress.addressid  = NEW.addressid;
		SELECT country.name INTO pais FROM country INNER JOIN city ON country.countryid = city.countryid INNER JOIN address ON address.cityid = city.cityid WHERE address.addressid  = NEW.addressid;
		
		INSERT INTO employeeaudit VALUES (OLD.employeeid, OLD.fullName, nombre_sucursal, nombre_departamento,
										 nombre_posicion, direccion, OLD.supervisorid, ciudad, pais, 'UPDATE', NOW());
		RETURN NEW;	
	ELSIF (TG_OP = 'DELETE') THEN
		SELECT name INTO nombre_sucursal FROM branchoffice WHERE branchoffice.branchid= OLD.branchid;
		SELECT name INTO nombre_departamento FROM department WHERE department.deparmentid= OLD.departmentid;
		SELECT name INTO nombre_posicion FROM position WHERE position.positionid = OLD.positionid;
		SELECT CONCAT(line1, ' ', line2) INTO direccion FROM address WHERE address.addressid = OLD.addressid;
		SELECT fullname INTO supervisorName FROM employee WHERE employee.employeeid = OLD.supervisorid;
		SELECT name INTO ciudad FROM city INNER JOIN address ON city.cityid = address.cityid WHERE aaddress.addressid  = OLD.addressid;
		SELECT country.name INTO pais FROM country INNER JOIN city ON country.countryid = city.countryid INNER JOIN address ON address.cityid = city.cityid WHERE address.addressid  = OLD.addressid;
		
		INSERT INTO employeeaudit VALUES (OLD.employeeid, OLD.fullName, nombre_sucursal, nombre_departamento, 
										 nombre_posicion, direccion, OLD.supervisorid, ciudad, pais, 'DELETE', NOW());
		RETURN OLD;	
	END IF;
END;
$$;

--Elimina el trigger si este existe
DROP TRIGGER IF EXISTS employee_audit_tg ON employee;

--Trigger que se ejecuta depues de realizar algun evento en la tabla employee
CREATE TRIGGER employee_audit_tg
	AFTER INSERT OR DELETE OR UPDATE
	ON employee
	FOR EACH ROW
	EXECUTE PROCEDURE employee_audit_fn();