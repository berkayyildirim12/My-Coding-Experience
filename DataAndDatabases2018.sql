
--CREATE SCRIPTS

-- Creating the institution table
CREATE TABLE institution_tbl
(
institution_id VARCHAR2(10)NOT NULL,
institution_name VARCHAR2(100)NOT NULL,
institution_address VARCHAR2(500)NOT NULL,
phone_number INT NOT NULL,
PRIMARY KEY(institution_id)
);
COMMIT;
-- Creating the academic table
CREATE TABLE academic_tbl
(
academic_id VARCHAR2(10) NOT NULL,
academic_name VARCHAR2(100)NOT NULL,
academic_surname VARCHAR2(100)NOT NULL,
date_of_birth DATE NOT NULL,
email VARCHAR2(150)NOT NULL,
PRIMARY KEY(academic_id)
);
COMMIT;
-- Creating the article table
CREATE TABLE article_tbl
(
article_id VARCHAR2(10)NOT NULL,
article_name VARCHAR(100)NOT NULL,
submission_date DATE NOT NULL,
number_of_pages INT NOT NULL,
number_of_reference INT NOT NULL,
PRIMARY KEY(article_id)
);
COMMIT;
-- Creating the affiliation table
CREATE TABLE affiliation_tbl
(
fk_institution_id VARCHAR2(10)NOT NULL,
fk_academic_id VARCHAR2(10)NOT NULL,
affiliation_date DATE NOT NULL,
FOREIGN KEY (fk_academic_id) REFERENCES academic_tbl(academic_id),
FOREIGN KEY (fk_institution_id) REFERENCES institution_tbl(institution_id),
PRIMARY KEY (fk_institution_id,fk_academic_id)
);
COMMIT;
-- Creating the review table
CREATE TABLE review_tbl
(
fk_academic_id VARCHAR2(10)NOT NULL,
fk_article_id VARCHAR2(10)NOT NULL,
review_date DATE NOT NULL,
FOREIGN KEY (fk_academic_id) REFERENCES academic_tbl(academic_id),
FOREIGN KEY (fk_article_id) REFERENCES academic_tbl (academic_id),
PRIMARY KEY (fk_academic_id,fk_article_id)
);
COMMIT;
-- Creating the authoring table
CREATE TABLE authoring_tbl
(
fk_academic_id VARCHAR2(10)NOT NULL,
fk_article_id VARCHAR2(10)NOT NULL,
FOREIGN KEY (fk_academic_id) REFERENCES academic_tbl(academic_id),
FOREIGN KEY (fk_article_id) REFERENCES academic_tbl (academic_id),
PRIMARY KEY (fk_academic_id,fk_article_id)
);
COMMIT;
----------------------------------------------------------------------------------------
--INSERT SCRIPTS

