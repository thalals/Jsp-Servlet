create table student (
	num int,
	name varchar(10),
	primary key(num)
);

desc student;

insert into student values(1, '홍길동');
insert into student values(2, '김길동');
insert into student values(3, '박길동');
insert into student values(4, '박형민');
insert into student values(5, '최민석');
insert into student values(6, '장길동');
insert into student values(7, '정길동');
insert into student values(8, '한길동');
insert into student values(9, '치길동');
insert into student values(10, '선길동');

select * from student;