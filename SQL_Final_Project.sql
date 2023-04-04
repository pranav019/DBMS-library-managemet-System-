CREATE DATABASE lms_db3;
USE lms_db3;

Create table LMS_MEMBERS
(
MEMBER_ID Varchar(10),
MEMBER_NAME Varchar(30) NOT NULL,
CITY Varchar(20),
DATE_REGISTER Date NOT NULL,
DATE_EXPIRE Date ,
MEMBERSHIP_STATUS Varchar(15)NOT NULL,
Constraint PRIMARY KEY(MEMBER_ID)
);

Create table LMS_SUPPLIERS_DETAILS
(
SUPPLIER_ID Varchar(3) NOT NULL,
SUPPLIER_NAME Varchar(30) NOT NULL,
ADDRESS Varchar(50),
CONTACT bigint(10) NOT NULL,
EMAIL Varchar(15) NOT NULL,
PRIMARY KEY(SUPPLIER_ID)
);


Create table LMS_FINE_DETAILS
(
FINE_RANGE Varchar(3),
FINE_AMOUNT decimal(10,2) NOT NULL,
PRIMARY KEY(FINE_RANGE)
);

Create table LMS_BOOK_DETAILS
(
BOOK_CODE Varchar(10) NOT NULL, 
BOOK_TITLE Varchar(50) NOT NULL,
CATEGORY Varchar(15) NOT NULL,
AUTHOR Varchar(30) NOT NULL,
PUBLICATION Varchar(30),
PUBLISH_DATE Date,
BOOK_EDITION int(2),
PRICE decimal(8,2) NOT NULL, 
RACK_NUM Varchar(3),
DATE_ARRIVAL Date NOT NULL,  
SUPPLIER_ID Varchar(3) NOT NULL,
PRIMARY KEY(BOOK_CODE), 
FOREIGN KEY(SUPPLIER_ID) References LMS_SUPPLIERS_DETAILS(SUPPLIER_ID)
);


Create table LMS_BOOK_ISSUE
(
BOOK_ISSUE_NO int,
MEMBER_ID Varchar(10) NOT NULL,
BOOK_CODE Varchar(10) NOT NULL,
DATE_ISSUE Date NOT NULL,
DATE_RETURN Date NOT NULL,
DATE_RETURNED Date NULL,
FINE_RANGE Varchar(3),
PRIMARY KEY(BOOK_ISSUE_NO),FOREIGN KEY(MEMBER_ID) References LMS_MEMBERS(MEMBER_ID),
FOREIGN KEY(BOOK_CODE) References LMS_BOOK_DETAILS(BOOK_CODE),
FOREIGN KEY(FINE_RANGE) References LMS_FINE_DETAILS(FINE_RANGE)
);

Insert into LMS_MEMBERS
Values('LM001', 'AMIT', 'CHENNAI', '2012-02-12', '2013-02-11','Temporary');
Insert into LMS_MEMBERS
Values('LM002', 'ABDHUL', 'DELHI', '2012-04-10', '2013-04-09','Temporary');
Insert into LMS_MEMBERS
Values('LM003', 'GAYAN', 'CHENNAI', '2012-05-13','2013-05-12', 'Permanent');
Insert into LMS_MEMBERS
Values('LM004', 'RADHA', 'CHENNAI', '2012-04-22', '2013-04-21', 'Temporary');
Insert into LMS_MEMBERS
Values('LM005', 'GURU', 'BANGALORE', '2012-03-30', '2013-05-16','Temporary');
Insert into LMS_MEMBERS
Values('LM006', 'MOHAN', 'CHENNAI', '2012-04-12', '2013-05-16','Temporary');
select * from lms_members;

Insert into LMS_SUPPLIERS_DETAILS 
Values ('S01','SINGAPORE SHOPPEE', 'CHENNAI', 9894123555,'sing@gmail.com');
Insert into LMS_SUPPLIERS_DETAILS 
Values ('S02','JK Stores', 'MUMBAI', 9940123450 ,'jks@yahoo.com');
Insert into LMS_SUPPLIERS_DETAILS 
Values ('S03','ROSE BOOK STORE', 'TRIVANDRUM', 9444411222,'rose@gmail.com');
Insert into LMS_SUPPLIERS_DETAILS 
Values ('S04','KAVARI STORE', 'DELHI', 8630001452,'kavi@redif.com');
Insert into LMS_SUPPLIERS_DETAILS 
Values ('S05','EINSTEN BOOK GALLARY', 'US', 9542000001,'eingal@aol.com');
Insert into LMS_SUPPLIERS_DETAILS 
Values ('S06','AKBAR STORE', 'MUMBAI',7855623100 ,'akbakst@aol.com');
select * from LMS_SUPPLIERS_DETAILS;


