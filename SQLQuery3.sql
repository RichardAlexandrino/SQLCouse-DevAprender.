-- Course

SELECT *
FROM Person.Person;

SELECT Title
FROM Person.Person;

SELECT *
FROM Person.EmailAddress;

SELECT *
FROM Person.Person
WHERE LastName = 'miller' AND FirstName = 'anna';

SELECT * 
FROM Production.Product
WHERE Color = 'blue' OR Color = 'black';

SELECT * 
FROM Production.Product
WHERE ListPrice > 1500 AND ListPrice < 5000
ORDER BY ListPrice;

SELECT * 
FROM Production.Product
WHERE Color <> 'red';

SELECT COUNT(*)
FROM Person.Person;

SELECT COUNT(DISTINCT Title)
FROM Person.Person;

SELECT TOP 10 *
FROM Production.Product;

SELECT *
FROM Person.Person
ORDER BY FirstName ASC, LastName DESC;

SELECT FirstName, LastName
FROM Person.Person
ORDER BY MiddleName ASC; /* It is not considered 
good practice to sort a list by a column that 
is not visible, but it is possible to do so. */

SELECT *
FROM Production.Product
WHERE ListPrice BETWEEN 1000 AND 1500;

SELECT *
FROM Production.Product
WHERE ListPrice NOT BETWEEN 1000 AND 1500;

SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01'
ORDER BY HireDate;

SELECT *
FROM Person.Person
WHERE BusinessEntityID IN (2, 7, 13); /* This is like
										WHERE BusinessEntityID = 2
										OR BusinessEntityID = 7
										OR BusinessEntityID = 13 
										besides being faster */

SELECT *
FROM Person.Person
WHERE BusinessEntityID NOT IN (2, 7, 13);

SELECT *
FROM Person.Person
WHERE FirstName LIKE 'ovi%'; /* To find someone or something in
database whose name starts with 'Ovi'. */

SELECT *
FROM Person.Person
WHERE FirstName LIKE '%to'; /* To find someone or something in
database whose name ends with 'to'. */

SELECT *
FROM Person.Person
WHERE FirstName LIKE '%essa%'; /* To find someone or something in
database whose name contains 'essa' in the middle. */

SELECT *
FROM Person.Person
WHERE FirstName LIKE '%ro_'; /* The underscore replaces only one 
character. */

SELECT TOP 10 SUM(LineTotal) AS "Sum"
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MIN(LineTotal) AS "Minimum"
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MAX(LineTotal) AS "Maximum"
FROM Sales.SalesOrderDetail;

SELECT TOP 10 AVG(LineTotal) AS "Average"
FROM Sales.SalesOrderDetail;

SELECT SpecialOfferID, SUM(UnitPrice) AS "Sum" -- Gathered all those with 
FROM Sales.SalesOrderDetail                    -- a special offer ID, summed their
GROUP BY SpecialOfferID;                       -- values, and then grouped them.

SELECT FirstName, COUNT(FirstName) AS "Quantity"
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > 10 -- Same function as WHERE, but it is executed after 
							 -- the GROUP BY.

SELECT P.BusinessEntityID, P.FirstName, P.LastName, PE.EmailAddress
FROM Person.Person AS "P"
INNER JOIN Person.EmailAddress AS "PE" ON P.BusinessEntityID = PE.BusinessEntityID;

SELECT P.ListPrice, P.Name AS "ProductName", PS.Name AS "Subcategory"
FROM Production.Product AS "P"
INNER JOIN Production.ProductSubcategory AS "PS" ON P.ProductSubcategoryID = PS.ProductSubcategoryID;

SELECT TOP 10 *
FROM Person.BusinessEntityAddress AS "BA"
INNER JOIN Person.Address AS "PA" ON BA.AddressID = PA.AddressID;

SELECT *												-- 19118 rowns.
FROM Person.Person AS "PP"
INNER JOIN Sales.PersonCreditCard AS "PC" ON PP.BusinessEntityID = PC.BusinessEntityID;

