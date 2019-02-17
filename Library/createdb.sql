create table Client(
	C_ID numeric(11),
	Fname varchar(30),
	Lname varchar(30),   
	bookPicked numeric(2),
	Fine numeric(4),
	C_Password char(6),
	primary key(C_ID)
);


create table Room(
	RoomNo numeric(3),
	Status	varchar(20),
	C_ID numeric(11),
	primary key(RoomNo),
	foreign key(C_ID)  references Client
);

CREATE TABLE Book(	
	B_ID char(8), 	
	Title varchar(120),	
	Author varchar(100),
	Publisher varchar(75),
	ISBN numeric(13),
	LCC varchar(40),
	Mstatus varchar(20),
	primary key(B_ID)
);

create table Device(
	D_ID char(8),
	Dtype varchar(25),
	Dname varchar(40),
	Mstatus varchar(20),
	primary key(D_ID)
);
create table Journal(
	J_ID char(8),
	Title varchar(150),
	Author varchar(100),
	Category varchar(60),
	Pub_Year numeric(4),
	Mstatus varchar(20),
	primary key(J_ID)
);


create table Ebook(
	E_ID char(8),
	Title varchar(120),
	Author varchar(100),
	Publisher varchar(75),
	ISBN numeric(13),
	primary key(E_ID)
);

create table Periodical(
	P_ID char(8),
	Issue_Date date,
	ISSN numeric(13),
	Pname varchar(50),
	Mstatus varchar(20),
	primary key(P_ID)
);

create table CD(
	CD_ID char(8),
	Album_Name varchar(50),
	Group_Name varchar(30),
	Genre varchar(30),
	Release_Year numeric(4),
	Mstatus varchar(20),
	primary key(CD_ID)	
);

create table Action(
	Order_ID numeric(10),
	Pick_Date date,
   	Return_Date date, 
 	Due_Date date,
	C_ID numeric(11),
	M_ID char(8),
	fine numeric(4), 
	foreign key(C_ID) references Client(C_ID),
	primary key(Order_ID)
);


create table RoomAction
(
	RD_ID numeric(10),
	RoomNo numeric(3),
	Res_Date Date,
	Ho10_12 numeric(11),
	Ho12_14 numeric(11),
	Ho14_16 numeric(11),
	Ho16_18 numeric(11),
	Ho18_20 numeric(11),
	Ho20_22 numeric(11),
	Primary key(RD_ID)
);





Create view CDGenre AS
select Album_Name, Group_Name, Release_Year
From CD
where Genre = 'Pop';

insert into CDGenre values('Alb','Grp',1984);



insert into Room values ('101', 'Unavailable', 10389219044);
insert into Room values ('102', 'Available', null);
insert into Room values ('103', 'Available', null);
insert into Room values ('104', 'Available', null);
insert into Room values ('105', 'Available', null);
insert into Room values ('106', 'Available', null);
insert into Room values ('107', 'Available', null);
insert into Room values ('108', 'Available', null);
insert into Room values ('109', 'Available', null);
insert into Room values ('110', 'Available', null);




insert into Action values (0,(to_date('2018-01-01','yyyy/mm/dd')),(to_date('2018-01-14','yyyy/mm/dd')),(to_date('2018-01-22','yyyy/mm/dd')),10389219044,'B0001-01',0);
insert into Action values (1,(to_date('2018-01-01','yyyy/mm/dd')),(to_date('2018-01-04','yyyy/mm/dd')),(to_date('2018-01-04','yyyy/mm/dd')),24191130360,'C0080-01',3);
insert into Action values (2,(to_date('2018-01-01','yyyy/mm/dd')),null,null,56473288743,'E0003-01',0);
insert into Action values (3,(to_date('2018-01-02','yyyy/mm/dd')),(to_date('2018-01-20','yyyy/mm/dd')),(to_date('2018-01-23','yyyy/mm/dd')),58790425432,'B0030-06',0);
insert into Action values (4,(to_date('2018-01-15','yyyy/mm/dd')),(to_date('2018-02-10','yyyy/mm/dd')),(to_date('2018-02-05','yyyy/mm/dd')),49038295778,'B0002-01',5);
insert into Action values (5,(to_date('2018-01-16','yyyy/mm/dd')),(to_date('2018-01-20','yyyy/mm/dd')),(to_date('2018-01-19','yyyy/mm/dd')),82103129903,'D0001-01',1);
insert into Action values (6,(to_date('2018-01-16','yyyy/mm/dd')),(to_date('2018-02-10','yyyy/mm/dd')),(to_date('2018-02-06','yyyy/mm/dd')),24879320711,'B0030-05',4);
insert into Action values (7,(to_date('2018-01-19','yyyy/mm/dd')),(to_date('2018-02-11','yyyy/mm/dd')),(to_date('2018-02-09','yyyy/mm/dd')),76824074030,'J0001-01',2);
insert into Action values (8,(to_date('2018-01-20','yyyy/mm/dd')),(to_date('2018-01-25','yyyy/mm/dd')),(to_date('2018-01-23','yyyy/mm/dd')),24191130360,'C0066-01',2);
insert into Action values (9,(to_date('2018-01-23','yyyy/mm/dd')),(to_date('2018-01-26','yyyy/mm/dd')),(to_date('2018-02-13','yyyy/mm/dd')),49038295778,'B0015-01',13);
insert into Action values (10,(to_date('2018-02-10','yyyy/mm/dd')),(to_date('2018-02-16','yyyy/mm/dd')),(to_date('2018-02-13','yyyy/mm/dd')),23982758947,'D0002-01',3);
insert into Action values (11,(to_date('2018-02-11','yyyy/mm/dd')),(to_date('2018-03-06','yyyy/mm/dd')),(to_date('2018-03-04','yyyy/mm/dd')),10389219044,'B0030-02',2);
insert into Action values(12,(to_date('2018-02-11','yyyy/mm/dd')),(to_date('2018-03-09','yyyy/mm/dd')),(to_date('2018-03-04','yyyy/mm/dd')),24191130360,'B0030-05',5);
insert into Action values(13,(to_date('2018-02-11','yyyy/mm/dd')),(to_date('2018-03-03','yyyy/mm/dd')),(to_date('2018-03-04','yyyy/mm/dd')),56473288743,'B0030-04',0);
insert into Action values(14,(to_date('2018-02-12','yyyy/mm/dd')),(to_date('2018-02-15','yyyy/mm/dd')),(to_date('2018-02-16','yyyy/mm/dd')),58790425432,'D0003-08',0);
insert into Action values(15,(to_date('2018-02-12','yyyy/mm/dd')),(to_date('2018-03-07','yyyy/mm/dd')),(to_date('2018-03-05','yyyy/mm/dd')),10389219044,'J0004-01',2);
insert into Action values(16,(to_date('2018-02-12','yyyy/mm/dd')),(to_date('2018-03-06','yyyy/mm/dd')),(to_date('2018-03-05','yyyy/mm/dd')),49038295778,'B0003-01',1);
insert into Action values(17,(to_date('2018-02-13','yyyy/mm/dd')),(to_date('2018-02-20','yyyy/mm/dd')),(to_date('2018-02-16','yyyy/mm/dd')),47389047873,'D0006-04',4);
insert into Action values(18,(to_date('2018-02-13','yyyy/mm/dd')),(to_date('2018-03-05','yyyy/mm/dd')),(to_date('2018-03-06','yyyy/mm/dd')),63278467233,'B0001-01',0);
insert into Action values(19,(to_date('2018-02-13','yyyy/mm/dd')),(to_date('2018-02-14','yyyy/mm/dd')),(to_date('2018-02-16','yyyy/mm/dd')),13043284034,'C0080-01',0);
insert into Action values(20,(to_date('2018-02-13','yyyy/mm/dd')),(to_date('2018-03-10','yyyy/mm/dd')),(to_date('2018-03-06','yyyy/mm/dd')),48932784979,'B0002-01',4);
insert into Action values(21,(to_date('2018-02-14','yyyy/mm/dd')),(to_date('2018-02-20','yyyy/mm/dd')),(to_date('2018-02-17','yyyy/mm/dd')),79039042930,'D0001-01',3);
insert into Action values(22,(to_date('2018-02-14','yyyy/mm/dd')),(to_date('2018-03-06','yyyy/mm/dd')),(to_date('2018-03-07','yyyy/mm/dd')),58790425432,'J0001-01',0);
insert into Action values(23,(to_date('2018-02-14','yyyy/mm/dd')),(to_date('2018-03-01','yyyy/mm/dd')),(to_date('2018-02-17','yyyy/mm/dd')),76824074030,'C0066-01',12);
insert into Action values(24,(to_date('2018-02-14','yyyy/mm/dd')),(to_date('2018-03-06','yyyy/mm/dd')),(to_date('2018-03-07','yyyy/mm/dd')),24191130360,'B0015-01',0);
insert into Action values(25,(to_date('2018-02-15','yyyy/mm/dd')),(to_date('2018-02-20','yyyy/mm/dd')),(to_date('2018-02-18','yyyy/mm/dd')),49038295778,'D0002-01',2);
insert into Action values(26,(to_date('2018-02-15','yyyy/mm/dd')),(to_date('2018-02-26','yyyy/mm/dd')),(to_date('2018-02-18','yyyy/mm/dd')),23982758947,'D0003-03',8);
insert into Action values(27,(to_date('2018-02-15','yyyy/mm/dd')),(to_date('2018-02-16','yyyy/mm/dd')),(to_date('2018-02-18','yyyy/mm/dd')),58790425432,'D0004-01',0);
insert into Action values(28,(to_date('2018-02-15','yyyy/mm/dd')),(to_date('2018-03-06','yyyy/mm/dd')),(to_date('2018-03-08','yyyy/mm/dd')),82103129903,'B0002-01',0);
insert into Action values(29,(to_date('2018-02-16','yyyy/mm/dd')),(to_date('2018-03-06','yyyy/mm/dd')),(to_date('2018-03-09','yyyy/mm/dd')),24191130360,'J0008-01',0);
insert into Action values(30,(to_date('2018-02-16','yyyy/mm/dd')),(to_date('2018-03-01','yyyy/mm/dd')),(to_date('2018-02-19','yyyy/mm/dd')),76824074030,'D0003-07',10);


