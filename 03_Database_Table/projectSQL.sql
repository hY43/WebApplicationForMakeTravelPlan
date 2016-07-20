create table userinfo
(userid	varchar2(2000),
password	varchar2(20),
name	varchar2(20),
tel	varchar2(20),
email	varchar2(100),
backgroundimg	varchar2(2000),
admin	varchar2(5));

create table bookmark
(bookmarkno number(10),
url	varchar2(2000),
userid	varchar2(2000));

create table question
(questionno	number(10),
regdate	date,
title	varchar2(2000),
contents	varchar2(2000),
userid	varchar2(2000));

create table review
(reviewno number(10),
enable	number(1),
regdate	date,
title	varchar2(2000),
contents	varchar2(2000),
userid	varchar2(2000));

create table answer
(answerno	number(10),
contents	varchar2(2000),
questionno	number(10),
userid	varchar2(2000));

create table plan
(planno number(20),
title	varchar2(2000),
regdate	date,
period	number(20),
userid	varchar2(2000));

create table city
(cityname	varchar2(2000),
latitude	number(20,10),
longitude	number(20,10),
info	varchar2(2000),
img	varchar2(2000));

create table place
(placeno	number(20),
placename	varchar2(2000),
img	varchar2(2000),
info	varchar2(2000),
latitude	number(20,10),
longitude	number(20,10),
icon	varchar2(2000),
cityname	varchar2(2000));

create table plandetail
(plandetailno	number(20),
planorder	number(20),
day	number(20),
movetime	varchar2(2000),
plancomment	varchar2(2000),
planno	number(20),
placeno	number(20));



create sequence bookmark_bookmarkno_seq
start with 1
increment by 1
nocache
nocycle;

create sequence question_questionno_seq
start with 1
increment by 1
nocache
nocycle;

create sequence review_reviewno_seq
start with 1
increment by 1
nocache
nocycle;

create sequence answer_answerno
start with 1
increment by 1
nocache
nocycle;

create sequence plan_planno_seq
start with 1
increment by 1
nocache
nocycle;

create sequence plandetail_plandetailno_seq
start with 1
increment by 1
nocache
nocycle;

create sequence place_placeno_seq
start with 1
increment by 1
nocache
nocycle;



alter table userinfo
add constraint userinfo_userid_pk primary key(userid);

alter table bookmark
add constraint bookmark_bookmarkno_pk primary key(bookmarkno);
alter table bookmark
add constraint bookmark_userid_fk foreign key(userid)
references userinfo(userid);

alter table review
add constraint review_reviewno_pk primary key(reviewno);
alter table review
add constraint review_userid_fk foreign key(userid)
references userinfo(userid);

alter table question
add constraint question_questionno_pk primary key(questionno);
alter table question
add constraint question_userid_fk foreign key(userid)
references userinfo(userid);

alter table answer
add constraint answer_answerno_pk primary key(answerno);
alter table answer
add constraint answer_userid_fk foreign key(userid)
references userinfo(userid);
alter table answer
add constraint answer_questionno_fk foreign key(questionno)
references question(questionno);

alter table plan
add constraint plan_planno_pk primary key(planno);
alter table plan
add constraint plan_userid_fk foreign key(userid)
references userinfo(userid);

alter table city
add constraint city_cityname_pk primary key(cityname);

alter table place
add constraint place_placeno_pk primary key(placeno);
alter table place
add constraint place_cityname_fk foreign key(cityname)
references city(cityname);

alter table plandetail
add constraint plandetail_plandetailno_pk primary key(plandetailno);
alter table plandetail
add constraint plandetail_planno_fk foreign key(planno)
references plan(planno);
alter table plandetail
add constraint plandetail_placeno_fk foreign key(planno)
references place(placeno);