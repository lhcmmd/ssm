select * from t_head
select * from t_person

create table t_head(
		id number(10) primary key,
		username varchar2(20),
		password varchar2(30),
		realname varchar2(30),
		imgname varchar2(100)   --存储上传后图象的实际文件名（示例数据:1 tom 123456 male20434324342.gif）
	)
	create sequence t_head_seq;
	create table t_person(
		id number(7) primary key,
		name varchar2(15) not null,
		mobile varchar2(11) not null unique check( length(mobile)=11 ),
		telphone varchar2(13) check( telphone like '___%-_______%'),
		email varchar2(30) unique check( email like '_%@%_' ),
		city varchar2(20),
		birthday date
	);
	create sequence t_person_seq;
	commit