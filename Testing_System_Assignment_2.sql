DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_2;
USE Testing_System_Assignment_2;

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
    Duration		TIME,
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
        (9, N'Thư kí'		);
        
INSERT INTO Positions (PositionID, PositionName)
VALUES
	(1, 'Marketing'),
    (2, 'DEV'),
    (3, 'SC'),
    (4, 'PM'),
    (5, 'Test');
    
INSERT INTO Accounts (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate)
VALUES
	(1, 'abc@gmail.com', 'Huu', 'Nguyen Dinh Huu', 1, '2', '2023/02/23' ),
    (2, 'dgh@gmail.com', 'Huyen', 'Nguyen Thi Huyen', 2, '5', '2023/10/15'),
    (3, 'qwe@gmail.com', 'Ha', 'Ho Huu Ha', 3, '3', '2023/07/08'),
    (4, 'rty@gmail.com', 'Van', 'Le Thi Van', 4, '4', '2023/07/11'),
    (5, 'qac@gmail.com', 'Khoa', 'Dinh Van Khoa', 5, '5', '2023/12/13');
    
INSERT INTO GroupTable (GroupID, GroupName, CreatorID, CreateDate)
VALUES
	(123, 'ABC', '1234', '2023/08/24'),
	(234, 'BCD', '2345', '2023/09/10'),
	(456, 'EFG', '3456', '2023/10/22'),
	(567, 'CVB', '4567', '2023/12/23'),
	(789, 'JKL', '6789', '2023/03/05');

INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
VALUES
	(123, '1', '2023/10/27'),
    (456, '4', '2023/09/22'),
    (789, '5', '2023/02/02'),
    (765, '3', '2022/11/01'),
    (543, '2', '2023/09/20');
    
    
INSERT INTO TypeQuestion (TypeID, TypeName)
VALUES
	(01,'ABC'),
    (02, 'BCD'),
    (03, 'EFG'),
    (04, 'GHT'),
    (05, 'YJK');
    
INSERT INTO CategoryQuestion (CategoryID, CategoryName)
VALUES
	(1, 'Java'),
    (2, 'Net'),
    (3, 'PHP'),
    (4, 'Ruby'),
    (5, 'SQL');
    
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
	(1, 101, 'HK1', 1, '12:30:45', 3, '2023/07/24'),
    (2, 102, 'HK2', 2, '08:45:30', 1, '2023/06/27'),
    (3, 103, 'HK1A', 3, '09:15:10', 2, '2023/12/06'),
    (4, 104, 'HK1B', 4, '10:20:20', 5, '2023/01/30'),
    (5, 105, 'HK2A', 5, '07:50:30', 4, '2023/02/13');

INSERT INTO ExamQuestion (ExamID, QuestionID)
VALUES
	(2, 3),
    (3, 5),
    (1, 4),
    (2, 5),
    (3, 5);
