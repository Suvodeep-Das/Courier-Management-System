----------Product-----------------
Drop table Product Cascade Constraint;

Create table product
(
product_id  Number(6) constaint product_id_pk Primary key,
product_name varchar2(30),
product_unit  varchar2(10),
unit_price   number(10,2) DEFAULT 0,
product_img Blob);


Create or replace Trigger pro_id_pk_trig
Before Insert On product
for each row
begin
select nvl(max(product_id),0)+1 into :new.product_id
from product;
Exception
when dup_val_on_index then
Raise_application_error(-20012,'Duplicate Product ID');
End pro_id_pk_trig;

--------------STOCK---------------

Create table stock 
(stock_id number(10) Constraint stock_id_pk primary key,
stock_qty number(6) DeFAULT 0,
product_id number(6) constraint st_pro_id_fk_ references product(product_id));

create or replace trigger stock_id_pk_trg
before insert on stock
for each row
begin
select nvl(max(stock_id),0)+1 into :new.stock_id
from stock;
exception
When dup_val_on_index then
Raise_application_error(-20012,'Duplicate Stock id');
end stock_id_pk_trig;

------------------Sales-------------------
Create table Sales
(sale_id number(10) constraint sale_id_pk primary key,
sale_date date DEFAULT sysdate constraint sale_date_nn not null,
sale_amt number(10,2) DEFAULT 0,
sale_qty number(6) default 0,
product_id number(6) constraint sale_pro_id_fk references product(product_id));

create or replace trigger salexs_id_pk_trig
before insert  on sales
for each row
begin
select nvl(max(sale_id),0)+1 into :new.sale_id
from sales;
Exception
When dup_val_on_index then
Raise_application_error(-20013,'Duplicate Sales Id');
end salaes_id_pk_trig;

create or replace procedure add_sale
(p_sale_date IN sales.sale_date%type,
p_sale_amt IN sales.sale_amt%TYPE,
p_sale_qty in Sales.sale_qty%type,
p_product_id in sales.product_id%type)
is
begin
insert into sales(sale_date,sale_amt,sale_qty,product_id)
values(p_sale_date,p_sale_amt,p_sale_qty,p_product_id);
end add_sale;