insert into Periodical values('P0001-01',(to_date('2015-05-02','yyyy/mm/dd')),1234567425634,'Time','Avaliable');
insert into Periodical values('P0002-01',(to_date('2015-06-02','yyyy/mm/dd')),1234567425636,'Time','Avaliable');
insert into Periodical values('P0003-01',(to_date('2015-07-02','yyyy/mm/dd')),1234567425638,'Time','Avaliable');
insert into Periodical values('P0004-01',(to_date('2015-08-02','yyyy/mm/dd')),1234567425640,'Time','Avaliable');
insert into Periodical values('P0005-01',(to_date('2015-09-02','yyyy/mm/dd')),1234567425642,'Time','Avaliable');
insert into Periodical values('P0006-01',(to_date('2017-02-01','yyyy/mm/dd')),1234567425634,'Bütün Dünya','Avaliable');
insert into Periodical values('P0007-01',(to_date('2017-06-04','yyyy/mm/dd')),1234567243276,'Bütün Dünya','Avaliable');
insert into Periodical values('P0008-01',(to_date('2017-07-03','yyyy/mm/dd')),1234567426344,'Bütün Dünya','Avaliable');
insert into Periodical values('P0009-01',(to_date('2017-08-02','yyyy/mm/dd')),1234567783634,'Bütün Dünya','Avaliable');
insert into Periodical values('P0010-01',(to_date('2018-01-03','yyyy/mm/dd')),8644567621634,'Bütün Dünya','Avaliable');


insert into Client values ('39123483299','Halil Ömer','Tekin','0','0','ABCDEF');
insert into Client values ('24191130360','Efe Berk','Ergüleç','0','0','ABCDER');
insert into Client values ('56473288743','Ulvi Umut','Yavuzlar','0','0','ABCFTH');
insert into Client values ('58790425432','İsmet Erkin','Yavuzlar','0','0','BGHHRE');
insert into Client values ('10389219044','Arda','Andırın',0,'0','FGETS4');
insert into Client values ('49038295778','Akif Saner','Ergüleç','0','0','VGHM65');
insert into Client values ('47389047873','Hüsnü','Yavuzlar','0','0','NTYKE4');
insert into Client values ('63278467233','Edipcan','Özer','0','0','RTETYP');
insert into Client values ('82103129903','Eren','Kılıç','0','0','jk3oy3');
insert into Client values ('13043284034','Sinan','Çavdar','0','0','bsgkwt');
insert into Client values ('48932784979','Doruk','İnanç','0','0','jklt24');
insert into Client values ('79039042930','Mert','Utku','0','0','1234gd');
insert into Client values ('34809329019','Arda','Turan','0','0','4567gb');
insert into Client values ('54859348405','Ricardo','Quaresma','0','0','fgse52');
insert into Client values ('19037284979','Mehmet','Topal','0','0','fdsest');
insert into Client values ('23982758947','Orkunt','Sabuncu','0','0','fxhoca');
insert into Client values ('83927489390','Tayfun','Küçükyılmaz','0','0','dofgde');
insert into Client values ('24879320711','Şehram','Dizeci','0','0','acfkwy');
insert into Client values ('43789207489','Tolga Kurtuluş','Çapın','0','0','weqeqg');
insert into Client values ('57384748903','Gizem','Kayar','0','0','ewqjr4');
insert into Client values ('76824074030','Yiğit','Sever','0','0','trqqfb');
insert into Client values ('93824915934','Hacı Ali','Canlı','0','0','142569');
insert into Client values ('12384507645','Tuna','Seçkin','0','0','jri564');
insert into Client values ('71292485798','Bilgin','Avenoğlu','0','0','343g32');
insert into Client values ('33894837530','Ralph','Grove','0','0','42424g');
insert into Client values ('00000000000','Admin','Nimda','0','0','cmpe232');






