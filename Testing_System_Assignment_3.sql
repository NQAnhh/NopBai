DROP DATABASE IF EXISTS Fresher_Training_Management;
CREATE DATABASE Fresher_Training_Management;
USE Fresher_Training_Management;

DROP TABLE IF EXISTS Trainees;
CREATE TABLE 	Trainees
(
				TraineeID TINYINT AUTO_INCREMENT PRIMARY KEY,
                Full_Name NVARCHAR(30) NOT NULL,
                Birth_Date DATE,
                Gender ENUM ('male', 'female', 'unknown'),
                ET_IQ INT CHECK (ET_IQ >= 0 AND ET_IQ <=20) NOT NULL,
                ET_GMath INT CHECK (ET_GMath >= 0 AND ET_GMath <=20) NOT NULL,
                ET_English INT CHECK (ET_English >= 0 AND ET_English <=50) NOT NULL,
                Training_Class NVARCHAR(5) NOT NULL,
                Evaluation_Note NVARCHAR(10) NOT NULL,
                VTI_Account NVARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO Trainees 
VALUES
			(1, 'Nguyen Huy Hung', '1990/01/01', 'male', 19, 12, 34, '1', 'Passed', 'huyhung1190'),
            (2, 'Nguyen Thi Thao', '2002/05/25', 'female', 13, 15, 29, '2', 'Passed', 'nguyenthao2552'),
            (3, 'Ho Phong Phu', '2002/09/22', 'male', 20, 11, 48, 'OUTE3', 'Passed', 'hophongphu2292'),
            (4, 'Do Van Duc', '1988/11/30', 'male', 11, 16, 37, '3', 'Failed', 'doduc301188'),
            (5, 'Nguyen Trung Huan', '1978/09/25', 'male', 15, 16, 22, '1', 'Failed', 'huannguyen2509'),
            (6, 'Dinh Cong Hieu', '1996/04/26', 'unknown', 16, 19, 35, 'POSS1', 'Failed', 'hieucong2604'),
            (7, 'Tran Mai Anh', '1991/06/09', 'female', 10, 18, 22, '2', 'Failed', 'anhtran0906'),
            (8, 'Ho Hoai Van', '1995/09/08', 'unknown', 20, 9, 50, '1', 'Failed', 'hovan0908'),
            (9, 'Dang Duc Lam', '2000/10/12', 'male', 14, 11, 49, '4', 'Passed', 'kamdang1210'),
            (10, 'Mai Van Anh', '2010/04/22', 'female', 9, 2, 36, '2', 'Failed', 'vannanh2204');

SELECT Month(Birth_Date), COUNT(Evaluation_Note) FROM Trainees
WHERE Evaluation_Note = 'Passed'
GROUP BY Month(Birth_Date);

SELECT *, LENGTH(Full_Name) AS Lenght_Name FROM Trainees
ORDER BY Lenght_Name DESC
LIMIT 1;

SELECT * FROM Trainees
WHERE (ET_IQ + ET_Gmath >= 20) AND (ET_IQ >= 8) AND (ET_Gmath >= 8) AND (ET_English >= 18);

DELETE FROM Trainees
WHERE TraineeID = 3;

UPDATE Trainees
SET Training_Class = '2'
WHERE TraineeID = 5;