-- Inserting data into institution table
INSERT INTO institution_tbl (institution_id,institution_name,institution_address,phone_number) VALUES (1,'Magics','7853 Park Avenue CAMBRIDGE CB78 1LF','01202576847');
INSERT INTO institution_tbl (institution_id,institution_name,institution_address,phone_number) VALUES (2,'Buttons','427 Manchester Road LLANDRINDOD WELLS LD5 2AZ','01202675847');
INSERT INTO institution_tbl (institution_id,institution_name,institution_address,phone_number) VALUES (3,'Smiths','68 Highfield Road STOCKPORT SK88 8RO','01202756476');
INSERT INTO institution_tbl (institution_id,institution_name,institution_address,phone_number) VALUES (4,'Bricks','7174 Alexander Road GALASHIELS TD80 1ZJ','01202295873');
INSERT INTO institution_tbl (institution_id,institution_name,institution_address,phone_number) VALUES (5,'Santas','75 St. John’s Road TAUNTON TA28 4ZH','01202647844');
INSERT INTO institution_tbl (institution_id,institution_name,institution_address,phone_number) VALUES (6,'Captains','40 New Road MILTON KEYNES MK8 5TQ','01202584979');
INSERT INTO institution_tbl (institution_id,institution_name,institution_address,phone_number) VALUES (7,'Wizards','8 Park Lane LUTON LU46 3QE','01202575984');
INSERT INTO institution_tbl (institution_id,institution_name,institution_address,phone_number) VALUES (8,'Yetis','89 Chester Road HUDDERSFIELD HD98 1LI','01202584731');
INSERT INTO institution_tbl (institution_id,institution_name,institution_address,phone_number) VALUES (9,'Pelicans','50 The Green NORTH LONDON N72 4LE','01202354663');
INSERT INTO institution_tbl (institution_id,institution_name,institution_address,phone_number) VALUES (10,'Kings','9723 North Street OXFORD OX0 8GQ','01202584920');
COMMIT;
-- Inserting data into academic table
INSERT INTO academic_tbl (academic_id,academic_name,academic_surname,date_of_birth,email) VALUES (1,'Bernd','Leno',TO_DATE('1994-OCTOBER-21','YYYY/MONTH/DD'),'bleno1@hotmail.co.uk');
INSERT INTO academic_tbl (academic_id,academic_name,academic_surname,date_of_birth,email) VALUES (2,'Hector','Bellerin',TO_DATE('1995-NOVEMBER-26','YYYY/MONTH/DD'),'hbellerin2@hotmail.co.uk');
INSERT INTO academic_tbl (academic_id,academic_name,academic_surname,date_of_birth,email) VALUES (3,'Rob','Holding',TO_DATE('1994-JUNE-16','YYYY/MONTH/DD'),'rholding3@hotmail.co.uk');
INSERT INTO academic_tbl (academic_id,academic_name,academic_surname,date_of_birth,email) VALUES (4,'Sead','Kolasinac',TO_DATE('1993-DECEMBER-15','YYYY/MONTH/DD'),'skolasinac4@hotmail.co.uk');
INSERT INTO academic_tbl (academic_id,academic_name,academic_surname,date_of_birth,email) VALUES (5,'Granit','Xhaka',TO_DATE('1992-JULY-03','YYYY/MONTH/DD'),'gxhaka5@hotmail.co.uk');
INSERT INTO academic_tbl (academic_id,academic_name,academic_surname,date_of_birth,email) VALUES (6,'Lucas','Torreira',TO_DATE('1996-SEPTEMBER-18','YYYY/MONTH/DD'),'ltorreira6@hotmail.co.uk');
INSERT INTO academic_tbl (academic_id,academic_name,academic_surname,date_of_birth,email) VALUES (7,'Alexander','Iwobi',TO_DATE('1994-OCTOBER-17','YYYY/MONTH/DD'),'aiwobi7@hotmail.co.uk');
INSERT INTO academic_tbl (academic_id,academic_name,academic_surname,date_of_birth,email) VALUES (8,'Pierre','Emerrick-Aubameyang',TO_DATE('1989-SEPTEMBER-18','YYYY/MONTH/DD'),'paubameyang8@hotmail.co.uk');
INSERT INTO academic_tbl (academic_id,academic_name,academic_surname,date_of_birth,email) VALUES (9,'Alexandre','Lacazette',TO_DATE('1991-NOVEMBER-09','YYYY/MONTH/DD'),'alacazette9@hotmail.co.uk');
INSERT INTO academic_tbl (academic_id,academic_name,academic_surname,date_of_birth,email) VALUES (10,'Mesut','Ozil',TO_DATE('1988-JANUARY-14','YYYY/MONTH/DD'),'mozil10@hotmail.co.uk');
INSERT INTO academic_tbl (academic_id,academic_name,academic_surname,date_of_birth,email) VALUES (11,'Henrikh','Mkhitaryan',TO_DATE('1988-NOVEMBER-11','YYYY/MONTH/DD'),'hmkhitaryan11@hotmail.co.uk');
INSERT INTO academic_tbl (academic_id,academic_name,academic_surname,date_of_birth,email) VALUES (12,'Matteo','Guendouzi',TO_DATE('1998-FEBRUARY-27','YYYY/MONTH/DD'),'mguendouzi12@hotmail.co.uk');
COMMIT;
-- Inserting data into article table
INSERT INTO article_tbl (article_id,article_name,submission_date,number_of_pages,number_of_reference) VALUES (1,'England',TO_DATE('2017/JANUARY/01','YYYY/MONTH/DD'),'10','15');
INSERT INTO article_tbl (article_id,article_name,submission_date,number_of_pages,number_of_reference) VALUES (2,'Turkey',TO_DATE('2017/FEBRUARY/02','YYYY/MONTH/DD'),'20','25');
INSERT INTO article_tbl (article_id,article_name,submission_date,number_of_pages,number_of_reference) VALUES (3,'Germany',TO_DATE('2017/MARCH/03','YYYY/MONTH/DD'),'30','35');
INSERT INTO article_tbl (article_id,article_name,submission_date,number_of_pages,number_of_reference) VALUES (4,'Spain',TO_DATE('2017/APRIL/04','YYYY/MONTH/DD'),'40','45');
INSERT INTO article_tbl (article_id,article_name,submission_date,number_of_pages,number_of_reference) VALUES (5,'Greece',TO_DATE('2017/MAY/05','YYYY/MONTH/DD'),'50','55');
INSERT INTO article_tbl (article_id,article_name,submission_date,number_of_pages,number_of_reference) VALUES (6,'France',TO_DATE('2017/JUNE/06','YYYY/MONTH/DD'),'60','65');
INSERT INTO article_tbl (article_id,article_name,submission_date,number_of_pages,number_of_reference) VALUES (7,'Gabon',TO_DATE('2017/JULY/07','YYYY/MONTH/DD'),'70','75');
INSERT INTO article_tbl (article_id,article_name,submission_date,number_of_pages,number_of_reference) VALUES (8,'Bosnia',TO_DATE('2017/AUGUST/08','YYYY/MONTH/DD'),'80','85');
INSERT INTO article_tbl (article_id,article_name,submission_date,number_of_pages,number_of_reference) VALUES (9,'Uruguay',TO_DATE('2017/SEPTEMBER/09','YYYY/MONTH/DD'),'90','95');
INSERT INTO article_tbl (article_id,article_name,submission_date,number_of_pages,number_of_reference) VALUES (10,'Switzerland',TO_DATE('2017/OCTOBER/10','YYYY/MONTH/DD'),'100','105');
COMMIT;
-- Inserting data into affiliation table
INSERT INTO affiliation_tbl (fk_academic_id,fk_institution_id,affiliation_date) VALUES (1,1,TO_DATE('2017/JANUARY/01','YYYY/MONTH/DD'));
INSERT INTO affiliation_tbl (fk_academic_id,fk_institution_id,affiliation_date) VALUES (2,2,TO_DATE('2017/FEBRUARY/01','YYYY/MONTH/DD'));
INSERT INTO affiliation_tbl (fk_academic_id,fk_institution_id,affiliation_date) VALUES (2,3,TO_DATE('2017/MARCH/01','YYYY/MONTH/DD'));
INSERT INTO affiliation_tbl (fk_academic_id,fk_institution_id,affiliation_date) VALUES (3,4,TO_DATE('2017/APRIL/01','YYYY/MONTH/DD'));
INSERT INTO affiliation_tbl (fk_academic_id,fk_institution_id,affiliation_date) VALUES (4,5,TO_DATE('2017/MAY/01','YYYY/MONTH/DD'));
INSERT INTO affiliation_tbl (fk_academic_id,fk_institution_id,affiliation_date) VALUES (5,6,TO_DATE('2017/JUNE/01','YYYY/MONTH/DD'));
INSERT INTO affiliation_tbl (fk_academic_id,fk_institution_id,affiliation_date) VALUES (6,7,TO_DATE('2017/JULY/01','YYYY/MONTH/DD'));
INSERT INTO affiliation_tbl (fk_academic_id,fk_institution_id,affiliation_date) VALUES (6,8,TO_DATE('2017/AUGUST/01','YYYY/MONTH/DD'));
INSERT INTO affiliation_tbl (fk_academic_id,fk_institution_id,affiliation_date) VALUES (7,9,TO_DATE('2017/SEPTEMBER/01','YYYY/MONTH/DD'));
INSERT INTO affiliation_tbl (fk_academic_id,fk_institution_id,affiliation_date) VALUES (8,10,TO_DATE('2017/NOVEMBER/01','YYYY/MONTH/DD'));
INSERT INTO affiliation_tbl (fk_academic_id,fk_institution_id,affiliation_date) VALUES (9,10,TO_DATE('2017/DECEMBER/01','YYYY/MONTH/DD'));
INSERT INTO affiliation_tbl (fk_academic_id,fk_institution_id,affiliation_date) VALUES (10,10,TO_DATE('2017/DECEMBER/01','YYYY/MONTH/DD'));
COMMIT;
-- Inserting data into review table
INSERT INTO review_tbl (fk_academic_id,fk_article_id,review_date) VALUES (1,1,TO_DATE('2017/JANUARY/01','YYYY/MONTH/DD'));
INSERT INTO review_tbl (fk_academic_id,fk_article_id,review_date) VALUES (1,2,TO_DATE('2017/FEBRUARY/01','YYYY/MONTH/DD'));
INSERT INTO review_tbl (fk_academic_id,fk_article_id,review_date) VALUES (2,3,TO_DATE('2017/MARCH/01','YYYY/MONTH/DD'));
INSERT INTO review_tbl (fk_academic_id,fk_article_id,review_date) VALUES (3,4,TO_DATE('2017/APRIL/01','YYYY/MONTH/DD'));
INSERT INTO review_tbl (fk_academic_id,fk_article_id,review_date) VALUES (4,5,TO_DATE('2017/MAY/01','YYYY/MONTH/DD'));
INSERT INTO review_tbl (fk_academic_id,fk_article_id,review_date) VALUES (5,6,TO_DATE('2017/JUNE/01','YYYY/MONTH/DD'));
INSERT INTO review_tbl (fk_academic_id,fk_article_id,review_date) VALUES (6,7,TO_DATE('2017/JULY/01','YYYY/MONTH/DD'));
INSERT INTO review_tbl (fk_academic_id,fk_article_id,review_date) VALUES (7,8,TO_DATE('2017/AUGUST/01','YYYY/MONTH/DD'));
INSERT INTO review_tbl (fk_academic_id,fk_article_id,review_date) VALUES (8,9,TO_DATE('2017/SEPTEMBER/01','YYYY/MONTH/DD'));
INSERT INTO review_tbl (fk_academic_id,fk_article_id,review_date) VALUES (9,10,TO_DATE('2017/OCTOBER/01','YYYY/MONTH/DD'));
COMMIT;
-- Inserting data into authoring table
INSERT INTO authoring_tbl (fk_academic_id,fk_article_id) VALUES (1,1);
INSERT INTO authoring_tbl (fk_academic_id,fk_article_id) VALUES (1,2);
INSERT INTO authoring_tbl (fk_academic_id,fk_article_id) VALUES (2,3);
INSERT INTO authoring_tbl (fk_academic_id,fk_article_id) VALUES (3,4);
INSERT INTO authoring_tbl (fk_academic_id,fk_article_id) VALUES (4,5);
INSERT INTO authoring_tbl (fk_academic_id,fk_article_id) VALUES (5,6);
INSERT INTO authoring_tbl (fk_academic_id,fk_article_id) VALUES (6,7);
INSERT INTO authoring_tbl (fk_academic_id,fk_article_id) VALUES (6,8);
INSERT INTO authoring_tbl (fk_academic_id,fk_article_id) VALUES (7,9);
INSERT INTO authoring_tbl (fk_academic_id,fk_article_id) VALUES (8,10);
COMMIT;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--DROP SCRIPT

