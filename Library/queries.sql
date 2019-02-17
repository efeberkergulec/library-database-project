
// Finds the names of clients who are in debt.
select Fname, Lname
from Client 
where fine>0

// Finds the avaliable books in Action table
select Title
from Book
where Book.B_ID = some (
select Action.M_ID
from Action
where Fine= 0)

// Finds counts of people who have 
// exceed the due date.
select count(*)
from Client natural join Action
where due_date<return_date


// Finds the names of all clients who have ordered any material before
select distinct Fname
from Action inner join Client
on Action.C_ID = Client.C_ID


// Finds the Title of the book which 
// client with '10389219044' id has taken
select Book.title
from Book
where M_ID in (select M_ID
				from Action
				where C_ID = '10389219044')
	
// Finds the latest return date of a particular 	

select return_date
from action
where m_id= 'B0001-01' and return_date >=all(select return_date
				from action
				where m_id='B0001-01')
				
				
// Finds the sum of a particular Client
select sum(Fine)
from action
where C_ID = '49038295778';


				
				

//(is not null) Finds the number of days of a client who exceeded time limit
select sum (Return_Date-due_Date)
from action
where  (due_Date-Return_Date)<0 and Return_Date is not null;


// Finds the Clients who have reserved room and borrowed material
select Room.C_ID
from Room
INTERSECT(
select C_ID
from Action);


// Finds the titles of the books that are not in actions table
select Title
from Book
where Book.B_ID Not in
(select M_ID
from Action);

// Finds the title of the books that have been ordered before
select title 
from book natural join action
where action.m_id = some
(select action.m_id
from Action)

// Finds the latest return date of action table
select return_date
from action
where action.return_date>=all
(select return_date
from action
)

//(BETWEEN AND) Finds the Journals borrowed between certain dates
select distinct Title
from Journal natural join Action
where Journal.J_ID = Action.M_ID and Due_Date between (to_date('2018-03-04','yyyy/mm/dd')) and (to_date('2018-03-09','yyyy/mm/dd'));



// Finds the client and material ids that are not returned
select C_ID,M_ID
from Action 
where return_date is null;


//(AVG, GROUP BY)
// Finds the avarage return time of a item
select M_ID,avg(Return_Date-Pick_Date)
from action
group by m_ID;

//Finds the avarage return time of a itema who are larger than 20
select M_ID,avg(Return_Date-Pick_Date)
from action
group by m_ID
having avg(Return_Date-Pick_Date)>20;


//(NOT IN)
// Finds the books that are available
select b_id 
from book
where b_id not in (select m_id
from action where return_date is null)


// Lists the names and publication years of the journal authors in descending order.
select AUTHOR, Pub_Year
from Journal
order by  Pub_Year desc


// Finds the books that have been used in action table
select Title
from Book b
where exists
(select * from Action a
where b.B_ID = a.M_ID)
ORDER BY b.b_ID;

// Finds the maximum time(days) an orders due date has been exceeded
select max(Return_Date-Due_Date)
from Action ;




// Finds the count of genres that include 'rab'
select count(Genre)
from CD
where Genre like '%rab%';

// Finds unique book titles
select b1.Title
from Book b1
where unique
 (select b2.Title
 from Book b2
 where b2.title = b1.title)
 
// Displays the name and material of the person who has reserved Room101
Select Fname,Lname,M_ID
from (Room natural join Client) join Action using(C_ID)
where RoomNo = '101';

// Finds the people who have not taken any orders
Select Fname,LName,Action.C_ID
 from Client left outer join Action on
 Client.C_ID = Action.C_ID
where Action.C_ID is null;




//Shows the book id and the number of borrow of it
select b_id, (select count(*) from action where book.B_ID = action.m_ID) as numOfborrow from book;

//Shows the client id and the number of book that has not been returned
select c_id, (select count(*) from action where Client.C_ID = action.C_ID and action.return_date is null) as numOfbooksInHand from client;



	

//(FROM SUBQUERY) Finds the total fine

SELECT (total) 
FROM 
(SELECT SUM(fine) AS total FROM action );