insert into Device values ('D0001-01','Calculator','Texas Instruments TI-Nspire CX','Available');
insert into Device values ('D0001-02','Calculator','Texas Instruments TI-Nspire CX','Available');
insert into Device values ('D0001-03','Calculator','Texas Instruments TI-Nspire CX','Available');
insert into Device values ('D0001-04','Calculator','Texas Instruments TI-Nspire CX','Available');
insert into Device values ('D0002-01','Calculator','Casio fx-CG50 PRIZM','Available');
insert into Device values ('D0002-02','Calculator','Casio fx-CG50 PRIZM','Available');
insert into Device values ('D0002-03','Calculator','Casio fx-CG50 PRIZM','Available');
insert into Device values ('D0002-04','Calculator','Casio fx-CG50 PRIZM','Available');
insert into Device values ('D0003-01','PC','Lenovo Yoga 900 15 inch i5','Available');
insert into Device values ('D0003-02','PC','Lenovo Yoga 900 15 inch i5','Available');
insert into Device values ('D0003-03','PC','Lenovo Yoga 900 15 inch i5','Available');
insert into Device values ('D0003-04','PC','Lenovo Yoga 900 15 inch i5','Available');
insert into Device values ('D0003-05','PC','Lenovo Yoga 900 15 inch i5','Available');
insert into Device values ('D0003-06','PC','Lenovo Yoga 900 15 inch i5','Available');
insert into Device values ('D0003-07','PC','Lenovo Yoga 900 15 inch i5','Available');
insert into Device values ('D0003-08','PC','Lenovo Yoga 900 15 inch i5','Available');
insert into Device values ('D0004-01','PC','MacBook Pro 15 inch i7','Available');
insert into Device values ('D0004-02','PC','MacBook Pro 15 inch i7','Available');
insert into Device values ('D0004-03','PC','MacBook Pro 15 inch i7','Available');
insert into Device values ('D0004-04','PC','MacBook Pro 15 inch i7','Available');
insert into Device values ('D0004-05','PC','MacBook Pro 15 inch i7','Available');
insert into Device values ('D0004-06','PC','MacBook Pro 15 inch i7','Available');
insert into Device values ('D0004-07','PC','MacBook Pro 15 inch i7','Available');
insert into Device values ('D0004-08','PC','MacBook Pro 15 inch i7','Available');
insert into Device values ('D0005-01','Projector','Epson VS250 SVGA 3,200','Available');
insert into Device values ('D0005-02','Projector','Epson VS250 SVGA 3,200','Available');
insert into Device values ('D0005-03','Projector','Epson VS250 SVGA 3,200','Available');
insert into Device values ('D0005-04','Projector','Epson VS250 SVGA 3,200','Available');
insert into Device values ('D0006-01','HDMI Cable','Syncwire HDMI Cable 6.5ft HDMI Cord','Available');
insert into Device values ('D0006-02','HDMI Cable','Syncwire HDMI Cable 6.5ft HDMI Cord','Available');
insert into Device values ('D0006-03','HDMI Cable','Syncwire HDMI Cable 6.5ft HDMI Cord','Available');
insert into Device values ('D0006-04','HDMI Cable','Syncwire HDMI Cable 6.5ft HDMI Cord','Available');