-- Drops all the tables
DROP TABLE article_tbl;
DROP TABLE affiliation_tbl;
DROP TABLE review_tbl;
DROP TABLE authoring_tbl;
DROP TABLE institution_tbl;
DROP TABLE academic_tbl;
COMMIT;
--------------------------------------------------
--SELECT SCRIPT

--Query 1
SELECT academic_id, academic_name FROM academic_tbl;
COMMIT;
--Query 2
SELECT academic_name, academic_surname, institution_name
FROM academic_tbl,institution_tbl,affiliation_tbl
WHERE academic_tbl.academic_id = affiliation_tbl.fk_academic_id 
AND institution_tbl.institution_id = affiliation_tbl.fk_institution_id;
COMMIT;
--Query 3
SELECT institution_name, COUNT (academic_tbl.academic_id)
FROM institution_tbl,academic_tbl,affiliation_tbl
WHERE academic_tbl.academic_id = affiliation_tbl.fk_academic_id
AND institution_tbl.institution_id=affiliation_tbl.fk_institution_id
GROUP BY institution_name;
COMMIT;
--Query 4
SELECT academic_tbl.academic_id, institution_tbl.institution_name
FROM academic_tbl,affiliation_tbl, institution_tbl
WHERE institution_tbl.institution_id=affiliation_tbl.fk_institution_id
AND affiliation_tbl.fk_academic_id=academic_tbl.academic_id
AND academic_tbl.academic_id=(SELECT academic_id FROM (
SELECT academic_tbl.academic_id, COUNT(review_tbl.fk_academic_id) review_counter
FROM academic_tbl,review_tbl
WHERE academic_tbl.academic_id=review_tbl.fk_academic_id
GROUP BY academic_tbl.academic_id
ORDER BY review_counter desc
) WHERE rownum=1);

COMMIT;