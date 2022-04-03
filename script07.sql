-- Replace zk1 with your NetID

-- execute data setup script
@dataSetupScript07.sql

spool spool07.txt

PROMPT jz4721
/*

YOU START YOUR ANSWERS AFTER THE END OF THIS COMMENT BLOCK

ANSWER0 is an example to show you the structure of what you need to produce, unless instructed otherwise in the assignment. Please read carefully what you are asked to do.

Insert your solution for ANSWERX between the string -- ANSWERX and the string PROMPT ANSWERX

You DO NOT have to run the "spool on" comand yourself. This script file does that for you.

The spool07.txt file generated when you run this script will be a part of your submission.

*/

-- Answer 0 represents a sample quert that uses the temp table TEMP0 just to demonstrate the usage of temp table.
-- ANSWER0
CREATE TABLE TEMP0
AS SELECT *
FROM DOG;

CREATE TABLE ANSWER0
AS SELECT DISTINCT Breed
FROM TEMP0
ORDER BY Breed DESC;


PROMPT ANSWER0
SELECT * FROM ANSWER0;


-- ANSWER1
CREATE TABLE ANSWER1
AS SELECT DISTINCT S.NNumber AS NNumber,D.SerialNumber AS SerialNumber,S.Deposit/ D.Price AS DepositPriceRatio
FROM STUDENT S,DOG D
WHERE (S.Deposit / D.Price) > 2.0 AND S.NNumber = D.NNumber
UNION
SELECT DISTINCT S.NNumber AS NNumber,D.SerialNumber AS SerialNumber,S.Deposit/ D.Price AS DepositPriceRatio
FROM STUDENT S,DOG D
WHERE S.NetID IS NULL
ORDER BY NNumber ASC,SerialNumber ASC,DepositPriceRatio ASC;


PROMPT ANSWER1
SELECT * FROM ANSWER1;

-- ANSWER2
CREATE TABLE TEMP1
AS SELECT NNumber,count(*) AS Count 
FROM DOG 
GROUP BY NNumber 
HAVING Count > 3

CREATE TABLE ANSWER2
AS SELECT DISTINCT NNumber
FROM STUDENT
WHERE Deposit >= 100;
UNION 
SELECT NNumber
FROM TEMP1
ORDER BY NNumber ASC;

PROMPT ANSWER2
SELECT * FROM ANSWER2;

-- ANSWER3
CREATE TABLE ANSWER3
AS SELECT DISTINCT NNumber
FROM DOG D1,DOG D2,DOG D3
WHERE D1.NNumber = D2.NNumber AND D2.NNumber = D3.NNumber
AND D1.Breed = 'Beagle' AND D2.Breed = 'Bulldog' AND D3.Breed = 'Poodle'
ORDER BY NNumber ASC;

PROMPT ANSWER3
SELECT * FROM ANSWER3;

-- ANSWER4
DELETE FROM STUDENT WHERE NNumber = '7';

CREATE TABLE ANSWER4
AS SELECT * 
FROM STUDENT;

PROMPT ANSWER4
SELECT * FROM ANSWER4;

-- ANSWER5
DELETE FROM DOG WHERE SerialNumber = '2005';
UPDATE STUDENT SET Deposit=Deposit-5 WHERE NNumber = '6';

PROMPT ANSWER5
SELECT * FROM STUDENT;

-- ANSWER6
UPDATE DOG SET Breed='Poodle' WHERE SerialNumber = '3';

PROMPT ANSWER6
SELECT * FROM STUDENT;
SELECT * FROM DOG;

-- ANSWER7
INSERT INTO  STUDENT (NNumber,Deposit,NetID)
VALUES ('2502', 50, NULL);

PROMPT ANSWER7
SELECT * FROM DOG;

-- ANSWER8
INSERT INTO  STUDENT (NNumber,Deposit,NetID)
VALUES ('2503', 50, 'aa1');

PROMPT ANSWER8
SELECT * FROM STUDENT;

-- ANSWER9
PROMPT ANSWER9
/*
Write your solution below. No need to create table like previous questions. Just SELECT ..
*/
SELECT DISTINCT A, B
FROM R
LEFT OUTER JOIN S
ON R.A = S.C AND R.B = S.D
WHERE C IS NULL AND D IS NULL
ORDER BY A ASC, B ASC;