insert into Book values ('B0001-01','1984','George Orwell','Harvill Secker','9781471331435',' PR6029.R8 .N716 2008 ','Available');
insert into Book values ('B0001-02','1984','George Orwell','Harvill Secker','9781471331435',' PR6029.R8 .N716 2008 ','Available');
insert into Book values ('B0001-03','1984','George Orwell','Harvill Secker','9781471331435',' PR6029.R8 .N716 2008 ','Available');
insert into Book values ('B0001-04','1984','George Orwell','Harvill Secker','9781471331435',' PR6029.R8 .N716 2008 ','Available');
insert into Book values ('B0001-05','1984','George Orwell','Harvill Secker','9781471331435',' PR6029.R8 .N716 2008 ','Available');
insert into Book values ('B0002-01','Murder on the Orient Express','Agatha Cristie','HarperCollins','9780008249670','PR6005.H66 M81 2011','Available');
insert into Book values ('B0002-02','Murder on the Orient Express','Agatha Cristie','HarperCollins','9780008249670','PR6005.H66 M81 2011','Available');
insert into Book values ('B0002-03','Murder on the Orient Express','Agatha Cristie','HarperCollins','9780008249670','PR6005.H66 M81 2011','Available');
insert into Book values ('B0002-04','Murder on the Orient Express','Agatha Cristie','HarperCollins','9780008249670','PR6005.H66 M81 2011','Available');
insert into Book values ('B0003-01','Harry Potter and the Philosophers Stone','J. K. Rowling','Bloomsbury','9788498387070','PR6068.O93 H341 1997','Available');
insert into Book values ('B0003-02','Harry Potter and the Philosophers Stone','J. K. Rowling','Bloomsbury','9788498387070','PR6068.O93 H341 1997','Available');
insert into Book values ('B0003-03','Harry Potter and the Philosophers Stone','J. K. Rowling','Bloomsbury','9788498387070','PR6068.O93 H341 1997','Available');
insert into Book values ('B0004-01','Harry Potter and the Chamber of Secrets','J. K. Rowling','Bloomsbury','9780747560722','PR6068.O93 H351 1998','Available');
insert into Book values ('B0004-02','Harry Potter and the Chamber of Secrets','J. K. Rowling','Bloomsbury','9780747560722','PR6068.O93 H351 1998','Available');
insert into Book values ('B0004-03','Harry Potter and the Chamber of Secrets','J. K. Rowling','Bloomsbury','9780747560722','PR6068.O93 H351 1998','Available');
insert into Book values ('B0005-01','Harry Potter and the Prisoner of Azkaban','J. K. Rowling','Bloomsbury','9789994030149','PR6068.O93 H361 1999','Available');
insert into Book values ('B0005-02','Harry Potter and the Prisoner of Azkaban','J. K. Rowling','Bloomsbury','9789994030149','PR6068.O93 H361 1999','Available');
insert into Book values ('B0005-03','Harry Potter and the Prisoner of Azkaban','J. K. Rowling','Bloomsbury','9789994030149','PR6068.O93 H361 1999','Available');
insert into Book values ('B0006-01','Harry Potter and the Half-Blood Prince','J. K. Rowling','Bloomsbury','9781781101544','PR6068.O93 H381 2005','Available');
insert into Book values ('B0006-02','Harry Potter and the Half-Blood Prince','J. K. Rowling','Bloomsbury','9781781101544','PR6068.O93 H381 2005','Available');
insert into Book values ('B0006-03','Harry Potter and the Half-Blood Prince','J. K. Rowling','Bloomsbury','9781781101544','PR6068.O93 H381 2005','Available');
insert into Book values ('B0007-01','Harry Potter and the Order of the Phoenix','J. K. Rowling','Bloomsbury','9788498383621','PR6068.O93 H381 2003','Available');
insert into Book values ('B0007-02','Harry Potter and the Order of the Phoenix','J. K. Rowling','Bloomsbury','9788498383621','PR6068.O93 H381 2003','Available');
insert into Book values ('B0007-03','Harry Potter and the Order of the Phoenix','J. K. Rowling','Bloomsbury','9788498383621','PR6068.O93 H381 2003','Available');
insert into Book values ('B0008-01','Harry Potter and the Goblet of Fire','J. K. Rowling','Bloomsbury','9788867156009','PR6068.O93 H371 2000','Available');
insert into Book values ('B0008-02','Harry Potter and the Goblet of Fire','J. K. Rowling','Bloomsbury','9788867156009','PR6068.O93 H371 2000','Available');
insert into Book values ('B0008-03','Harry Potter and the Goblet of Fire','J. K. Rowling','Bloomsbury','9788867156009','PR6068.O93 H371 2000','Available');
insert into Book values ('B0009-01','Harry Potter and the Deathly Hallows','J. K. Rowling','Bloomsbury','9780545010221','PR6068.O93 .H331 2007','Available');
insert into Book values ('B0009-02','Harry Potter and the Deathly Hallows','J. K. Rowling','Bloomsbury','9780545010221','PR6068.O93 .H331 2007','Available');
insert into Book values ('B0009-03','Harry Potter and the Deathly Hallows','J. K. Rowling','Bloomsbury','9780545010221','PR6068.O93 .H331 2007','Available');
insert into Book values ('B0010-01','The Da Vinci Code','Dan Brown','Doubleday','9789054448105','PS3552.R685434 D38 2003','Available');
insert into Book values ('B0010-02','The Da Vinci Code','Dan Brown','Doubleday','9789054448105','PS3552.R685434 D38 2003','Available');
insert into Book values ('B0010-03','The Da Vinci Code','Dan Brown','Doubleday','9789054448105','PS3552.R685434 D38 2003','Available');
insert into Book values ('B0010-04','The Da Vinci Code','Dan Brown','Doubleday','9789054448105','PS3552.R685434 D38 2003','Available');
insert into Book values ('B0010-05','The Da Vinci Code','Dan Brown','Doubleday','9789054448105','PS3552.R685434 D38 2003','Available');
insert into Book values ('B0011-01','Origin','Dan Brown','Doubleday','9783431039993','PS3552.R685434 O74 2017','Available');
insert into Book values ('B0011-02','Origin','Dan Brown','Doubleday','9783431039993','PS3552.R685434 O74 2017','Available');
insert into Book values ('B0011-03','Origin','Dan Brown','Doubleday','9783431039993','PS3552.R685434 O74 2017','Available');
insert into Book values ('B0011-04','Origin','Dan Brown','Doubleday','9783431039993','PS3552.R685434 O74 2017','Available');
insert into Book values ('B0012-01','Inferno','Dan Brown','Doubleday','9788375087123','PS3552.R685434 .I54 2014 ','Available');
insert into Book values ('B0012-02','Inferno','Dan Brown','Doubleday','9788375087123','PS3552.R685434 .I54 2014 ','Available');
insert into Book values ('B0012-03','Inferno','Dan Brown','Doubleday','9788375087123','PS3552.R685434 .I54 2014 ','Available');
insert into Book values ('B0012-04','Inferno','Dan Brown','Doubleday','9788375087123','PS3552.R685434 .I54 2014 ','Available');
insert into Book values ('B0012-05','Inferno','Dan Brown','Doubleday','9788375087123','PS3552.R685434 .I54 2014 ','Available');
insert into Book values ('B0013-01','The Lost Symbol','Dan Brown','Doubleday','9789021019796','PS3552.R685434 L671 2009 ','Available');
insert into Book values ('B0013-02','The Lost Symbol','Dan Brown','Doubleday','9789021019796','PS3552.R685434 L671 2009 ','Available');
insert into Book values ('B0013-03','The Lost Symbol','Dan Brown','Doubleday','9789021019796','PS3552.R685434 L671 2009 ','Available');
insert into Book values ('B0013-04','The Lost Symbol','Dan Brown','Doubleday','9789021019796','PS3552.R685434 L671 2009 ','Available');
insert into Book values ('B0013-05','The Lost Symbol','Dan Brown','Doubleday','9789021019796','PS3552.R685434 L671 2009 ','Available');
insert into Book values ('B0014-01','Angels and Demons','Dan Brown','Doubleday','9788495618771','PS3552.R685434 A82 2006 ','Available');
insert into Book values ('B0014-02','Angels and Demons','Dan Brown','Doubleday','9788495618771','PS3552.R685434 A82 2006 ','Available');
insert into Book values ('B0014-03','Angels and Demons','Dan Brown','Doubleday','9788495618771','PS3552.R685434 A82 2006 ','Available');
insert into Book values ('B0014-04','Angels and Demons','Dan Brown','Doubleday','9788495618771','PS3552.R685434 A82 2006 ','Available');
insert into Book values ('B0014-05','Angels and Demons','Dan Brown','Doubleday','9788495618771','PS3552.R685434 A82 2006 ','Available');
insert into Book values ('B0014-06','Angels and Demons','Dan Brown','Doubleday','9788495618771','PS3552.R685434 A82 2006 ','Available');
insert into Book values ('B0015-01','Digital Fortress','Dan Brown','Doubleday','9783785721940','PS3552.R685434 D54 1998','Available');
insert into Book values ('B0015-02','Digital Fortress','Dan Brown','Doubleday','9783785721940','PS3552.R685434 D54 1998','Available');
insert into Book values ('B0015-03','Digital Fortress','Dan Brown','Doubleday','9783785721940','PS3552.R685434 D54 1998','Available');
insert into Book values ('B0015-04','Digital Fortress','Dan Brown','Doubleday','9783785721940','PS3552.R685434 D54 1998','Available');
insert into Book values ('B0016-01','Bath Then and Now','Dan Brown','Doubleday','9780752466309','PS3552.R685434 H51 2013','Available');
insert into Book values ('B0016-02','Bath Then and Now','Dan Brown','Doubleday','9780752466309','PS3552.R685434 H51 2013','Available');
insert into Book values ('B0016-03','Bath Then and Now','Dan Brown','Doubleday','9780752466309','PS3552.R685434 H51 2013','Available');
insert into Book values ('B0016-04','Bath Then and Now','Dan Brown','Doubleday','9780752466309','PS3552.R685434 H51 2013','Available');
insert into Book values ('B0016-05','Bath Then and Now','Dan Brown','Doubleday','9780752466309','PS3552.R685434 H51 2013','Available');
insert into Book values ('B0017-01','The Adventures of Tom Sawyer','Mark Twain','Oxford University Press','9780194229364','PZ7.T93 Adv 2000','Available');
insert into Book values ('B0017-02','The Adventures of Tom Sawyer','Mark Twain','Oxford University Press','9780194229364','PZ7.T93 Adv 2000','Available');
insert into Book values ('B0017-03','The Adventures of Tom Sawyer','Mark Twain','Oxford University Press','9780194229364','PZ7.T93 Adv 2000','Available');
insert into Book values ('B0018-01','Don Quixote','Miguel de Cervantes Saavedra','Ware : Wordsworth Editions Limited','9781853260360','LCC','Available');
insert into Book values ('B0018-02','Don Quixote','Miguel de Cervantes Saavedra','Ware : Wordsworth Editions Limited','9781853260360','LCC','Available');
insert into Book values ('B0018-03','Don Quixote','Miguel de Cervantes Saavedra','Ware : Wordsworth Editions Limited','9781853260360','LCC','Available');
insert into Book values ('B0018-04','Don Quixote','Miguel de Cervantes Saavedra','Ware : Wordsworth Editions Limited','9781853260360','LCC','Available');
insert into Book values ('B0018-05','Don Quixote','Miguel de Cervantes Saavedra','Ware : Wordsworth Editions Limited','9781853260360','LCC','Available');
insert into Book values ('B0019-01','War and Peace','Leo Tolstoy','Oxford World Classics','9780192833983','PG3367.T8 .W253 ','Available');
insert into Book values ('B0019-02','War and Peace','Leo Tolstoy','Oxford World Classics','9780192833983','PG3367.T8 .W253 ','Available');
insert into Book values ('B0019-03','War and Peace','Leo Tolstoy','Oxford World Classics','9780192833983','PG3367.T8 .W253 ','Available');
insert into Book values ('B0019-04','War and Peace','Leo Tolstoy','Oxford World Classics','9780192833983','PG3367.T8 .W253 ','Available');
insert into Book values ('B0019-05','War and Peace','Leo Tolstoy','Oxford World Classics','9780192833983','PG3367.T8 .W253 ','Available');
insert into Book values ('B0020-01','Romeo and Juliet','William Shakespeare','Coles','9781472518354','PR2831.A2 .R76 2007','Available');
insert into Book values ('B0020-02','Romeo and Juliet','William Shakespeare','Coles','9781472518354','PR2831.A2 .R76 2007','Available');
insert into Book values ('B0020-03','Romeo and Juliet','William Shakespeare','Coles','9781472518354','PR2831.A2 .R76 2007','Available');
insert into Book values ('B0020-04','Romeo and Juliet','William Shakespeare','Coles','9781472518354','PR2831.A2 .R76 2007','Available');
insert into Book values ('B0020-05','Romeo and Juliet','William Shakespeare','Coles','9781472518354','PR2831.A2 .R76 2007','Available');
insert into Book values ('B0020-06','Romeo and Juliet','William Shakespeare','Coles','9781472518354','PR2831.A2 .R76 2007','Available');
insert into Book values ('B0020-07','Romeo and Juliet','William Shakespeare','Coles','9781472518354','PR2831.A2 .R76 2007','Available');
insert into Book values ('B0020-08','Romeo and Juliet','William Shakespeare','Coles','9781472518354','PR2831.A2 .R76 2007','Available');
insert into Book values ('B0021-01','Macbeth','William Shakespeare','New York : Regents Pub. Co.','9788496509290','PR2823.A2 .W33','Available');
insert into Book values ('B0021-02','Macbeth','William Shakespeare','New York : Regents Pub. Co.','9788496509290','PR2823.A2 .W33','Available');
insert into Book values ('B0021-03','Macbeth','William Shakespeare','New York : Regents Pub. Co.','9788496509290','PR2823.A2 .W33','Available');
insert into Book values ('B0022-01','Les Misérables','Victor Hugo','New York, Modern library','9780451525260','PQ2286 .W5 1931','Available');
insert into Book values ('B0022-02','Les Misérables','Victor Hugo','New York, Modern library','9780451525260','PQ2286 .W5 1931','Available');
insert into Book values ('B0022-03','Les Misérables','Victor Hugo','New York, Modern library','9780451525260','PQ2286 .W5 1931','Available');
insert into Book values ('B0022-04','Les Misérables','Victor Hugo','New York, Modern library','9780451525260','PQ2286 .W5 1931','Available');
insert into Book values ('B0023-01','The Sun Also Rises','Ernest Hemingway','New York, N.Y. : Scribner','9780743297332','PS3515.E37 S86 2006','Available');
insert into Book values ('B0023-02','The Sun Also Rises','Ernest Hemingway','New York, N.Y. : Scribner','9780743297332','PS3515.E37 S86 2006','Available');
insert into Book values ('B0023-03','The Sun Also Rises','Ernest Hemingway','New York, N.Y. : Scribner','9780743297332','PS3515.E37 S86 2006','Available');
insert into Book values ('B0023-04','The Sun Also Rises','Ernest Hemingway','New York, N.Y. : Scribner','9780743297332','PS3515.E37 S86 2006','Available');
insert into Book values ('B0023-05','The Sun Also Rises','Ernest Hemingway','New York, N.Y. : Scribner','9780743297332','PS3515.E37 S86 2006','Available');
insert into Book values ('B0024-01','A Game of Thrones','George R. R. Martin','HarperCollins','9780006479888','PS3563.A7239 .G36 2003','Available');
insert into Book values ('B0024-02','A Game of Thrones','George R. R. Martin','HarperCollins','9780006479888','PS3563.A7239 .G36 2003','Available');
insert into Book values ('B0024-03','A Game of Thrones','George R. R. Martin','HarperCollins','9780006479888','PS3563.A7239 .G36 2003','Available');
insert into Book values ('B0024-04','A Game of Thrones','George R. R. Martin','HarperCollins','9780006479888','PS3563.A7239 .G36 2003','Available');
insert into Book values ('B0024-05','A Game of Thrones','George R. R. Martin','HarperCollins','9780006479888','PS3563.A7239 .G36 2003','Available');
insert into Book values ('B0024-06','A Game of Thrones','George R. R. Martin','HarperCollins','9780006479888','PS3563.A7239 .G36 2003','Available');
insert into Book values ('B0025-01','A Clash of Kings','George R. R. Martin','HarperCollins','9789944824644','PS3563.A7239 .K73 2011  v. 1','Available');
insert into Book values ('B0025-02','A Clash of Kings','George R. R. Martin','HarperCollins','9789944824644','PS3563.A7239 .K73 2011  v. 1','Available');
insert into Book values ('B0025-03','A Clash of Kings','George R. R. Martin','HarperCollins','9789944824644','PS3563.A7239 .K73 2011  v. 1','Available');
insert into Book values ('B0025-04','A Clash of Kings','George R. R. Martin','HarperCollins','9789944824644','PS3563.A7239 .K73 2011  v. 1','Available');
insert into Book values ('B0025-05','A Clash of Kings','George R. R. Martin','HarperCollins','9789944824644','PS3563.A7239 .K73 2011  v. 1','Available');
insert into Book values ('B0025-06','A Clash of Kings','George R. R. Martin','HarperCollins','9789944824644','PS3563.A7239 .K73 2011  v. 1','Available');
insert into Book values ('B0026-01','A Clash of Kings','George R. R. Martin','HarperCollins','9789944824651','PS3563.A7239 .K73 2011  v. 2','Available');
insert into Book values ('B0026-02','A Clash of Kings','George R. R. Martin','HarperCollins','9789944824651','PS3563.A7239 .K73 2011  v. 2','Available');
insert into Book values ('B0026-03','A Clash of Kings','George R. R. Martin','HarperCollins','9789944824651','PS3563.A7239 .K73 2011  v. 2','Available');
insert into Book values ('B0026-04','A Clash of Kings','George R. R. Martin','HarperCollins','9789944824651','PS3563.A7239 .K73 2011  v. 2','Available');
insert into Book values ('B0026-05','A Clash of Kings','George R. R. Martin','HarperCollins','9789944824651','PS3563.A7239 .K73 2011  v. 2','Available');
insert into Book values ('B0026-06','A Clash of Kings','George R. R. Martin','HarperCollins','9789944824651','PS3563.A7239 .K73 2011  v. 2','Available');
insert into Book values ('B0027-01','A Storm of Swords','George R. R. Martin','HarperCollins','9780006479901','PS3563.A7239 S7 2003  v.1','Available');
insert into Book values ('B0027-02','A Storm of Swords','George R. R. Martin','HarperCollins','9780006479901','PS3563.A7239 S7 2003  v.1','Available');
insert into Book values ('B0027-03','A Storm of Swords','George R. R. Martin','HarperCollins','9780006479901','PS3563.A7239 S7 2003  v.1','Available');
insert into Book values ('B0027-04','A Storm of Swords','George R. R. Martin','HarperCollins','9780006479901','PS3563.A7239 S7 2003  v.1','Available');
insert into Book values ('B0027-05','A Storm of Swords','George R. R. Martin','HarperCollins','9780006479901','PS3563.A7239 S7 2003  v.1','Available');
insert into Book values ('B0027-06','A Storm of Swords','George R. R. Martin','HarperCollins','9780006479901','PS3563.A7239 S7 2003  v.1','Available');
insert into Book values ('B0028-01','A Storm of Swords','George R. R. Martin','HarperCollins','9780007119554','PS3563.A7239 S7 2003  v.2','Available');
insert into Book values ('B0028-02','A Storm of Swords','George R. R. Martin','HarperCollins','9780007119554','PS3563.A7239 S7 2003  v.2','Available');
insert into Book values ('B0028-03','A Storm of Swords','George R. R. Martin','HarperCollins','9780007119554','PS3563.A7239 S7 2003  v.2','Available');
insert into Book values ('B0028-04','A Storm of Swords','George R. R. Martin','HarperCollins','9780007119554','PS3563.A7239 S7 2003  v.2','Available');
insert into Book values ('B0028-05','A Storm of Swords','George R. R. Martin','HarperCollins','9780007119554','PS3563.A7239 S7 2003  v.2','Available');
insert into Book values ('B0028-06','A Storm of Swords','George R. R. Martin','HarperCollins','9780007119554','PS3563.A7239 S7 2003  v.2','Available');
insert into Book values ('B0029-01','A Feast for Crows','George R. R. Martin','HarperCollins','9780006486121','PS3563.A7239 F391 2011','Available');
insert into Book values ('B0029-02','A Feast for Crows','George R. R. Martin','HarperCollins','9780006486121','PS3563.A7239 F391 2011','Available');
insert into Book values ('B0029-03','A Feast for Crows','George R. R. Martin','HarperCollins','9780006486121','PS3563.A7239 F391 2011','Available');
insert into Book values ('B0029-04','A Feast for Crows','George R. R. Martin','HarperCollins','9780006486121','PS3563.A7239 F391 2011','Available');
insert into Book values ('B0029-05','A Feast for Crows','George R. R. Martin','HarperCollins','9780006486121','PS3563.A7239 F391 2011','Available');
insert into Book values ('B0029-06','A Feast for Crows','George R. R. Martin','HarperCollins','9780006486121','PS3563.A7239 F391 2011','Available');
insert into Book values ('B0030-01','A Dance with Dragons','George R. R. Martin','HarperCollins','9780006486114','PS3563.A7239 C53 2012  ','Available');
insert into Book values ('B0030-02','A Dance with Dragons','George R. R. Martin','HarperCollins','9780006486114','PS3563.A7239 C53 2012  ','Available');
insert into Book values ('B0030-03','A Dance with Dragons','George R. R. Martin','HarperCollins','9780006486114','PS3563.A7239 C53 2012  ','Available');
insert into Book values ('B0030-04','A Dance with Dragons','George R. R. Martin','HarperCollins','9780006486114','PS3563.A7239 C53 2012  ','Available');
insert into Book values ('B0030-05','A Dance with Dragons','George R. R. Martin','HarperCollins','9780006486114','PS3563.A7239 C53 2012  ','Available');
insert into Book values ('B0030-06','A Dance with Dragons','George R. R. Martin','HarperCollins','9780006486114','PS3563.A7239 C53 2012  ','Available');




