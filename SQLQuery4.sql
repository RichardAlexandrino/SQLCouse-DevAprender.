SELECT CA.ContactName, CB.ContactName, CA.Region, CB.Region
FROM Customers AS "CA", Customers AS "CB"
WHERE CA.Region = CB.Region AND CA.ContactName != CB.ContactName;

/* Ex. 1: Find the name and hire date of all employees who were hired in the same year. */

SELECT EA.LastName, EA.HireDate, EB.LastName, Eb.HireDate
FROM Employees AS "EA", Employees AS "EB"
WHERE DATEPART(YEAR, EA.HireDate) = DATEPART(YEAR, EB.HireDate);

/* Ex. 2: Which products have the same discount percentage in the orders table? */

SELECT ODA.ProductID, ODB.ProductID, ODA.Discount
FROM [Order Details] AS "ODA", [Order Details] AS "ODB"
WHERE ODA.Discount = ODB.Discount AND ODA.Discount !=0
ORDER BY ODA.Discount DESC;
