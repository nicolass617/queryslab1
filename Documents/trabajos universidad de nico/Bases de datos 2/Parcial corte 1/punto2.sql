--Vista para mantener la informacion de la sucursal de USA
CREATE VIEW empleados_US AS
    SELECT employeeid, fullname, department, position 
    FROM employeeaudit INNER JOIN branchoffice AS bo ON bo.name = employeeaudit.branch
    WHERE bo.branchid = '1000';