insert into Ebook values ('E0001-01','1984','George Orwell','Harvill Secker','9781471331435');
insert into Ebook values ('E0002-01','Murder on the Orient Express','Agatha Cristie','HarperCollins','9780008249670');
insert into Ebook values ('E0003-01','Harry Potter and the Philosophers Stone','J. K. Rowling','Bloomsbury','9788498387070');
insert into EBook values ('E0004-01','Harry Potter and the Chamber of Secrets','J. K. Rowling','Bloomsbury','9780747560722');
insert into EBook values ('E0005-01','Harry Potter and the Prisoner of Azkaban','J. K. Rowling','Bloomsbury','9789994030149');
insert into EBook values ('E0006-01','Harry Potter and the Half-Blood Prince','J. K. Rowling','Bloomsbury','9781781101544');
insert into EBook values ('E0007-01','Harry Potter and the Order of the Phoenix','J. K. Rowling','Bloomsbury','9788498383621');
insert into EBook values ('E0008-01','Harry Potter and the Goblet of Fire','J. K. Rowling','Bloomsbury','9788867156009');
insert into EBook values ('E0009-01','Harry Potter and the Deathly Hallows','J. K. Rowling','Bloomsbury','9780545010221');
insert into EBook values ('E0010-01','The Da Vinci Code','Dan Brown','Doubleday','9789054448105');




