rem======================User priv.=====================================
conn sys/sys@orcl as sysdba
Drop user accc cascade;
create user accc identified by 123;
grant connect,resource,dba to accc;
grant unlimited tablespace to accc;
grant create type to accc;
conn accc/123@orcl
REM =================create object==================
REM Create account head table.
REM ========================================
Create table account_head
(
Head_id     number(3),
head_name varchar2(100) constraint head_name_nn not null,
head_type  char(1));

Alter table account_head
add (constraint head_id_pk primary key (head_id));

REM =================create object==================
REM Create Debit Master table.
REM ========================================

create table DR_master
(
dr_id number(8),
dr_v_no varchar2(20) constraint dr_v_no_nn not null,
dr_date Date constraint dr_dae_nn not null,
dr_desc varchar2(100),
dr_type char(1),
dr_tot_amt number(10,2));


Alter table DR_master
add (constraint dr_id_pk primary key (dr_id));

REM =================create object==================
REM Create Debit Details table.
REM ========================================

create table dr_details
(
dr_d_id number(8),
sl_no number(5),
head_id number(3),
dr_id number(8),
dr_amount number(10,2));


alter table dr_details
add (constraint dr_d_id_pk primary key(dr_d_id));


alter table dr_details
add (constraint head_id_fk foreign key(head_id) references account_head(head_id));

alter table dr_details
add (constraint dr_id_fk foreign key(dr_id) references dr_master(dr_id));

REM =================create object==================
REM Create Credit Master table.
REM ========================================

create table cr_master
(
cr_id number(8),
cr_v_no varchar2(20) constraint cr_v_no_nn not null,
cr_date Date constraint cr_date_nn not null,
cr_desc varchar2(100),
cr_type char(1),
cr_tot_amt number(10,2));

Alter table cr_master
add (constraint cr_id_pk primary key (cr_id));


REM =================create object==================
REM Create Debit Details table.
REM ========================================

create table cr_details
(
cr_d_id number(8),
sl_no number(5),
head_id number(3),
cr_id number(8),
cr_amount number(10,2));


alter table cr_details
add (constraint cr_d_id_pk primary key(cr_d_id));


alter table cr_details
add (constraint hd_id_fk foreign key(head_id) references account_head(head_id));

alter table cr_details
add (constraint cr_id_fk foreign key(cr_id) references cr_master(cr_id));





