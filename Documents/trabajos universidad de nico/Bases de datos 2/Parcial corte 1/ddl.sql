--Tabla que almacena los paises
CREATE TABLE country(
	countryid SERIAL PRIMARY KEY,
	name varchar (20)

);

--Tabla que almacena las ciudades
CREATE TABLE city(
	cityid SERIAL PRIMARY KEY,
	name varchar (20),
	countryid int REFERENCES country(countryid)

);

--Tabla que almacena las direcciones de un empleado o una sucursal
CREATE TABLE  address(
	addressid serial PRIMARY KEY,
	line1 varchar (30),
	line2 varchar (30),
	cityid int REFERENCES city(cityid)

);

--Tabla que almacena las oficinas
CREATE TABLE branchoffice(
	branchid serial PRIMARY KEY,
	name varchar (30),
	addressid int REFERENCES address(addressid)

);

--Tabla que almacena la posicion de un empleado
CREATE TABLE position(
	positionid SERIAL PRIMARY KEY,
	name varchar (20)

);

CREATE TABLE department(
	deparmentid SERIAL PRIMARY KEY,
	name varchar (20)

);

--Tabla que almacena la informacion de una empleado
CREATE TABLE employee(
	employeeid SERIAL PRIMARY KEY,
	fullName varchar (20),
	branchid int REFERENCES branchoffice(branchid),
	departmentid int REFERENCES department(deparmentid),
	positionid int REFERENCES position(positionid),
	addressid int REFERENCES address(addressid),
	supervisorid int REFERENCES employee(employeeid)

); 

--Tabla de auditoria de empleados
CREATE TABLE employeeAudit(
	employeeid int,
	fullName varchar (20),
	branch varchar (30),
	department varchar (20),
	positionid varchar (20),
	addressid varchar (60),
	supervisorid varchar (20),
	city varchar (20),
	country varchar (20),
	event varchar (10),
	registeredAt date

);