SELECT *												-- 19972 rowns.
FROM Person.Person AS "PP"								-- The difference found is the people who do not have a
LEFT JOIN Sales.PersonCreditCard AS "PC" ON PP.BusinessEntityID = PC.BusinessEntityID; -- registered credit card.

SELECT 19972 - 19118 -- Number of people who do not have a registered credit card.

SELECT *												-- 854 rowns.
FROM Person.Person AS "PP"								-- People who do not have a registered credit card.
LEFT JOIN Sales.PersonCreditCard AS "PC" ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.BusinessEntityID IS NULL;

SELECT ProductID, Name, ProductNumber
FROM Production.Product
WHERE Name LIKE '%chain%'
UNION
SELECT ProductID, Name, ProductNumber
FROM Production.Product
WHERE Name LIKE '%decal%';

SELECT FirstName, Title, MiddleName
FROM Person.Person
WHERE Title = 'Mr.'
UNION
SELECT FirstName, Title, MiddleName
FROM Person.Person
WHERE MiddleName = 'A';

SELECT AVG(ListPrice)  -- 438.67
FROM Production.Product;

SELECT *
FROM Production.Product
WHERE ListPrice > 438.66;

SELECT *
FROM Production.Product
WHERE ListPrice > (
	SELECT AVG(ListPrice) 
	FROM Production.Product
	);

SELECT SalesOrderID, DATEPART(MONTH, OrderDate) AS "Month"
FROM Sales.SalesOrderHeader; 
-- https://learn.microsoft.com/pt-br/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver16

SELECT DATEPART(MONTH, OrderDate) AS "Month", AVG(TotalDue) AS "Average of Due"
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(MONTH, OrderDate)
ORDER BY Month;

SELECT CONCAT(LOWER(FirstName), ' ', UPPER(LastName)) AS "Full Name", LEN(FirstName + LastName) AS "Number of Letters"
FROM Person.Person
ORDER BY [Number of Letters] DESC;

SELECT FirstName, SUBSTRING(FirstName, 1, 3)
FROM Person.Person;

SELECT ProductNumber, REPLACE(ProductNumber, '-', '#')
FROM Production.Product;

SELECT ProductNumber, REPLACE(ProductNumber, '-', ' ')
FROM Production.Product;
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver16

SELECT UnitPrice, LineTotal, UnitPrice + LineTotal AS "Sum", UnitPrice - LineTotal AS "Sub", 
		UnitPrice * LineTotal AS "Plus", UnitPrice / LineTotal AS "Div"
FROM Sales.SalesOrderDetail;

SELECT LineTotal, ROUND(LineTotal, 1), SQRT(LineTotal)
FROM Sales.SalesOrderDetail;
-- https://learn.microsoft.com/pt-br/sql/t-sql/functions/mathematical-functions-transact-sql?view=sql-server-ver16

CREATE VIEW [Simple Person] AS
SELECT FirstName, MiddleName, LastName
FROM Person.Person
WHERE Title = 'Ms.'

SELECT *
FROM [Simple Person];


-- EXERCISES

/* Ex.1 : The marketing team needs to conduct research on the 
 first and last names of all the customers registered in the system. */

SELECT FirstName, LastName
FROM Person.Person;

/* Ex. 2: How many unique first and last names do we have in our customer table? , */ 

SELECT COUNT(DISTINCT FirstName), COUNT(DISTINCT LastName)
FROM Person.Person;

/* Ex. 3: The product production team needs the names of all parts that 
weigh more than 500kg and less than 700kg to conduct an inspection. */

SELECT Name
FROM Production.Product
WHERE Weight > 500 AND Weight < 700;

/* Ex. 4: It was requested by marketing a list of all employees who are 
married and salaried. */

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' AND SalariedFlag = 1;

