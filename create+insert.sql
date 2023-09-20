CREATE TABLE msstaff(
	StaffID CHAR(5) PRIMARY KEY,
	StaffName VARCHAR(50),
	StaffDOB DATE,
	StaffEmail VARCHAR(50),
	StaffSalary INT,
	StaffGender VARCHAR(6),
	StaffAddress VARCHAR(100)
);

CREATE TABLE msnoodle(
	NoodleID CHAR(5) PRIMARY KEY,
	NoodleName VARCHAR(50),
	NoodlePrice INT,
	NoodleStock INT
);

CREATE TABLE mscustomer(
	CustomerID CHAR(5) PRIMARY KEY,
	CustomerName VARCHAR(50),
	CustomerDOB DATE,
	CustomerEmail VARCHAR(50),
	CustomerGender VARCHAR(6),
	CustomerAddress VARCHAR(100)
);

CREATE TABLE transactionheader(
	TransactionID CHAR(5) PRIMARY KEY,
	StaffID CHAR(5),
	CustomerID CHAR(5),
	TransactionDate DATE,
	FOREIGN KEY (StaffID) REFERENCES MsStaff (StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (CustomerID) REFERENCES MsCustomer (CustomerID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE transactiondetail(
	TransactionID CHAR(5),
	NoodleID CHAR(5),
	Quantity INT,
	PRIMARY KEY (TransactionID, NoodleID),
	FOREIGN KEY (TransactionID) REFERENCES transactionheader (TransactionID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (NoodleID) REFERENCES msnoodle (NoodleID) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO msstaff VALUES 
('ST001','Gratia Sen','1995-02-03','gratia.sen@gmail.com',10000000,'Female','Anggrek Street'),
('ST002','Beta Lestari','1997-04-01','beta.lestari@gmail.com',8000000,'Female','Kemanggisan Street'),
('ST003','Charlie Danaristo','1989-07-16','charlie.danaristo@gmail.com',7500000,'Male', 'Mandala Street'),
('ST004','Delta Daniella','1998-12-22','delta.daniella@gmail.com',12000000,'Female','Central Street'),
('ST005','Jevon Riyadi','1985-10-17','jevon.riyadi@gmail.com',15000000,'Male','Mandala Street'),
('ST006','Golden Josua','1988-03-13','golden.josua@gmail.com',9000000,'Male','Nine Street'),
('ST007','Lionel Setiawan','1999-08-15','lionel.setiawan@gmail.com',6000000,'Male','Sudirman Street'),
('ST008','Hans Luckianto','1993-06-02','hans.luckianto',12000000,'Male','Square Street'),
('ST009','Josafat Gustianto','1987-01-21','josafat.gustianto@gmail.com', 13500000, 'Male','Kebayoran Street'),
('ST010','Boediman Raine','1990-08-26', 'boediman.raine@gmail.com', 14500000,'Male','Greenville Street');

INSERT INTO mscustomer VALUES 
('CU001','Jason Hermanliansyah','1995-07-05','jason@gmail.com','Male','Cengkareng Street'),
('CU002','Rico Huangtara','2003-07-30','rico@gmail.com','Male','Djakarta Street'),
('CU003','Kevin Gunawan','2007-02-03','kevin@gmail.com','Male','Kuningan Street'),
('CU004','Holyvia Gabriella','1999-02-28','holyvia@gmail.com','Female','Season Street'),
('CU005','Albert Adriel','2001-07-13','adriel@gmail.com','Male','Setiabudi Street'),
('CU006','Jason Gabriel','1997-02-03','albert@gmail.com','Male','Tebet Street'),
('CU007','Erin Wilanata','1990-07-09','erin@gmail.com','Female','Palma Street'),
('CU008','Yennifer Alfianda','1980-01-12','yennifer@gmail.com','Female','Serpong Street'),
('CU009','Alexander Reynaldi ','2003-08-21','alexander@gmail.com','Male','Pluit Street'),
('CU010','Shelly Kumala','2005-06-23','shelly@gmail.com','Female','Setiabudi Street');

INSERT INTO msnoodle VALUES 
('ND001','Ramen Noodle', 20000,250),
('ND002','Soba Noodle', 22000,500),
('ND003','Shoyu Noodle', 25000,350),
('ND004','Udon Noodle', 18000,830),
('ND005','Shirataki Noodle', 17000,210),
('ND006','Somen Noodle', 20000,460),
('ND007','Harusame Noodle', 21000,640),
('ND008','Egg Noodle', 22000,250),
('ND009','Rice Stick Noodle', 24000,320),
('ND010','Ho Fun Noodle', 19000,270);

INSERT INTO transactionheader VALUES
('TR001','ST001','CU010', '2021-09-03'),
('TR002','ST002','CU009', '2022-07-30'),
('TR003','ST003','CU008', '2022-08-17'),
('TR004','ST004','CU007', '2021-05-04'),
('TR005','ST005','CU006', '2019-06-09'),
('TR006','ST006','CU005', '2021-04-15'),
('TR007','ST007','CU004', '2022-09-27'),
('TR008','ST008','CU003', '2020-09-18'),
('TR009','ST009','CU002', '2022-02-14'),
('TR010','ST010','CU001', '2020-01-24'),
('TR011','ST004','CU003', '2022-06-28'),
('TR012','ST008','CU006', '2022-03-11'),
('TR013','ST009','CU009', '2022-05-03'),
('TR014','ST006','CU008', '2021-12-02'),
('TR015','ST003','CU004', '2020-11-07');

INSERT INTO transactiondetail VALUES
('TR001','ND001', 200),
('TR002','ND002', 300),
('TR003','ND003', 250),
('TR004','ND004', 170),
('TR005','ND005', 380),
('TR006','ND006', 700),
('TR007','ND007', 540),
('TR008','ND008', 730),
('TR009','ND009', 460),
('TR010','ND010', 320),
('TR001','ND003', 400),
('TR002','ND004', 500),
('TR003','ND005', 350),
('TR004','ND006', 370),
('TR005','ND007', 680),
('TR006','ND008', 420),
('TR007','ND009', 530),
('TR008','ND010', 710),
('TR009','ND001', 230),
('TR010','ND002', 310),
('TR011','ND010', 380),
('TR012','ND009', 620),
('TR013','ND008', 730),
('TR014','ND007', 410),
('TR015','ND006', 530);
