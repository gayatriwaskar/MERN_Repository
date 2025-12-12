create database proj_user;
use proj_user;

create table Users(
email varchar(50) primary key,
password varchar(40),
role enum("student","admin")
);

create table Course(
course_id int primary key,
course_name varchar(40),
desp varchar(50),
fees int,
start_date date,
end_date date,
video_expire_days int);

create table Student(
reg_no int,
name varchar(40),
email varchar(50),
course_id int,
mobile_no int,
profile_pic blob,
constraint course_id_fk foreign key(course_id) references Course(course_id),
constraint email_fk foreign key(email) references Users(email));

create table Video(
video_id int primary key,
course_id int,
title varchar(40),
description varchar(40),
youtube_url varchar(60),
added_at date,
constraint courseid_fk foreign key(course_id) references Course(course_id)
);

insert into Users values
("anil@gmail.com","anil123","student"),
("sunil@gmail.com","sunil12","admin"),
("ram@gmail.com","ram78","student"),
("sita@gmail.com","sita123","admin");
select * from Users;

insert  into Course values
(1,"MERN","Advanced",4000,"2025-12-10","2025-12-05",20),
(2,"Java","Intermediate",4000,"2025-12-11","2025-01-06",21),
(3,"Python","Advanced",4500,"2025-12-15","2025-01-15",22),
(4,"Gen AI","Intermediate",5000,"2025-12-12","2025-01-15",25);
select * from Course;

insert into Student values
(101,"Ram","ram@gmail.com",1,123,"D:\Gayatri (1)\image\c1 (1).jpeg"),
(102,"Anil","anil@gmail.com",3,901,"D:\Gayatri (1)\image\f2 (1).jpg");
select * from Student;

insert into Video values
(201,1,"mern","full-video","https://youtu.be/F9gB5b4jgOI?si=ci0J1xu3PCXqA09R","2025-11-06"),
(202,2,"java lect","in_one_shot","https://youtu.be/UmnCZ7-9yDY?si=pgBC9xYgnm2HMz5f","2025-12-10"),
(203,3,"python lect","in_one_shot","https://youtu.be/ERCMXc8x7mc?si=_5Nl7xQpl0a0Jypb","2025-11-16"),
(204,4,"gen ai lect","in_one_shot","https://youtu.be/d4yCWBGFCEs?si=mwh2zk9Gqq1Wqp8W","2025-01-17");
select * from Video;

-- Q1
select * from Course;

-- Q2
select s.reg_no,s.name,s.email,s.mobile_no,c.course_id,c.course_name
from Student s
inner join Course c on s.course_id=c.course_id;

-- Q3
select s.reg_no,s.name,s.email,s.mobile_no,c.course_id,c.course_name,c.desp,c.fees,c.start_date,c.end_date,c.video_expire_days
from Student s
inner join Course c on s.course_id=c.course_id
where s.email="anil@gmail.com";

-- Q4
select c.course_id,c.course_name,c.start_date,c.end_date,c.video_expire_days,v.video_id,v.title,v.added_at
from Course c
inner join  Video v on c.course_id=v.course_id
where date_add(v.added_at,interval c.video_expire_days day )>= current_date() ;