/* Ex. 5: Peter Krebs owes a payment, please retrieve his email so we can 
send a billing notice. */

SELECT *
FROM Person.Person
WHERE FirstName = 'Peter' AND LastName = 'Krebs';

SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityID = 26;

/* Ex. 6: How many products do we have registered in our product table? */

SELECT COUNT(*)
FROM Production.Product;

/* Ex. 7: How many product sizes do we have registered in our table? */

SELECT COUNT(Size)
FROM Production.Product;

/* Ex. 8: How many different product sizes do we have registered in our 
table? */

SELECT COUNT(DISTINCT Size)
FROM Production.Product;

/* Ex. 9: Get the ProductId of the 10 most expensive products registered 
in the system, listed from the most expensive to the least expensive. */

SELECT TOP 10 ProductID
FROM Production.Product
ORDER BY ListPrice DESC;

/* Ex. 10: Get the name and product number of the products with a ProductId 
between 1 and 4. */

SELECT Name, ProductNumber
FROM Production.Product
WHERE ProductID >= 1 AND ProductID <= 4;

/* Ex. 11: How many products do we have registered in the system that cost 
more than $1500? */

SELECT COUNT(ListPrice)
FROM Production.Product
WHERE ListPrice > 1500;

/* Ex. 12: How many people do we have with a last name starts with letter 
P?*/

SELECT COUNT(LastName)
FROM Person.Person
WHERE LastName LIKE 'P%';

/* Ex. 13: In how many unique cities are our customers registered? */

SELECT COUNT(DISTINCT City)
FROM Person.Address;

/* Ex. 14: What are the unique cities registered in our system? */

SELECT DISTINCT City
FROM Person.Address;

/* Ex. 15: How many red products are priced between $500 and $1000? */

SELECT COUNT(*)
FROM Production.Product
WHERE Color = 'red' AND ListPrice BETWEEN 500 AND 1000;

/* Ex. 16: How many registered products have the word 'road' in their name? */

SELECT COUNT(*)
FROM Production.Product
WHERE Name LIKE '%road%';

/* Ex. 17: What is the quantity of each product that has been sold to date? */

SELECT ProductID, COUNT(ProductID) AS "Quantity of Sales"
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

/* Ex. 18: How many entries do we have for each name registered in our database? */

SELECT FirstName, COUNT(FirstName) AS "Incidence"
FROM Person.Person
GROUP BY FirstName
ORDER BY FirstName;

SELECT FirstName, COUNT(FirstName) AS "Incidence"
FROM Person.Person
GROUP BY FirstName
ORDER BY Incidence DESC;

/* Ex. 19: What is the average price for silver-colored products? */

SELECT Color, AVG(ListPrice)
FROM Production.Product
WHERE Color = 'Silver'
GROUP BY Color;

/* Ex. 20: How many people have the same last name? Group by last names. */

SELECT MiddleName, COUNT(MiddleName) AS "Incidence"
FROM Person.Person
GROUP BY MiddleName;

/* Ex. 21: What is the average quantity each product is sold in the store? */

SELECT ProductID, Name
FROM Production.Product
WHERE ProductID >= 707
ORDER BY ProductID;

SELECT ProductID, AVG(OrderQty) AS "Average of Sales"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY ProductID;

/* Ex. 22: What was the 'total sale value' of the 10 best-selling products? */

SELECT ProductID, Name
FROM Production.Product
WHERE ProductID IN (782, 783, 779, 780, 781, 784, 793, 794, 795, 753);

SELECT TOP 10 ProductID, SUM(LineTotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC;

/* Ex. 23: How many products and what are their average quantities registered in 
the service orders, grouped by their product IDs? */

SELECT *
FROM Production.WorkOrder;

SELECT ProductID, COUNT(ProductID) AS "Qty of Products", AVG(OrderQty) AS "Average"
FROM Production.WorkOrder
GROUP BY ProductID;

/* Ex. 24: Which products have their total sales between $162k and $500k? */

SELECT ProductID, SUM(LineTotal) AS "Total Sales"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) BETWEEN 162000 AND 500000
ORDER BY [Total Sales];