insert into Journal values('J0001-01','Turkish contractors business development strategies for overseas markets','PEYMAN JAFERİ','Civil Engineering','2015','Available');
insert into Journal values('J0002-01','Parallel solution of linear system of equations','AYŞE YASEMİN SEYDİM','Computer Engineering and Computer Science and Control','1986','Available');
insert into Journal values('J0003-01','A closer look at rumination in adolescence: investigation of possible risk factors and moderators','SEVİNÇ AKKAYA','Psychology','2017','Available');
insert into Journal values('J0004-01','Urban spatial planning and socio-ethnic conflicts in Syria  -Analysis criticisms and proposals-','JAMAL INJEROU','Urban and Regional Planning','1990','Available');
insert into Journal values('J0005-01','Work related beliefs and perceived outcomes from participation: a research in Turkish industrial firms','SEMRA FERİHA AŞCIGİL','Sociology','1992','Available');
insert into Journal values('J0006-01','2-D and axisymmetric Euler solver for aerodynamic analysis and design','TAHSİN ÇETİNKAYA','Mechanical Engineering','1990','Available');
insert into Journal values('J0007-01','A Case study on the nature of theory choice the acceptance of Einsteins light quantum theory','ŞAHABETTİN DEMİREL','Philosophy','1988','Available');
insert into Journal values('J0008-01','A Framework for understanding modernism in architecture and architecture as a field of knowledge','EMEL AKÖZER','Architecture','1989','Available');
insert into Journal values('J0009-01','Faux riccati equation techniques for feedback control of nonlinear and time-varying systems','ANNA PRACH','Aeronautical Engineering','2015','Available');
insert into Journal values('J0010-01','Carbon-supported pt nanoparticles prepared by new surfactants and different reducing agents for methanol oxidation reaction','SEVDA SELİME KALYONCU','Chemistry','2015','Available');