Insert into LMS_FINE_DETAILS Values('R0', 0);
Insert into LMS_FINE_DETAILS Values('R1', 20);
insert into LMS_FINE_DETAILS Values('R2', 50);
Insert into LMS_FINE_DETAILS Values('R3', 75);
Insert into LMS_FINE_DETAILS Values('R4', 100);
Insert into LMS_FINE_DETAILS Values('R5', 150);
Insert into LMS_FINE_DETAILS Values('R6', 200);
select * from LMS_FINE_DETAILS;


Insert into LMS_BOOK_DETAILS
Values('BL000010', 'Java ForvDummies', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-12-10', 6, 575.00, 'A1', '2011-05-10', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000002', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2011-05-10', 'S03');
Insert into LMS_BOOK_DETAILS 
Values('BL000003', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-05-10', 6, 600.00, 'A1', '2012-05-10', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000004', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2012-05-11', 'S01');
Insert into LMS_BOOK_DETAILS 
Values('BL000005', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-12-10', 6, 600.00, 'A1', '2012-05-11', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000006', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2012-05-12', 'S03');
Insert into LMS_BOOK_DETAILS 
Values('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar ', 'BPB Publications', '2010-12-11', 9, 500.00 , 'A3', '2010-11-03', 'S03');
Insert into LMS_BOOK_DETAILS 
Values('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar ','BPB Publications', '2010-05-12', 9, 500.00 , 'A3', '2011-08-09', 'S04');
Insert into LMS_BOOK_DETAILS 
Values('BL000009', 'Let Us C#', 'C', 'Yashavant Kanetkar ','BPB Publications', '2010-05-12', 9, 550.00 , 'A3', '2011-08-09', 'S04');
Insert into LMS_BOOK_DETAILS 
Values('BL000011', 'Let Us C++', 'C', 'Yashavant Kanetkar ','BPB Publications', '2010-05-12', 9, 650.00 , 'A3', '2011-08-09', 'S04');
select * from LMS_BOOK_DETAILS;


Insert into LMS_BOOK_ISSUE 
Values (001, 'LM001', 'BL000010', '2012-05-01', '2012-05-16', '2012-05-16', 'R0');
Insert into LMS_BOOK_ISSUE 
Values (002, 'LM002', 'BL000002', '2012-05-01', '2012-05-06','2012-05-16', 'R2');
Insert into LMS_BOOK_ISSUE
Values (003, 'LM003', 'BL000007', '2012-04-01', '2012-04-16', '2012-04-20','R1');
Insert into LMS_BOOK_ISSUE 
Values (004, 'LM004', 'BL000005', '2012-04-01', '2012-04-16','2012-04-20', 'R1');
Insert into LMS_BOOK_ISSUE 
Values (005, 'LM005', 'BL000008', '2012-03-30', '2012-04-15','2012-04-20' , 'R1');
Insert into LMS_BOOK_ISSUE 
Values (006, 'LM005', 'BL000008', '2012-04-20', '2012-05-05','2012-05-05' , 'R0');
Insert into LMS_BOOK_ISSUE 
Values (007, 'LM003', 'BL000007', '2012-04-22', '2012-05-07','2012-05-25' , 'R4');
select * from LMS_BOOK_ISSUE ;














-- \\1\\-- 

select member_id,member_name,city,membership_status

from lms_members

where membership_status='permanent';

select*from lms_book_issue;


-- \\2\\






-- \\3\\

select member_id,member_name 
from lms_members 
where member_id in
(select member_id 
from lms_book_issue
where BOOK_CODE ='BL000002');


select book_code,author,book_title
from lms_book_details
where author='P';
-- \\5\\

select count(category) no_of_books
from lms_book_details 
where category ='java'; 
-- \\6\\

select category,count(category) no_of_book
from lms_book_details
where category ='java' or category='C'
group by category; 


-- \7\
select count(author) no_of_books,publication
from lms_book_details
where publication like 'p%'; 


-- \\8\\

select book_title,book_code

from lms_book_details

where book_code in

(select book_code 

from lms_book_issue

where date_issue ='2012-04-01');


-- \\9\\

select member_id,member_name,date_register,date_expire

from lms_members

where date_expire<'2013-04-00';


-- \\10\\

select member_name,member_id,date_register,membership_status

from lms_members

where membership_status='temporary' and date_register<'2012-03-00';


-- \\11\\

select member_id,member_name name,city

from lms_members

where city='delhi' or city='chennai';


-- \\12\\

select concat(book_title,'_Is_Written_by_',author)
from lms_book_details;


-- \\13\\

select avg(price) as averageprice from lms_book_details
where category='java';


-- \\14\\

-- select supplier_id,supplier_name,email

-- from lms_suppliers_details

-- where email = %gmail%';


-- \\15\\

SELECT supplier_Name,supplier_id, 
COALESCE(contact,email,address) contactaddress
FROM lms_suppliers_details;

select supplier_name,supplier_id,contact,
if (contact is null,'no','yes') 

from lms_suppliers_details;

-- \\1\\

select book_code,book_title,

publication,price,book_edition,publish_date

from lms_book_details

order by book_edition,publication,publish_date ;


-- \\5\\

select book_code,book_title,rack_num

from lms_book_details

where rack_num='A1'

ORDER BY BOOK_title;


-- \\6\\

select m.member_id,m.member_name,bi.date_return,bi.date_returned

from lms_members m

join

lms_book_issue bi

on m.member_id=bi.member_id

where date_return != date_returned;


-- \\7\\

select m.member_id,m.member_name,m.date_register

from lms_members m

where member_id not in(select member_id from lms_book_issue);


-- \\8\\




-- \9\\



select book_title,supplier_id
from lms_book_details
where author like 'h%'
and supplier_id='S01'
and book_edition=5;


-- \\11\\

select count(rack_num)no_of_books,rack_num
from lms_book_details
group by rack_num
order by count(rack_num);


-- \\12\\



-- \\13\\

select book_code,book_title,publish_date

from lms_book_details

where month(publish_date)=12;


-- \\15\\

select book_code,book_title,
publication,datediff(current_date,publish_date)no_of_days
from lms_book_details
order by datediff(current_date,publish_date) ;
select * from LMS_BOOK_ISSUE ;
select * from lms_members;
select * from LMS_BOOK_DETAILS;
select * from LMS_FINE_DETAILS;
select * from LMS_SUPPLIERS_DETAILS;


-------------------------------------------------- -JOINS

select sd.supplier_id,sd.supplier_name,count(rack_num)
from lms_suppliers_details sd
join lms_book_details bd
on sd.supplier_id=bd.supplier_id
group by sd.supplier_id 
having count(rack_num)=(select count(rack_num)
from lms_book_details bd join lms_suppliers_details sd 
on sd.supplier_id=bd.supplier_id
group by sd.supplier_id
order by count(rack_num)limit 1);

-- multi table join-- 

select member_id,member_name 
from
lms_members 
where 
member_id not in(select bi.member_id 
from lms_book_issue bi
join lms_fine_details f
on f.fine_range=bi.fine_range
where year(date_returned)=2012
group by bi.member_id
having sum(f.fine_amount)>0);



select member_name,book_title,category,author,price,
date_issue,date_return,date_returned,book_issue_no
fine_amount
from lms_book_details
join lms_members
join lms_suppliers_details
join lms_book_issue
join lms_fine_details;



select book_code,book_title,bd.supplier_id,max(price),supplier_name
from lms_book_details bd 
join lms_suppliers_details sd
on sd.supplier_id=bd.supplier_id
group by supplier_id;


---- LEFT JOIN
select m.member_id,member_name,count( date_issue)remaining
from lms_members m
left join lms_book_issue bi
on m.member_id=bi.member_id
group by member_id;


select m.member_id,m.member_name,f.fine_range,sum(f.fine_amount)
from lms_members m
join
lms_fine_details f
join
lms_book_issue bi
on m.member_id=bi.member_id and
f.fine_range=bi.fine_range
group by m.member_id
having sum(f.fine_amount)>100; 


-- \\3\\

select sd.supplier_id,sd.supplier_name,count(rack_num)
from lms_suppliers_details sd
join lms_book_details bd
on sd.supplier_id=bd.supplier_id
group by sd.supplier_id 
having count(rack_num)=(select count(rack_num)
from lms_book_details bd join lms_suppliers_details sd 
on sd.supplier_id=bd.supplier_id
group by sd.supplier_id
order by count(rack_num)
limit 1);



show tables;



