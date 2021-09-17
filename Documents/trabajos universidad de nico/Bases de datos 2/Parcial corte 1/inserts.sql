--Inserts de la tabla country
INSERT INTO public.country(
	countryid, name)
	VALUES ('1001', 'USA');
INSERT INTO public.country(
	countryid, name)
	VALUES ('1002', 'COLOMBIA');
INSERT INTO public.country(
	countryid, name)
	VALUES ('1003', 'FRANCIA');
INSERT INTO public.country(
	countryid, name)
	VALUES ('1004', 'JAPON');
	
--Inserts de la tabla city
INSERT INTO public.city(
	cityid, name, countryid)
	VALUES ('100', 'NEW YORK', '1001');
	
--Inserts de la tabla address
INSERT INTO public.address(
	addressid, line1, line2, cityid)
	VALUES ('1234', 'cll 52', 'cra 34', '100');
	
--Inserts de la tabla branchoffice
INSERT INTO public.branchoffice(
	branchid, name, addressid)
	VALUES ('1000', 'Sucursal 1', '1234');
	
--Inserts de la tabla department
INSERT INTO public.department(
	deparmentid, name)
	VALUES ('10', 'SISTEMAS');
INSERT INTO public.department(
	deparmentid, name)
	VALUES ('11', 'FINANZAS');
INSERT INTO public.department(
	deparmentid, name)
	VALUES ('12', 'SOPORTE');
	
--Inserts de la tabla position
INSERT INTO public."position"(
	positionid, name)
	VALUES ('10', 'Desarrollador junior');
INSERT INTO public."position"(
	positionid, name)
	VALUES ('11', 'Desarrollador senior');
	
--Inserts de la tabla empleyee
INSERT INTO public.employee(
	employeeid, fullname, branchid, departmentid, positionid, addressid, supervisorid)
	VALUES ('1000', 'Nicolas Avila', '1000', '10', '10', '1234', null);