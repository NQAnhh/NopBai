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
	PositionID		TINYINT AUTO_INCREMENT PRIMARY KEY,
    PositionName 	NVARCHAR(50)
);
DROP TABLE IF EXISTS Accounts;
CREATE TABLE Accounts (
	AccountID		SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Email			VARCHAR(50) NOT NULL,
    UserName		CHAR(50) NOT NULL,
    FullName		VARCHAR(50) NOT NULL,
    DepartmentID 	TINYINT NOT NULL,
    PositionID		TINYINT NOT NULL,
    CreateDate		DATE,
    FOREIGN KEY  (DepartmentID) REFERENCES Department (DepartmentID ),
    FOREIGN KEY  (PositionID) REFERENCES Positions (PositionID )
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
    isCorrect		BOOLEAN,
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
        (9, N'Thư kí'		),
        (10, N'Bán hàng'	);
      