CREATE TABLE Facility (
 FacilityId INTEGER GENERATED ALWAYS AS IDENTITY,
 Name VARCHAR(100) NOT NULL,
 City VARCHAR(100) NOT NULL,
 PRIMARY KEY (FacilityId)
);


CREATE TABLE Patient (
 PatientId INT GENERATED ALWAYS AS IDENTITY,
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL, 
 Age INTEGER NOT NULL,
 PRIMARY KEY (PatientId)
);

CREATE TABLE Payer (
 PayerId INTEGER GENERATED ALWAYS AS IDENTITY,
 Name VARCHAR(100) NOT NULL,
 City VARCHAR(100) NOT NULL,
 PRIMARY KEY (PayerId)
);

CREATE TABLE Encounter
(
    EncounterId INTEGER GENERATED ALWAYS AS IDENTITY,
    FacilityId INTEGER NOT NULL,
    PatientId INTEGER NOT NULL,
    PayerId INTEGER NOT NULL,
    PRIMARY KEY (EncounterId),
	FOREIGN KEY (FacilityId) REFERENCES Facility (FacilityId),
	FOREIGN KEY (PatientId) REFERENCES Patient (PatientId),
	FOREIGN KEY (PayerId) REFERENCES Payer (PayerId)
);


INSERT INTO facility(name, city) values('StarMedica','CDMX');
INSERT INTO facility(name, city) values('San Jose','Satelite');
INSERT INTO facility(name, city) values('Imagen','Oaxaca');
INSERT INTO facility(name, city) values('Dalinde','CDMX');
INSERT INTO facility(name, city) values('IstmoMedic','Oaxaca');

INSERT INTO patient(firstname, lastname, age) values('Leticia','Gonzalez',37);
INSERT INTO patient(firstname, lastname, age) values('Jorge','Flores',25);
INSERT INTO patient(firstname, lastname, age) values('Rosa','Perez',10);
INSERT INTO patient(firstname, lastname, age) values('Milton','Torres',38);
INSERT INTO patient(firstname, lastname, age) values('Tomasa','Flores',69);

INSERT INTO payer(name, city) values('ATLAS','CDMX');
INSERT INTO payer(name, city) values('METLIFE','GDL');
INSERT INTO payer(name, city) values('GNP','CDMX');
INSERT INTO payer(name, city) values('AXXA','Monterrey');
INSERT INTO payer(name, city) values('Inbursa','CDMX');

INSERT INTO encounter(facilityid, patientid, payerid) values(1,1,2);
INSERT INTO encounter(facilityid, patientid, payerid) values(1,1,1);
INSERT INTO encounter(facilityid, patientid, payerid) values(2,1,1);
INSERT INTO encounter(facilityid, patientid, payerid) values(1,2,4);
INSERT INTO encounter(facilityid, patientid, payerid) values(1,3,2);
INSERT INTO encounter(facilityid, patientid, payerid) values(2,2,4);
INSERT INTO encounter(facilityid, patientid, payerid) values(2,3,5);
INSERT INTO encounter(facilityid, patientid, payerid) values(4,4,3);
INSERT INTO encounter(facilityid, patientid, payerid) values(2,5,5);
INSERT INTO encounter(facilityid, patientid, payerid) values(5,5,1);
INSERT INTO encounter(facilityid, patientid, payerid) values(3,5,5);


CREATE FUNCTION GetPatients()
RETURNS TABLE (PatientName VARCHAR(200), city VARCHAR(100), Category CHARACTER(2), encounters INTEGER)
AS $$
 
	  SELECT   b.firstname || ', ' || b.lastname PatientName, string_agg(distinct c.city,',') city , case when b.age < 16 then 'A' else 'B' end AS Category, cp.encounters
		from 		encounter 	a
		inner JOIN 	patient 	b	on	a.patientid = b.patientid
		inner join 	facility	c	on	a.facilityid = c.facilityid
		inner JOIN 	(select e.patientid, count(*) encounters 
						from encounter 	e
						JOIN payer 		p ON e.payerid = p.payerid
						group by e.patientid
						having count (distinct p.city) > 1) cp on a.patientid = cp.patientid
		group by b.firstname, b.lastname, b.age, cp.encounters
		order by cp.encounters

$$ LANGUAGE sql;

