Open MySQL Command line and run these commands:-

create database kuldeepdb;

create table admregis(Username varchar(30),Name varchar(30),Password varchar(30),Contact varchar(10),Email varchar(30),City varchar(20),Gender varchar(20),DOB varchar(30));

create table courses(course_name varchar(30),min varchar(5),sec varchar(5));

create table question(Question_id varchar(3),question varchar(1000),option1 varchar(300),option2 varchar(300),option3 varchar(300),option4 varchar(300),correct_option varchar(3),subject varchar(50));create table question(Question_id varchar(3),question varchar(1000),option1 varchar(300),option2 varchar(300),option3 varchar(300),option4 varchar(300),correct_option varchar(3),subject varchar(50));

create table regis(Username varchar(30),Name varchar(30),Password varchar(30),Contact varchar(10),Email varchar(30),City varchar(20),Gender varchar(20),DOB varchar(30),verify varchar(3));

create table result(username varchar(30),T_marks varchar(10),fmarks varchar(10),fright varchar(10),fwrong varchar(10),result varchar(10),subject varchar(30));

create table studata(Roll varchar(20),UName varchar(20),UPass varchar(20),Contact varchar(10),Email varchar(30),Institute varchar(20),City varchar(20),Gender varchar(20));

create table users(Name varchar(20),Email varchar(30),Contact varchar(10),city varchar(20),address varchar(50),pass varchar(20),username varchar(30));