insert into CD values ('C0001-01','One-X','Three Days Grace','Rock','2006','Available');
insert into CD values ('C0002-01','Toxicity','System of a Down','Metal','2003','Available');
insert into CD values ('C0003-01','Bir','Pentagram','Anatolian Rock','2002','Available');
insert into CD values ('C0004-01','Kötü Şeyler','Son Feci Bisiklet','Alternative','2017','Available');
insert into CD values ('C0005-01','Kill Em All','Metallica','Metal','1983','Available');
insert into CD values ('C0006-01','Ride The Lightning','Metallica','Metal','1984','Available');
insert into CD values ('C0007-01','Master Of Puppets','Metallica','Metal','1986','Available');
insert into CD values ('C0008-01','…And Justice For All','Metallica','Metal','1988','Available');
insert into CD values ('C0009-01','Metallica(Black Album)','Metallica','Metal','1991','Available');
insert into CD values ('C0010-01','Load','Metallica','Metal','1996','Available');
insert into CD values ('C0011-01','Reload','Metallica','Metal','1997','Available');
insert into CD values ('C0012-01','Some Kind Of Monster','Metallica','Metal','2004','Available');
insert into CD values ('C0013-01','Death Magnetic','Metallica','Metal','2008','Available');
insert into CD values ('C0014-01','Hardwire…To Self Destruct','Metallica','Metal','2016','Available');
insert into CD values ('C0015-01','Farewell My Summer Love','Michael Jackson','Pop','1984','Available');
insert into CD values ('C0016-01','Looking Back To Yesterday','Michael Jackson','Pop','1986','Available');
insert into CD values ('C0017-01','Love Songs','Michael Jackson','Pop','2002','Available');
insert into CD values ('C0018-01','Number Ones','Michael Jackson','Pop','2003','Available');
insert into CD values ('C0019-01','Gold','Michael Jackson','Pop','2008','Available');
insert into CD values ('C0020-01','Viya!','Kazım Koyuncu','Black Sea Local Music','2001','Available');
insert into CD values ('C0021-01','Hayde','Kazım Koyuncu','Black Sea Local Music','2004','Available');
insert into CD values ('C0022-01','Dünyada Bir Yerdeyim','Kazım Koyuncu','Black Sea Local Music','2006','Available');
insert into CD values ('C0023-01','White Flag','Dido','Single','2003','Available');
insert into CD values ('C0024-01','Edgar Card Sampler','Dido','Pop','2003','Available');
insert into CD values ('C0025-01','Dont Leave Home','Dido','Pop','2004','Available');
insert into CD values ('C0026-01','Life for Rent','Dido','Pop','2003','Available');
insert into CD values ('C0027-01','Sand In My Shoes','Dido','Pop','2004','Available');
insert into CD values ('C0028-01','Grafton Street','Dido','Single','2008','Available');
insert into CD values ('C0029-01','Grafton Street','Dido','Single','2008','Available');
insert into CD values ('C0030-01','No Angel','Dido','Pop','1999','Available');
insert into CD values ('C0031-01','Safe Trip Home','Dido','Pop','2008','Available');
insert into CD values ('C0032-01','Girl Who Got Away','Dido','Pop','2013','Available');
insert into CD values ('C0033-01','Sen Olsan Bari','Aleyna Tilki','Pop','2017','Available');
insert into CD values ('C0034-01','Cevapsız Çınlama','Aleyna Tilki','Pop','2016','Available');
insert into CD values ('C0035-01','Ah Neyleyim Gülüm','Müslüm Gürses','Arabesque','1982','Available');
insert into CD values ('C0036-01','Tanrı İstemezse','Müslüm Gürses','Arabesque','1986','Available');
insert into CD values ('C0037-01','Küskünüm','Müslüm Gürses','Arabesque','1986','Available');
insert into CD values ('C0038-01','Anlatamadım','Müslüm Gürses','Arabesque','1986','Available');
insert into CD values ('C0039-01','Saracak Dost Eli Yok','Müslüm Gürses','Arabesque','1986','Available');
insert into CD values ('C0040-01','Umutsuz Hayat','Müslüm Gürses','Arabesque','1987','Available');
insert into CD values ('C0041-01','Fark Etmez','Müslüm Gürses','Arabesque','1987','Available');
insert into CD values ('C0042-01','Öldürdüğün Yetmedi Mi','Müslüm Gürses','Arabesque','1987','Available');
insert into CD values ('C0043-01','Aldatılanlar','Müslüm Gürses','Arabesque','1989','Available');
insert into CD values ('C0044-01','Bir Fırtına Kopacak','Müslüm Gürses','Arabesque','1989','Available');
insert into CD values ('C0045-01','Bir Kadeh Daha Ver','Müslüm Gürses','Arabesque','1989','Available');
insert into CD values ('C0046-01','Arabeskin Devleri','Müslüm Gürses','Arabesque','1989','Available');
insert into CD values ('C0047-01','Güle Güle Git','Müslüm Gürses','Arabesque','1990','Available');
insert into CD values ('C0048-01','İstekleriniz','Müslüm Gürses','Arabesque','1991','Available');
insert into CD values ('C0049-01','Ömür Biter Aşk Bitmez','Müslüm Gürses','Arabesque','1992','Available');
insert into CD values ('C0050-01','Kullara Kul Yapmış','Müslüm Gürses','Arabesque','1992','Available');
insert into CD values ('C0051-01','Her Şey Yalan','Müslüm Gürses','Arabesque','1992','Available');
insert into CD values ('C0052-01','Ah Gülüm','Müslüm Gürses','Arabesque','1993','Available');
insert into CD values ('C0053-01','Dağlarda Kar Olsaydım','Müslüm Gürses','Arabesque','1993','Available');
insert into CD values ('C0054-01','Senden Vazgeçemem','Müslüm Gürses','Arabesque','1994','Available');
insert into CD values ('C0055-01','Bir Avuç Gözyaşı(Tövbe Etmek)','Müslüm Gürses','Arabesque','1995','Available');
insert into CD values ('C0056-01','Benim Meselem','Müslüm Gürses','Arabesque','1995','Available');
insert into CD values ('C0057-01','Nerelerdesin?','Müslüm Gürses','Arabesque','1997','Available');
insert into CD values ('C0058-01','Garipler','Müslüm Gürses','Arabesque','1999','Available');
insert into CD values ('C0059-01','Vay Canım','Müslüm Gürses','Arabesque','1999','Available');
insert into CD values ('C0060-01','Arkadaşım','Müslüm Gürses','Arabesque','1999','Available');
insert into CD values ('C0061-01','Zavallım','Müslüm Gürses','Arabesque','2000','Available');
insert into CD values ('C0062-01','Biz Babadan Böyle Gördük','Müslüm Gürses','Arabesque','2000','Available');
insert into CD values ('C0063-01','Sadece','Müslüm Gürses','Turkish Art Music','2001','Available');
insert into CD values ('C0064-01','Paramparça','Müslüm Gürses','Arabesque','2002','Available');
insert into CD values ('C0065-01','Güldür Yüzümü','Müslüm Gürses','Arabesque','2002','Available');
insert into CD values ('C0066-01','Yaranamadım','Müslüm Gürses','Arabesque','2002','Available');
insert into CD values ('C0067-01','Talihsizler','Müslüm Gürses','Arabesque','2002','Available');
insert into CD values ('C0068-01','Gitme','Müslüm Gürses','Arabesque','2002','Available');
insert into CD values ('C0069-01','Yıkıla Yıkıla','Müslüm Gürses','Arabesque','2002','Available');
insert into CD values ('C0070-01','Dertler İnsanı','Müslüm Gürses','Arabesque','2002','Available');
insert into CD values ('C0071-01','Mahsun Kul','Müslüm Gürses','Arabesque','2002','Available');
insert into CD values ('C0072-01','Esrarlı Gözler','Müslüm Gürses','Arabesque','2002','Available');
insert into CD values ('C0073-01','Kaçamamki Kaderimden','Müslüm Gürses','Arabesque','2003','Available');
insert into CD values ('C0074-01','Yanarım','Müslüm Gürses','Arabesque','2003','Available');
insert into CD values ('C0075-01','Bakma','Müslüm Gürses','Arabesque','2005','Available');
insert into CD values ('C0076-01','Aşk Tesadüfleri Sever','Müslüm Gürses','Arabesque','2006','Available');
insert into CD values ('C0077-01','Maziden Bir Demet','Müslüm Gürses','Arabesque','2008','Available');
insert into CD values ('C0078-01','Sandık','Müslüm Gürses','Arabesque','2009','Available');
insert into CD values ('C0079-01','Tanrı İstemezse','Müslüm Gürses','Arabesque','2009','Available');
insert into CD values ('C0080-01','Yalan Dünya','Müslüm Gürses','Arabesque','2010','Available');