/* Ex. 25: Which names in the system occur more than 10 times, but only with 
the title of Mr.? */

SELECT FirstName, COUNT(FirstName) AS "Incidence"
FROM Person.Person
WHERE Title = 'Mr.'
GROUP BY FirstName
HAVING COUNT(FirstName) > 10
ORDER BY Incidence;

/* Ex. 26: Which provinces have the highest number of registrations in our 
system, that is, more than 1000 times? */

SELECT StateProvinceID, COUNT(StateProvinceID) AS "Incidence"
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000
ORDER BY StateProvinceID;

SELECT StateProvinceID, Name
FROM Person.StateProvince
WHERE StateProvinceID IN (7, 9, 14, 50, 58, 59);

/* Ex. 27: Since this is a multinational company, which products are not 
averaging at least 1 million dollars in total sales? */

SELECT ProductID, Name
FROM Production.Product
ORDER BY ProductID;

SELECT ProductID, AVG(LineTotal) AS "Average of Sales"
FROM  Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) < 1000000
ORDER BY ProductID;

/* Ex. 28: Find the columns with first and last names of people and rename 
them to 'Nome' and 'Sobrenome'. */

SELECT FirstName AS "Nome", LastName AS "Sobrenome"
FROM Person.Person;

/* Ex. 29: Find the product number among the columns and rename it to 
'NumeroDeProduto'. */

SELECT ProductNumber AS "NumeroDeProduto"
FROM Production.Product;

/* Ex. 30: Find the unit price column of the products and rename it to 
'PrecoUnitario'. */

SELECT UnitPrice AS "PrecoUnitario"
FROM Sales.SalesOrderDetail;

/* Ex. 31: By joining the tables of people's phone numbers and the types of phone 
numbers, filter the business entity ID, type's name, the phone number type ID, 
and the phone number. */

SELECT *
FROM Person.PersonPhone;

SELECT *
FROM Person.PhoneNumberType;

SELECT PP.BusinessEntityID, PNT.Name, PP.PhoneNumberTypeID, PP.PhoneNumber
FROM Person.PersonPhone AS "PP"
INNER JOIN Person.PhoneNumberType AS "PNT" ON PP.PhoneNumberTypeID = PNT.PhoneNumberTypeID;

/* Ex. 32: By joining the tables of provinces and people's addresses, filter the 
address ID, province ID, and state name. */

SELECT *
FROM Person.StateProvince;

SELECT *
FROM Person.Address;

SELECT PA.AddressID, PA.StateProvinceID, PSP.Name AS "StateProvinceName"
FROM Person.Address AS "PA"
INNER JOIN Person.StateProvince AS "PSP" ON PA.StateProvinceID = PSP.StateProvinceID;

/* Ex. 33: What are the names of the employees who hold the position of 'Design Engineer'? */

SELECT FirstName, LastName
FROM Person.Person
WHERE BusinessEntityID IN (
	SELECT BusinessEntityID 
	FROM HumanResources.Employee
	WHERE JobTitle = 'Design Engineer'
	);

SELECT FirstName, LastName
FROM Person.Person AS "P"
INNER JOIN HumanResources.Employee AS "E" ON P.BusinessEntityID = E.BusinessEntityID
AND E.JobTitle = 'Design Engineer';

/* Ex. 34: Find all addresses that are in the state of Alberta, bringing all their information. */

SELECT *
FROM Person.Address AS "PA"
INNER JOIN Person.StateProvince AS "PSP" ON PA.StateProvinceID = PSP.StateProvinceID
WHERE Name = 'Alberta';

SELECT *
FROM Person.Address
WHERE StateProvinceID IN (
	SELECT StateProvinceID
	FROM Person.StateProvince
	WHERE Name = 'Alberta'
	);