rem======================User priv.=====================================
conn sys/123@orcl as sysdba;
Drop user acc cascade;
create user acc identified by 123;
grant connect,resource,dba to acc;
grant unlimited tablespace to acc;
grant create type to acc;
conn acc/123@orcl;

REM ------Project Table Creation syntax-------
REM Create table Company Information
REM --------------------------------------

Create table company_info
(Cmp_ID                number(5),
Cmp_name               varchar2(50),
Cmp_Address            varchar2(50),
PHONE_NUMBER           varchar2(20),
WEB_ADDRESS            varchar2(20)); 

alter table company_info
add constraint cmp_id_pk primary key(cmp_id);

REM -----------------------
REM Create table Branch Information
REM ----------------------

create table Branch_Info
(
Branch_id      number(5),
Brnch_name     varchar2(50),
Branch_Address varchar2(50),
Cmp_ID         number(5),
PHONE_NUMBER    varchar2(20),
WEB_ADDRESS     varchar2(20));         

ALTER table Branch_Info
add constraint Branch_id_pk primary key (Branch_id);

REM -----------------------
REM Create table Product Category
REM ----------------------

create table product_category
(
category_id      number(5),
category_name    varchar2(50),
Product_type     char(20)); 

Alter table product_category
add constraint category_id_PK primary key (category_id);

REM ---------------------------------------------
REM Create table Product recive by Branch
REM ----------------------------------------------- 

create table product_rcve_by_Brnch
(
Branch_recvd_id number(5),
branch_recv_date Date,
client_id number(5),
Reciever_name varchar2(20),
Receiver_Address varchar2(20),
Delivery_date  Date,
Price_id    Number(10,2),
Product_id  Number(5),
Staff_id    number(5)
);

Alter table product_rcve_by_Brnch
add constraint Branch_recvd_id_PK primary key (Branch_recvd_id);

REM -----------------------
REM Create table staff information 
REM ----------------------  

create table staff_info
(
staff_id number(5),
staff_name varchar2(50),
staff_address char(20),
salary number(10,2),
joining_date date,
Designation char(20),
branch_id number(5)
);

Alter table staff_info
add constraint staff_id_PK primary key (staff_id);


REM -----------------------
REM Create table Client Information
REM ---------------------- 

create table client_info
(
Client_id number(5),
Client_name varchar2(50),
branch_id  number(5),
Client_address varchar2(50),
client_contact_no varchar2(20)
);

Alter table client_info
add constraint Client_id_PK primary key (Client_id);


REM -----------------------
REM Create table Reciever details
REM ----------------------  

create table Reciever_details
(
Rcvr_id number(5),
Branch_recvd_id number(5),
staff_id number(5),
Recieving_date  Date,
Reciever_contact_no char(20)
);

Alter table Reciever_details
add constraint rcvr_id_PK primary key (rcvr_id);

REM -----------------------
REM Create table Product Recieved Details
REM ----------------------  

create table product_rcved_details
(
product_rcved_id number(5),
Reciever_name varchar2(20),
Reciever_contact_no char(20),
Recieved_date varchar2(20),
Branch_recvd_id number(5),
Product_id    number(5));

Alter table product_rcved_details
add constraint product_rcved_id_PK primary key (product_rcved_id);


REM -----------------------
REM Create table Return product
REM ----------------------  

create table return_product
(
return_id number(5),
Branch_recvd_id number(5),
return_date date,
staff_id number(5),
branch_id number(5),
client_id number(5),
clien_contact_no char(20));

Alter table return_product
add constraint return_id_PK primary key (return_id);

REM -----------------------
REM Create table product information
REM ----------------------

create table product_info
(
product_id number(5),
product_type varchar2(20),
category_id number(5)
);

Alter table product_info
add constraint product_id_PK primary key (product_id);

REM -----------------------
REM Create table Location information
REM ----------------------

Create table Locations
(
location_id number(5),
Place_name  char(50),
distance    varchar2(100));

Alter table Locations
add constraint location_id_PK primary key (location_id);


REM -------------------------------
REM Create table Price information
REM ---------------------------------

