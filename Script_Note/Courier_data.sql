REM=========COMPANY_info=======================

INSERT INTO COMPANY_info(cmp_id,cmp_name,CMP_address,PHONE_NUMBER,WEB_ADDRESS)
 VALUES(101,'STARLING Courier service', '25/5 Dilkusha,Motijheel,Dhaka-100',96487123','Starling_cs@yahoo.com');


REM=========Branch_info=======================

INSERT INTO Branch_info(Branch_id ,Brnch_name ,Branch_Address,Cmp_ID,PHONE_NUMBER,WEB_ADDRESS)
 VALUES(102,'Dhanmondi Branch', '15/1,Old-27 Dhanmondi,Dhaka.',101,'01714587956',DS_CS@yahoo.com );

INSERT INTO Branch_info(Branch_id ,Brnch_name ,Branch_Address,Cmp_ID,PHONE_NUMBER,WEB_ADDRESS)
 VALUES(103,'HasnaBaad Branch', 'Hasnabaad Borisal',101,'97845621','hb_cs@yahoo.com');

INSERT INTO Branch_info(Branch_id ,Brnch_name ,Branch_Address,Cmp_ID,PHONE_NUMBER,WEB_ADDRESS)
 VALUES(104,'Poirtola Branch', 'Brahmanbaria',101,'8124563','pb_cs@yahoo.com' );

INSERT INTO Branch_info(Branch_id ,Brnch_name ,Branch_Address,Cmp_ID,PHONE_NUMBER,WEB_ADDRESS)
 VALUES(105, 'JSC-mor Branch', 'Chittagong',101,'0193745689','CS_cs@yahoo.com' );

REM=========product_category=======================

INSERT INTO PRODUCT_CATEGORY(category_id ,category_name,product_type)
 VALUES(1, 'percel','soft' );

INSERT INTO PRODUCT_CATEGORY(category_id ,category_name,product_type)
 VALUES(2, 'percel','hard' );

INSERT INTO PRODUCT_CATEGORY(category_id ,category_name,product_type)
 VALUES(3, 'percel', 'soft');


REM=========client_info=======================

INSERT INTO client_info(Client_id ,Client_name ,branch_id  ,Client_address,client_contact_no )
 VALUES(18, ' samia',102,'Mirpur/24','01718138082' );

INSERT INTO client_info(Client_id ,Client_name ,branch_id  ,Client_address,client_contact_no )
 VALUES(19, ' samia',102,'Dhanmondi','01718138082' );

INSERT INTO client_info(Client_id ,Client_name ,branch_id  ,Client_address,client_contact_no )
 VALUES(20, ' samia',102,'Jatrabaari','01718138082' );


REM=========staff_info=======================

INSERT INTO staff_info(staff_id,staff_name,staff_address,salary ,joining_date,Designation,branch_id)
 VALUES(115,'lamia','mirpur',5000,'14-jan-2018','manager',102);

INSERT INTO staff_info(staff_id,staff_name,staff_address,salary ,joining_date,Designation,branch_id)
 VALUES(116,'lamia','mirpur',5000,'14-jan-2018','manager',102);


INSERT INTO staff_info(staff_id,staff_name,staff_address,salary ,joining_date,Designation,branch_id)
 VALUES(118,'lamia','mirpur',5000,'14-jan-2018','manager',102);

REM=========Price=======================

Insert into price(price_id,Distance_KM,Weight_KG,Size_CM,Price)
values(101,200,100,50,350);

Insert into price(price_id,Distance_KM,Weight_KG,Size_CM,Price)
values(102,300,100,60,350);

Insert into price(price_id,Distance_KM,Weight_KG,Size_CM,Price)
values(103,500,100,100,350);

REM========= product_info=======================

INSERT INTO product_info( product_id , product_type , category_id )
 VALUES(140, 'television',19);

INSERT INTO product_info( product_id , product_type , category_id  )
 VALUES(141, 'mobile phone' ,19);


REM=========product_rcve_by_Brnch=======================

INSERT INTO  product_rcve_by_Brnch(Branch_recvd_id ,branch_recv_date,client_id ,Reciever_name ,Receiver_Address,
Delivery_date,Price_id,Product_id,Staff_id )
 VALUES(140,'01-jan-2018',18, 'Jhantu','New keli','15-FEB-2018',101,140,115);


INSERT INTO  product_rcve_by_Brnch(Branch_recvd_id ,branch_recv_date,client_id ,Reciever_name ,Receiver_Address,
Delivery_date,Price_id,Product_id,Staff_id )
 VALUES(141,'01-jan-2018',19, 'Montu','Borishal','15-JAN-2018',101,141,115);




REM=========Reciever_details=======================

INSERT INTO Reciever_details (Rcvr_id, Branch_recvd_id,staff_id ,Recieving_date, Reciever_contact_no) 
VALUES(140,141,115,'20-Dec-2018','01677883929');

INSERT INTO Reciever_details (Rcvr_id, Branch_recvd_id,staff_id ,Recieving_date, Reciever_contact_no) 
VALUES(141,140,115,'20-Dec-2018','01677883929');


REM=========product_rcved_details=======================


INSERT INTO product_rcved_details(product_rcved_id, Reciever_name,Reciever_contact_no,Recieved_date,
Branch_recvd_id,product_id)
 VALUES(170,'good','0197548546','01-Feb-2018',102,140);

INSERT INTO product_rcved_details(product_rcved_id, Reciever_name,Reciever_contact_no,Recieved_date,
Branch_recvd_id,product_id)
 VALUES(171,'good','0197548546','01-Feb-2018',102,140);


REM=========return_product=======================

INSERT INTO return_product( return_id ,Branch_recvd_id, return_date,staff_id ,
branch_id ,client_id,CLIEN_CONTACT_NO)
 VALUES(39,140,'14-Jan-2018',115,102,18,'01682324684');

INSERT INTO return_product( return_id ,Branch_recvd_id, return_date,staff_id ,branch_id ,client_id,CLIEN_CONTACT_NO)
 VALUES(40,140,'14-Jan-2018',115,102,18,'01245687');

REM=========Locations=======================

Insert into Locations(location_id,place_name,Distance)
values(1,'Dhaka','500km');

Insert into Locations(location_id,place_name,Distance)
values(2,'Khulna','1000km');

Insert into Locations(location_id,place_name,Distance)
values(3,'Borishal','500km');

Insert into Locations(location_id,place_name,Distance)
values(4,'Comilla','5000km');






