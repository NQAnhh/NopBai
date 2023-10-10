create database Testing_System_Assignment_1;
use Testing_System_Assignment_1;

create table Department (
	DepartmentID 	int,
    DepartmentName  varchar(50)
);
create table Positions (
	PositionID		int,
    PositionName 	varchar(50)
);
create table Accounts (
	AccountID		int,
    Email			varchar(50),
    UserName		varchar(50),
    FullName		varchar(50),
    DepartmentID 	int,
    PositionID		int,
    CreateDate		date
)