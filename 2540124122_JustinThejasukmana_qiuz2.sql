-- no 1

use quiz2

-- no 2
SELECT
	
    transactionheader.TransactionID,
    mscustomer.CustomerName,
    transactionheader.CustomerID,
    transactionheader.StaffID,
    transactionheader.TransactionDate
    
FROM transactionheader
join mscustomer on transactionheader.CustomerID = mscustomer.CustomerID
where mscustomer.CustomerName like '%g%'

-- no 3
SELECT
	
    mscustomer.CustomerName as 'Name',
    mscustomer.CustomerID as 'ID'
    
FROM mscustomer
where mscustomer.CustomerGender like 'Female'

UNION

SELECT

	lower(msstaff.StaffName) as 'Name',
    msstaff.StaffID as 'ID'

FROM msstaff
where msstaff.StaffGender like 'Female'

-- no 4
SELECT
SELECT

	transactionheader.TransactionID,
    transactionheader.CustomerID as 'Id',
    mscustomer.CustomerName as 'Name',
    lower(msnoodle.NoodleName),
    year(transactionheader.TransactionDate)

FROM transactionheader
join mscustomer on transactionheader.CustomerID = mscustomer.CustomerID
join transactiondetail on transactionheader.TransactionID = transactiondetail.TransactionID
join msnoodle on transactiondetail.NoodleID = msnoodle.NoodleID
where msnoodle.NoodleStock > 350

UNION

SELECT

	transactionheader.TransactionID,
    transactionheader.StaffID as 'Id',
    msstaff.StaffName as 'Name',
    upper(msnoodle.NoodleName),
    year(transactionheader.TransactionDate)

FROM transactionheader
join msstaff on transactionheader.StaffID = msstaff.StaffID
join transactiondetail on transactionheader.TransactionID = transactiondetail.TransactionID
join msnoodle on transactiondetail.NoodleID = msnoodle.NoodleID
where locate('Street', msstaff.StaffAddress) > 9

-- no 5
ALTER TABLE mscustomer
add CustomerAge INT,
add CONSTRAINT CHECK(CustomerAge > 7)

-- no 6
START TRANSACTION; 

SELECT * FROM msstaff;

delete msstaff, transactionheader from msstaff inner join transactionheader
where month(transactionheader.TransactionDate) = 9 and
length(msstaff.StaffName) > 14;

SELECT * FROM msstaff;

COMMIT;

-- no 7
SELECT

	transactionheader.TransactionID,
    msstaff.StaffID,
    msstaff.StaffName,
    transactionheader.CustomerID,
    msnoodle.NoodleName,
    transactiondetail.Quantity,
    transactionheader.TransactionDate

FROM transactionheader
join msstaff on transactionheader.StaffID = msstaff.StaffID
join transactiondetail on transactionheader.TransactionID = transactiondetail.TransactionID
join msnoodle on transactiondetail.NoodleID = msnoodle.NoodleID
where msnoodle.NoodleName in('Ramen Noodle', 'Rice Stick Noodle') and datediff('2022-06-01', transactionheader.TransactionDate) <= 120

-- no 8
SELECT
	
    mscustomer.CustomerID,
    concat('Mr./Mrs. ', mscustomer.CustomerName),
    transactionheader.TransactionID

FROM mscustomer
join transactionheader on mscustomer.CustomerID = transactionheader.CustomerID
ORDER BY mscustomer.CustomerID DESC

-- no 9
create view transaction_view as

SELECT

	RIGHT(transactionheader.TransactionID, 3) as 'Transaction ID',
    REPLACE(transactionheader.CustomerID, 'CU', 'Customer ') as 'Customer ID',
    REPLACE(transactionheader.StaffID, 'ST', 'Staff ') as 'Staff ID',
    REPLACE(transactiondetail.NoodleID, 'ND', 'Noodle ') as 'Noodle ID',
    transactiondetail.Quantity,
    transactionheader.TransactionDate

FROM transactionheader
join transactiondetail on transactionheader.TransactionID = transactiondetail.TransactionID

-- no 10
CREATE VIEW male_staff_report as

SELECT

	transactionheader.TransactionID,
    REPLACE(transactionheader.StaffID, 'ST', 'ID ') as 'Staff ID',
    msstaff.StaffName,
    transactionheader.CustomerID,
    mscustomer.CustomerName,
    transactiondetail.NoodleID,
    concat(date_format(transactionheader.TransactionDate, '%D'), ' ', date_format(transactionheader.TransactionDate, '%M'), ' ', date_format(transactionheader.TransactionDate, '%y')) as 'Transaction Date'

FROM transactionheader
join msstaff on transactionheader.StaffID = msstaff.StaffID
join mscustomer on transactionheader.CustomerID = mscustomer.CustomerID
join transactiondetail on transactionheader.TransactionID = transactiondetail.TransactionID
where msstaff.StaffGender like 'Male'