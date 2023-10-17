DROP DATABASE IF EXISTS Testing_System_Assignment_4;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_4;
USE Testing_System_Assignment_4;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	DepartmentID 	TINYINT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName  NVARCHAR(50)
);
DROP TABLE IF EXISTS Positions;
CREATE TABLE Positions (
	PositionID		INT AUTO_INCREMENT PRIMARY KEY,
    PositionName 	NVARCHAR(50)
);
DROP TABLE IF EXISTS Accounts;
CREATE TABLE Accounts (
	AccountID		SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Email			VARCHAR(50) NOT NULL,
    UserName		CHAR(50) NOT NULL,
    FullName		VARCHAR(50) NOT NULL,
    DepartmentID 	TINYINT,
    PositionID		INT,
    CreateDate		DATE,
    FOREIGN KEY  (DepartmentID) REFERENCES Department (DepartmentID ),
    FOREIGN KEY  (PositionID) REFERENCES Positions (PositionID)
);
DROP TABLE IF EXISTS GroupTable;
CREATE TABLE GroupTable 
(
	GroupID 		SMALLINT AUTO_INCREMENT PRIMARY KEY,
	GroupName 		VARCHAR(50),
    CreatorID		SMALLINT,
    CreateDate		DATE
);
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount 
(
	GroupID 		SMALLINT,
    AccountID		INT,
    JoinDate		DATE
);
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion
(
	TypeID			TINYINT AUTO_INCREMENT PRIMARY KEY,
    TypeName		VARCHAR(50)
);
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion
(
	CategoryID		TINYINT AUTO_INCREMENT PRIMARY KEY,
    CategoryName	VARCHAR(50)
);
DROP TABLE IF EXISTS Question;
CREATE TABLE Question
(
	QuestionID		SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Content 		VARCHAR(50),
    CategoryID		TINYINT NOT NULL,
    TypeID			INT,
    CreatorID		SMALLINT,
    CreateDate		DATE,
    FOREIGN KEY  (CategoryID) REFERENCES CategoryQuestion (CategoryID )
);
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer
(
	AnswerID		SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Content			VARCHAR(50),
    QuestionID		SMALLINT NOT NULL,
    isCorrect		ENUM ('true','false'),
    FOREIGN KEY  (QuestionID) REFERENCES Question (QuestionID )
);
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam 
(
	ExamID			SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Code			VARCHAR(50),
    Title			VARCHAR(100),
    CategoryID		TINYINT NOT NULL,
    Duration		INT,
    CreatorID		SMALLINT,
    CreateDate		DATE,
    FOREIGN KEY  (CategoryID) REFERENCES CategoryQuestion (CategoryID )
);
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion
(
	ExamID			SMALLINT NOT NULL,
    QuestionID		SMALLINT NOT NULL,
    FOREIGN KEY  (ExamID) REFERENCES Exam (ExamID),
    FOREIGN KEY  (QuestionID) REFERENCES Question (QuestionID)
);

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES 
		(1, N'Marketing'	),
        (2, N'Sale'			),
        (3, N'Bảo vệ'		),
        (4, N'Nhân sự'		),
        (5, N'Kỹ thuật'		),
        (6, N'Tài chính'	),
        (7, N'Phó giám đốc'	),
        (8, N'Giám đốc'		),
        (9, N'Thư kí'		),
        (10, N'Chăm sóc khác hàng');
        
INSERT INTO Positions (PositionID, PositionName)
VALUES
	(1, N'Marketing'),
    (2, N'DEV'),
    (3, N'SC'),
    (4, N'PM'),
    (5, N'Tester'),
    (6, N'Devoloper'),
	(7, N'Team leader'),
	(8, N'CEO'),
	(9, N'Scrum master'),
	(10, N'PM');
    
INSERT INTO Accounts (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate)
VALUES
	(1, 'abc@gmail.com', 'Huu', 'Nguyen Dinh Huu', 1, '2', '2023/02/23' ),
    (2, 'dgh@gmail.com', 'Huyen', 'Nguyen Thi Huyen', 2, '5', '2023/10/15'),
    (3, 'qwe@gmail.com', 'Ha', 'Ho Huu Ha', 3, '3', '2023/07/08'),
    (4, 'rty@gmail.com', 'Van', 'Le Thi Van', 4, '4', '2023/07/11'),
    (5, 'qac@gmail.com', 'Khoa', 'Dinh Van Khoa', 5, '5', '2023/12/13'),
    (6, 'huyhung1190@gmail.com', 'huyhung1190', N'Nguyen Huy Hung', 6, 1, '2018-11-20'),
	(7, 'nguyenthao2552@gmail.com', 'nguyenthao2552', N'Nguyen Thi Thao', 1, 3, '2023/05/15'),
	(8, 'doduc301188@gmail.com', 'doduc301188', N'Do Van Duc', 9, 7, '2019/06/20'),
	(9, 'hovan0908@gmail.com', 'hovan0908', N'Ho Hoai Van', 7, 6, '2020/09/22'),
	(10, 'vannanh2204@gmail.com', 'vannanh2204', N'Mai Van Anh', 8, 4, '2018/04/22');

    