create table Price
(
price_id  number(5),
Distance_KM  Number(10),
Weight_KG  Number(10),
Size_CM    Number(10),
Price       Number(10,2)
);

Alter table Price
add constraint price_id_PK primary key (price_id);

REM -------------------------------
REM Create table General client information
REM ---------------------------------

Create table General_client
(
g_client_id  number(5),
Client_name varchar2(50),
branch_id  number(5),
Client_address varchar2(50),
client_contact_no varchar2(20));

Alter table general_client
add constraint g_client_id_pk primary key(g_client_id);

REM ----------------------------------------------------------------------
REM References Constraint are for Branch_Info
REM ---------------------------------------------------------------------


Alter table Branch_Info
add constraint Cmp_ID1_FK foreign key(Cmp_ID) references company_info(Cmp_ID);


REM ----------------------------------------------------------------------------------------
REM References Constraint are for product_rcve_by_Brnch
REM -----------------------------------------------------------------------------------


Alter table product_rcve_by_Brnch
add constraint Staff_id1_FK foreign key(Staff_id) references staff_info(Staff_id);

Alter table product_rcve_by_Brnch
add constraint client_id1_FK foreign key(client_id) references client_info(client_id);

Alter table product_rcve_by_Brnch
add constraint Product_id8_FK foreign key(Product_id) references Product_info(Product_id);

Alter table price
add constraint price_id1_FK foreign key(Price_id) references price(Price_id);

REM --------------------------------------------------------------------------
REM References Constraint for staff info
REM ------------------------------------------------------------------------

Alter table staff_info
add constraint branch_id1_FK foreign key(branch_id) 
references Branch_Info(branch_id);

REM ------------------------------------------------------------------------
REM References Constraint for client info
REM -------------------------------------------------------------------------

Alter table client_info
add constraint branch_id2_FK foreign key(branch_id) references Branch_Info(branch_id);

REM ------------------------------------------------------------------------
REM References Constraint for Reciever details
REM -------------------------------------------------------------------------


Alter table Reciever_details
add constraint staff_id5_FK foreign key(staff_id) 
references staff_info(staff_id);

Alter table Reciever_details
add constraint Branch_recvd_id10_FK foreign key(Branch_recvd_id) 
references product_rcve_by_Brnch(Branch_recvd_id);

REM ------------------------------------------------------------------------
REM References Constraint for return_product
REM -------------------------------------------------------------------------

Alter table return_product
add constraint staff_id3_FK foreign key(staff_id) 
references staff_info(staff_id);

Alter table return_product
add constraint branch_id3_FK foreign key(branch_id) 
references branch_info(branch_id);

Alter table return_product
add constraint client_id3_FK foreign key(client_id) 
references client_info(client_id);

Alter table return_product
add constraint Branch_recvd_id2_FK foreign key(Branch_recvd_id) 
references product_rcve_by_Brnch(Branch_recvd_id);

REM ------------------------------------------------------------------------
REM References Constraint for product_rcved_details
REM -------------------------------------------------------------------------

Alter table product_rcved_details
add constraint product_id3_FK foreign key(product_id) 
references product_info(product_id);

REM ------------------------------------------------------------------------
REM References Constraint for product_info
REM -------------------------------------------------------------------------

Alter table product_info
add constraint category_id_FK foreign key(category_id) 
references product_category(category_id);

REM ------------------------------------------------------------------------
REM References Constraint for general_client
REM -------------------------------------------------------------------------

Alter table general_client
add constraint branch_id8_FK foreign key(branch_id) 
references branch_info(branch_id);

REM -------------------------------
REM Create table Users information
REM ---------------------------------

create table users
(
USER_ID     Number(10,2),
USER_NAME    varchar2(32),
PASS_WORD    varchar2(32)
);

REM -------------------------------
REM Create table User_log_info information
REM ---------------------------------

create table User_log_info
(
USER_LOG_ID    Number(10,2),
USER_ID        NUMBER(6,0),
LOG_IN         TIMESTAMP(6),
LOG_OUT        TIMESTAMP(6)
);