insert into RoomAction values(2018052101,101,(to_date('2018-05-21','yyyy/mm/dd')),0, 0,0,49038295778,0,0);
insert into RoomAction values(2018052102,102,(to_date('2018-05-21','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052103,103,(to_date('2018-05-21','yyyy/mm/dd')),10389219044, null,null,null,null,49038295778);
insert into RoomAction values(2018052104,104,(to_date('2018-05-21','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052105,105,(to_date('2018-05-21','yyyy/mm/dd')),10389219044, 63278467233,null,null,null,null);
insert into RoomAction values(2018052106,106,(to_date('2018-05-21','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052107,107,(to_date('2018-05-21','yyyy/mm/dd')),10389219044, 58790425432,null,null,null,null);
insert into RoomAction values(2018052108,108,(to_date('2018-05-21','yyyy/mm/dd')),null, 49038295778,null,58790425432,null,null);
insert into RoomAction values(2018052109,109,(to_date('2018-05-21','yyyy/mm/dd')),10389219044, null,null,null,null,null);
insert into RoomAction values(2018052110,110,(to_date('2018-05-21','yyyy/mm/dd')),null, 49038295778,58790425432,null,null,null);
insert into RoomAction values(2018052201,101,(to_date('2018-05-22','yyyy/mm/dd')),null, 49038295778,null,null,null,null);
insert into RoomAction values(2018052202,102,(to_date('2018-05-22','yyyy/mm/dd')),null, 49038295778,58790425432,null,null,null);
insert into RoomAction values(2018052203,103,(to_date('2018-05-22','yyyy/mm/dd')),null, 49038295778,null,null,null,null);
insert into RoomAction values(2018052204,104,(to_date('2018-05-22','yyyy/mm/dd')),null, null,null,null,58790425432,null);
insert into RoomAction values(2018052205,105,(to_date('2018-05-22','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052206,106,(to_date('2018-05-22','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052207,107,(to_date('2018-05-22','yyyy/mm/dd')),10389219044, null,null,null,null,null);
insert into RoomAction values(2018052208,108,(to_date('2018-05-22','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052209,109,(to_date('2018-05-22','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052210,110,(to_date('2018-05-22','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052301,101,(to_date('2018-05-23','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052302,102,(to_date('2018-05-23','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052303,103,(to_date('2018-05-23','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052304,104,(to_date('2018-05-23','yyyy/mm/dd')),null, null,10389219044,null,null,null);
insert into RoomAction values(2018052305,105,(to_date('2018-05-23','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052306,106,(to_date('2018-05-23','yyyy/mm/dd')),null, null,10389219044,null,null,null);
insert into RoomAction values(2018052307,107,(to_date('2018-05-23','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052308,108,(to_date('2018-05-23','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052309,109,(to_date('2018-05-23','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052310,110,(to_date('2018-05-23','yyyy/mm/dd')),null, 10389219044,null,null,null,null);
insert into RoomAction values(2018052401,101,(to_date('2018-05-24','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052402,102,(to_date('2018-05-24','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052403,103,(to_date('2018-05-24','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052404,104,(to_date('2018-05-24','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052405,105,(to_date('2018-05-24','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052406,106,(to_date('2018-05-24','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052407,107,(to_date('2018-05-24','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052408,108,(to_date('2018-05-24','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052409,109,(to_date('2018-05-24','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052410,110,(to_date('2018-05-24','yyyy/mm/dd')),null, 10389219044,null,null,null,null);
insert into RoomAction values(2018052501,101,(to_date('2018-05-25','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052502,102,(to_date('2018-05-25','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052503,103,(to_date('2018-05-25','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052504,104,(to_date('2018-05-25','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052505,105,(to_date('2018-05-25','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052506,106,(to_date('2018-05-25','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052507,107,(to_date('2018-05-25','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052508,108,(to_date('2018-05-25','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052509,109,(to_date('2018-05-25','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052510,110,(to_date('2018-05-25','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052601,101,(to_date('2018-05-26','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052602,102,(to_date('2018-05-26','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052603,103,(to_date('2018-05-26','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052604,104,(to_date('2018-05-26','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052605,105,(to_date('2018-05-26','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052606,106,(to_date('2018-05-26','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052607,107,(to_date('2018-05-26','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052608,108,(to_date('2018-05-26','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052609,109,(to_date('2018-05-26','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052610,110,(to_date('2018-05-26','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052701,101,(to_date('2018-05-27','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052702,102,(to_date('2018-05-27','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052703,103,(to_date('2018-05-27','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052704,104,(to_date('2018-05-27','yyyy/mm/dd')),null, 24191130360,24191130360,24191130360,null,null);
insert into RoomAction values(2018052705,105,(to_date('2018-05-27','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052706,106,(to_date('2018-05-27','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052707,107,(to_date('2018-05-27','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052708,108,(to_date('2018-05-27','yyyy/mm/dd')),null, 24191130360,null,null,null,null);
insert into RoomAction values(2018052709,109,(to_date('2018-05-27','yyyy/mm/dd')),null, 24191130360,10389219044,24191130360,null,null);
insert into RoomAction values(2018052710,110,(to_date('2018-05-27','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052801,101,(to_date('2018-05-28','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052802,102,(to_date('2018-05-28','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052803,103,(to_date('2018-05-28','yyyy/mm/dd')),null, 24191130360,null,null,null,null);
insert into RoomAction values(2018052804,104,(to_date('2018-05-28','yyyy/mm/dd')),null, 24191130360,null,null,null,null);
insert into RoomAction values(2018052805,105,(to_date('2018-05-28','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052806,106,(to_date('2018-05-28','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052807,107,(to_date('2018-05-28','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052808,108,(to_date('2018-05-28','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052809,109,(to_date('2018-05-28','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052810,110,(to_date('2018-05-28','yyyy/mm/dd')),null, null,null,24191130360,null,null);
insert into RoomAction values(2018052901,101,(to_date('2018-05-29','yyyy/mm/dd')),null, null,24191130360,null,null,null);
insert into RoomAction values(2018052902,102,(to_date('2018-05-29','yyyy/mm/dd')),null, 24191130360,null,null,null,null);
insert into RoomAction values(2018052903,103,(to_date('2018-05-29','yyyy/mm/dd')),null, 24191130360,null,null,null,null);
insert into RoomAction values(2018052904,104,(to_date('2018-05-29','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052905,105,(to_date('2018-05-29','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052906,106,(to_date('2018-05-29','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052907,107,(to_date('2018-05-29','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052908,108,(to_date('2018-05-29','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052909,109,(to_date('2018-05-29','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018052910,110,(to_date('2018-05-29','yyyy/mm/dd')),null, 24191130360,null,null,null,null);
insert into RoomAction values(2018053001,101,(to_date('2018-05-30','yyyy/mm/dd')),null, null,24191130360,null,null,null);
insert into RoomAction values(2018053002,102,(to_date('2018-05-30','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018053003,103,(to_date('2018-05-30','yyyy/mm/dd')),null, null,24191130360,null,null,null);
insert into RoomAction values(2018053004,104,(to_date('2018-05-30','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018053005,105,(to_date('2018-05-30','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018053006,106,(to_date('2018-05-30','yyyy/mm/dd')),null, null,24191130360,null,null,null);
insert into RoomAction values(2018053007,107,(to_date('2018-05-30','yyyy/mm/dd')),null, null,24191130360,null,null,null);
insert into RoomAction values(2018053008,108,(to_date('2018-05-30','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018053009,109,(to_date('2018-05-30','yyyy/mm/dd')),null, null,null,null,null,null);
insert into RoomAction values(2018053010,110,(to_date('2018-05-30','yyyy/mm/dd')),null, null,null,null,null,null);




update Periodical
set MStatus = 'Unavailable'
where P_ID = P0005-01;

update RoomAction
set ho10_12 = 24191130360
where RD_ID = 2018053010;

update Room
set Status = 'Unavailable'
where RoomNo = '101';

update Action
set Fine = '5'
where Order_ID = 1;

update book
set Mstatus = 'Unavailable'
where B_ID = 'B0001-01';

update Device
set Mstatus = 'Unavailable'
where D_ID = 'D0001-01';

Update Client
set Fine = 5
where C_ID = 79039042930;

Update Ebook
set ISBN = 9781471331436
where E_ID =  'E0001-01';

Update Journal
set Pub_Year = '1984'
where J_ID = 'J0002-01';

Update CD
set Genre = 'Alternative Rock'
where CD_ID = C0001-01;

update CDGenre
set Release_Year = 1990
where Album_Name = 'Alb';

Delete from CDGenre
where Album_Name = 'Alb';
 

Delete from Periodical
where P_ID = P0005-01;

Delete from RoomAction
where RD_ID = 2018053010;

Delete from Room
where RoomNo = '101';

Delete from Action
where Order_ID = 1;

Delete from Book
where B_ID = 'B0029-03';

Delete from Device
where D_ID = 'D0001-01';

delete from Client
where Fname = 'Ulvi Umut';

delete from EBook
where Publisher = 'Harvill Secker';

delete from Journal
where J_ID = 'J0001-01';

Delete from CD
where M_ID = 'C0001-01';


// These two alter tables are a must!
// Note that we have already dropped these in the database
ALTER TABLE Client DROP COLUMN  fine;
ALTER TABLE Client DROP Column bookpicked;