INSERT INTO GroupTable (GroupID, GroupName, CreatorID, CreateDate)
VALUES
	(1, 'Group 1', 1, '2023/09/22'),
	(2, 'Group 2', 2, '2023/01/09'),
	(3, 'Group 3', 3, '2023/06/19'),
	(4, 'Group 4', 4, '2023/08/30'),
	(5, 'Group 5', 5, '2023/05/06'),
	(6, 'Group 6', 6, '2023/07/15'),
	(7, 'Group 7', 7, '2023/02/19'),
	(8, 'Group 8', 8, '2023/04/28'),
	(9, 'Group 9', 9, '2023/03/25'),
	(10, 'Group 10', 10, '2023/10/10');

INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
VALUES
			(1, 1, '2023/09/26'),
            (2, 6, '2023/05/26'),
            (6, 3, '2023/08/20'),
            (2, 7, '2023/04/25'),
            (1, 9, '2023/10/01'),
            (2, 7, '2023/03/25'),
            (9, 8, '2023/08/15'),
            (7, 5, '2023/05/19'),
            (8, 4, '2023/07/16'),
            (2, 2, '2023/06/20');

    
    
INSERT INTO TypeQuestion (TypeID, TypeName)
VALUES
	(1, "Type 1"),
	(2, "Type 2"),
	(3, "Type 3"),
	(4, "Type 4"),
	(5, "Type 5"),
	(6, "Type 6"),
	(7, "Type 7"),
	(8, "Type 8"),
	(9, "Type 9"),
	(10, "Type 10");
    
INSERT INTO CategoryQuestion (CategoryID, CategoryName)
VALUES
	(1, 'ABC'),
    (2, 'XYZ'),
    (3, 'DGH'),
    (4, 'POS'),
    (5, 'IUO'),
    (6, 'ABC'),
    (7, 'Net'),
    (8, 'ABC'),
    (9, 'XYZ'),
    (10, 'ABC');
    
    
INSERT INTO Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES	
    (1, 'ADFDSDV', 2, 01, 1, '2023/06/27'),
    (2, 'DSGSFHF', 5, 02, 4, '2023/02/13'),
    (3, 'OUHOUYU', 1, 04, 3, '2023/07/24'),
    (4, 'WRTRETR', 3, 05, 2, '2023/12/06'),
    (5, 'XVBCBVG', 4, 03, 5, '2023/01/30');
    
INSERT INTO Answer (AnswerID, Content, QuestionID, isCorrect)
VALUES
	(1, 'KLAIWNT', 5, 'TRUE'),
    (2, 'BSHUWGR', 4, 'FALSE'),
    (3, 'OURHUWN', 3, 'TRUE'),
    (4, 'AUQNHAD', 2,'TRUE'),
    (5, 'RHTEDJH', 1, 'FALSE');
    
INSERT INTO Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES
	(1, 101, 'HK1', 1, '120', 3, '2023/07/24'),
    (2, 102, 'HK2', 2, '60', 1, '2023/06/27'),
    (3, 103, 'HK1A', 3, '90', 2, '2023/12/06'),
    (4, 104, 'HK1B', 4, '120', 5, '2023/01/30'),
    (5, 105, 'HK2A', 5, '90', 4, '2023/02/13');

INSERT INTO ExamQuestion (ExamID, QuestionID)
VALUES
	(2, 3),
    (3, 5),
    (1, 4),
    (2, 5),
    (3, 5),
    (4, 5),
    (5, 3),
    (1, 5),
    (1, 1),
    (2, 2);

select * from accounts
JOIN department 
ON accounts.DepartmentID = department.DepartmentID
UNION
SELECT * FROM accounts a
JOIN department d
ON a.DepartmentID = d.DepartmentID
WHERE CreateDate > '2010/12/20';


SELECT * FROM accounts a
JOIN department d
ON a.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = N'Developer';


SELECT d.DepartmentName, COUNT(a.AccountID) as NumberOfOders
FROM Department d
JOIN Accounts a ON d.DepartmentID = a.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(a.AccountID) >= 1;

SELECT q.QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate, COUNT(ExamID) AS NUM_USED
FROM Question q
JOIN ExamQuestion eq ON q.QuestionID = eq.QuestionID
GROUP BY q.QuestionID
HAVING NUM_USED = (SELECT MAX(NUM_USED) 
				   FROM (SELECT COUNT(ExamID) AS NUM_USED
						 FROM Question q
                         JOIN ExamQuestion eq ON q.QuestionID = eq.QuestionID
                         GROUP BY q.QuestionID) AS Table_q5);




















