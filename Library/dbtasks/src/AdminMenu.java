
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import java.util.*;

public class AdminMenu
{
	Scanner keyboard = new Scanner(System.in);
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;

	
	
	public AdminMenu() 
	{
		System.out.println("*****************************************\n"
						 + "Welcome to the Admin System");
		menu();
	}
	private void menu()
	{
		while(true)
		{
			System.out.println("*****************************************\n"
							 + "Please select one of the operations:\n"
							 + "1) SHOW USER INFORMATIONS\n"
							 + "2) ADD USER\n"
							 + "3) SHOW IN-HAND MATERIALS\n"
							 + "4) SHOW ROOMS\n"
							 + "5) DELETE RECORD\n"
							 + "6) UPDATE RECORD\n"
							 + "7) ADD MATERIAL\n"
							 + "9) LOGOUT\n"
							 + "0) EXIT\n"
							 + "*****************************************");
			int op = keyboard.nextInt();
			if(op == 9)	return;
			if(op == 0)	
			{
				System.out.println("****************THANK YOU****************");
				System.exit(0);
			}
			cases(op);
		}
	}
	private void cases(int op) {
		switch (op) {
		case 1:
			showUserInfos();
			break;
		case 2:
			addUser();
			break;
		case 3:
			inHandMaterials();
			break;
		case 4:
			showRooms();
			break;
		case 5:
			deleteRecord();
			break;
		case 6:
			updateRecord();
			break;
		case 7:
			addMaterial();
		default:
			break;
		}
		
	}
	
	/// ***** ADDS ***** ///
	
	private void addMaterial() {
		System.out
		.println("*****************************************\n" + "Which material type do you want to add:\n"
				+ "1) BOOK\n" + "2) DEVICE\n" + "3) CD\n" + "4) JOURNAL\n" + "5) PERIODICAL\n" + "6) EBOOK\n"
				+ "9) RETURN\n" + "0) EXIT\n" + "*****************************************");
		int op = keyboard.nextInt();
		if(op == 9)	return;
		if(op == 0)	
		{
			System.out.println("****************THANK YOU****************");
			System.exit(0);
		}
		addCases(op);
		
	}
	private void addCases(int op) {
		switch (op) {
		case 1:
			addBook();
			break;
		case 2:
			addDevice();
			break;
		case 3:
			addCD();
			break;
		case 4:
			addJournal();
			break;
		case 5:
			addPeriodical();
			break;
		case 6:
			addEbook();
			break;
		default:
			System.out.println("Invalid type.");
			break;
		}
		
	}
	private void addEbook() {
		System.out.println("Please enter the EbookID(8 char long) to be added.");
		String A1 = keyboard.next();
		System.out.println("Please enter the Title of the Ebook");
		String A2 = keyboard.next();
		System.out.println("Please enter the Author of the Ebook");
		String A3 = keyboard.next();
		System.out.println("Please enter the Publisher of the Ebook");
		String A4 = keyboard.next();
		System.out.println("Please enter the ISBN(13) of the Ebook");
		String A5 = keyboard.next();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			
			// process the result set
			PreparedStatement pre = con.prepareStatement("insert into EBook values(?,?,?,?,?)");
			pre.setString(1, A1);
			pre.setString(2, A2);
			pre.setString(3, A3);
			pre.setString(4, A4);
			pre.setString(5, A5);
			
			rs = pre.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("A material with this ID already exists");
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
		System.out.println("Successfuly added");
		
	}
	private void addPeriodical() {
		System.out.println("Please enter the PeriodicalID(8 char long) to be added.");
		String A1 = keyboard.next();
		System.out.println("Please enter the Issue date of the material");
		String A2 = keyboard.next();
		System.out.println("Please enter the ISSN(13) of the material");
		String A3 = keyboard.next();
		System.out.println("Please enter the Periodical name of the material");
		String A4 = keyboard.next();
		System.out.println("Please enter the Status of the material");
		String A5 = keyboard.next();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			
			// process the result set
			PreparedStatement pre = con.prepareStatement("insert into Periodical values(?,?,?,?,?)");
			pre.setString(1, A1);
			pre.setString(2, A2);
			pre.setString(3, A3);
			pre.setString(4, A4);
			pre.setString(5, A5);
			
			rs = pre.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("A material with this ID already exists");
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
		System.out.println("Successfuly added");
		
	}
	private void addJournal() {
		System.out.println("Please enter the JournalID(8 char long) to be added.");
		String A1 = keyboard.next();
		System.out.println("Please enter the Title of the material");
		String A2 = keyboard.next();
		System.out.println("Please enter the Author of the material");
		String A3 = keyboard.next();
		System.out.println("Please enter the Category name of the material");
		String A4 = keyboard.next();
		System.out.println("Please enter the Publication year of the material");
		String A5 = keyboard.next();
		System.out.println("Please enter the Status of the material");
		String A6 = keyboard.next();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			
			// process the result set
			PreparedStatement pre = con.prepareStatement("insert into Journal values(?,?,?,?,?,?)");
			pre.setString(1, A1);
			pre.setString(2, A2);
			pre.setString(3, A3);
			pre.setString(4, A4);
			pre.setString(5, A5);
			pre.setString(6, A6);
			
			rs = pre.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("A material with this ID already exists");
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
		System.out.println("Successfuly added");
		
	}
	private void addCD() {
		System.out.println("Please enter the CD_ID(8 char long) to be added.");
		String A1 = keyboard.next();
		System.out.println("Please enter the Album name of the material");
		String A2 = keyboard.next();
		System.out.println("Please enter the Group name of the material");
		String A3 = keyboard.next();
		System.out.println("Please enter the Genre name of the material");
		String A4 = keyboard.next();
		System.out.println("Please enter the Release year of the material");
		String A5 = keyboard.next();
		System.out.println("Please enter the Status of the material");
		String A6 = keyboard.next();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			
			// process the result set
			PreparedStatement pre = con.prepareStatement("insert into CD values(?,?,?,?,?,?)");
			pre.setString(1, A1);
			pre.setString(2, A2);
			pre.setString(3, A3);
			pre.setString(4, A4);
			pre.setString(5, A5);
			pre.setString(6, A6);
			
			rs = pre.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("A material with this ID already exists");
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
		System.out.println("Successfuly added");
		
	}
	private void addDevice() {
		System.out.println("Please enter the DeviceID(8 char long) to be added.");
		String A1 = keyboard.next();
		System.out.println("Please enter the Device type of the material");
		String A2 = keyboard.next();
		System.out.println("Please enter the Device name of the material");
		String A3 = keyboard.next();
		System.out.println("Please enter the Status of the material");
		String A4 = keyboard.next();

		
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			
			// process the result set
			PreparedStatement pre = con.prepareStatement("insert into Device values(?,?,?,?)");
			pre.setString(1, A1);
			pre.setString(2, A2);
			pre.setString(3, A3);
			pre.setString(4, A4);

			
			rs = pre.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("A material with this ID already exists");
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
		System.out.println("Successfuly added");
		
	}
	private void addBook() {
		System.out.println("Please enter the Book_ID(8 char long) to be added.");
		String A1 = keyboard.next();
		System.out.println("Please enter the Title name of the material");
		String A2 = keyboard.next();
		System.out.println("Please enter the Author name of the material");
		String A3 = keyboard.next();
		System.out.println("Please enter the Publisher name of the material");
		String A4 = keyboard.next();
		System.out.println("Please enter the ISBN(13) year of the material");
		String A5 = keyboard.next();
		System.out.println("Please enter the LCC of the material");
		String A6 = keyboard.next();
		System.out.println("Please enter the Status of the material");
		String A7 = keyboard.next();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			
			// process the result set
			PreparedStatement pre = con.prepareStatement("insert into Book values(?,?,?,?,?,?,?)");
			pre.setString(1, A1);
			pre.setString(2, A2);
			pre.setString(3, A3);
			pre.setString(4, A4);
			pre.setString(5, A5);
			pre.setString(6, A6);
			pre.setString(7, A7);
			
			rs = pre.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("A material with this ID already exists");
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
		System.out.println("Successfuly added");
		
	}
	/// ***** DELETES ***** ///
	
	
	private void deleteRecord() {
		System.out
		.println("*****************************************\n" + "Which material type do you want to delete:\n"
				+ "1) BOOK\n" + "2) DEVICE\n" + "3) CD\n" + "4) JOURNAL\n" + "5) PERIODICAL\n" + "6) Ebook\n"
				+ "9) RETURN\n" + "0) EXIT\n" + "*****************************************");
		int op = keyboard.nextInt();
		if(op == 9)	return;
		if(op == 0)	
		{
			System.out.println("****************THANK YOU****************");
			System.exit(0);
		}
		deleteCases(op);
	}
	
	
	
	private void deleteCases(int op) {
		switch (op) {
		case 1:
			deleteBook();
			break;
		case 2:
			deleteDevice();
			break;
		case 3:
			deleteCD();
			break;
		case 4:
			deleteJournal();
			break;
		case 5:
			deletePeriodical();
			break;
		case 6:
			deleteEbook();
			break;
		default:
			System.out.println("Invalid type.");
			break;
		}
		
	}
	
	
	
	
	private void deleteEbook() {
		// Deletes an existing record
		System.out.println("Please enter the ID of Ebook to be deleted");
		String OrderId = keyboard.next();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			
			// process the result set
			PreparedStatement pre = con.prepareStatement("Delete from Ebook where E_ID = ?");
			pre.setString(1, OrderId);
			rs = pre.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
		System.out.println("Successfuly deleted");
		
	}
	private void deletePeriodical() {
		// Deletes an existing record
				System.out.println("Please enter the ID of Periodical to be deleted");
				String OrderId = keyboard.next();
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					// Get a connection
					con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
					st = con.createStatement();
					// Execute SQL query
					
					// process the result set
					PreparedStatement pre = con.prepareStatement("Delete from Periodical where P_ID = ?");
					pre.setString(1, OrderId);
					rs = pre.executeQuery();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						rs.close();
						st.close();
						con.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				} 
				System.out.println("Successfuly deleted");
				
		
	}
	private void deleteJournal() {
		// Deletes an existing record
				System.out.println("Please enter the ID of Journal to be deleted");
				String OrderId = keyboard.next();
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					// Get a connection
					con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
					st = con.createStatement();
					// Execute SQL query
					
					// process the result set
					PreparedStatement pre = con.prepareStatement("Delete from Journal where J_ID = ?");
					pre.setString(1, OrderId);
					rs = pre.executeQuery();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						rs.close();
						st.close();
						con.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				} 
				System.out.println("Successfuly deleted");
				
		
	}
	private void deleteCD() {
		// Deletes an existing record
				System.out.println("Please enter the ID of CD to be deleted");
				String OrderId = keyboard.next();
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					// Get a connection
					con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
					st = con.createStatement();
					// Execute SQL query
					
					// process the result set
					PreparedStatement pre = con.prepareStatement("Delete from CD where C_ID = ?");
					pre.setString(1, OrderId);
					rs = pre.executeQuery();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						rs.close();
						st.close();
						con.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				} 
				System.out.println("Successfuly deleted");
				
		
	}
	private void deleteDevice() {
		// Deletes an existing record
				System.out.println("Please enter the ID of Device to be deleted");
				String OrderId = keyboard.next();
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					// Get a connection
					con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
					st = con.createStatement();
					// Execute SQL query
					
					// process the result set
					PreparedStatement pre = con.prepareStatement("Delete from Device where D_ID = ?");
					pre.setString(1, OrderId);
					rs = pre.executeQuery();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						rs.close();
						st.close();
						con.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				} 
				System.out.println("Successfuly deleted");
				
		
	}
	private void deleteBook() {
		// Deletes an existing record
				System.out.println("Please enter the ID of Book to be deleted");
				String OrderId = keyboard.next();
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					// Get a connection
					con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
					st = con.createStatement();
					// Execute SQL query
					
					// process the result set
					PreparedStatement pre = con.prepareStatement("Delete from Book where B_ID = ?");
					pre.setString(1, OrderId);
					rs = pre.executeQuery();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						rs.close();
						st.close();
						con.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				} 
				System.out.println("Successfuly deleted");
				
		
	}
	
	
	/// ***** UPDATES ***** ///
	
	
	
	private void updateRecord() {
		System.out
		.println("*****************************************\n" + "Which material type do you want to update:\n"
				+ "1) BOOK\n" + "2) DEVICE\n" + "3) CD\n" + "4) JOURNAL\n" + "5) PERIODICAL\n"
				+ "9) RETURN\n" + "0) EXIT\n" + "*****************************************");
		int op = keyboard.nextInt();
		if(op == 9)	return;
		if(op == 0)	
		{
			System.out.println("****************THANK YOU****************");
			System.exit(0);
		}
		updateCases(op);
	}
	private void updateCases(int op) {
		switch (op) {
		case 1:
			updateBook();
			break;
		case 2:
			updateDevice();
			break;
		case 3:
			updateCD();
			break;
		case 4:
			updateJournal();
			break;
		case 5:
			updatePeriodical();
			break;
		default:
			System.out.println("Invalid type.");
			break;
		}
		
	}
	private void updatePeriodical() {
		System.out.println("Please enter the Periodical_ID to be changed");
		String OrderId = keyboard.next();
		System.out.println("Please type the status of the book");
		String str = keyboard.next();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			
			// process the result set
			PreparedStatement pre = con.prepareStatement("Update Periodical set Mstatus = ? where P_ID = ?");
			pre.setString(1, str);
			pre.setString(2, OrderId);
			rs = pre.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
		System.out.println("Successfuly updated");
		
	}
	private void updateJournal() {
		System.out.println("Please enter the Journal_ID to be changed");
		String OrderId = keyboard.next();
		System.out.println("Please type the status of the book");
		String str = keyboard.next();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			
			// process the result set
			PreparedStatement pre = con.prepareStatement("Update Journal set Mstatus = ? where J_ID = ?");
			pre.setString(1, str);
			pre.setString(2, OrderId);
			rs = pre.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
		System.out.println("Successfuly updated");
		
	}
	private void updateCD() {
		System.out.println("Please enter the CD_ID to be changed");
		String OrderId = keyboard.next();
		System.out.println("Please type the status of the book");
		String str = keyboard.next();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			
			// process the result set
			PreparedStatement pre = con.prepareStatement("Update CD set Mstatus = ? where CD_ID = ?");
			pre.setString(1, str);
			pre.setString(2, OrderId);
			rs = pre.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
		System.out.println("Successfuly updated");
		
	}
	private void updateDevice() {
		System.out.println("Please enter the Device_ID to be changed");
		String OrderId = keyboard.next();
		System.out.println("Please type the status of the device");
		String str = keyboard.next();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			
			// process the result set
			PreparedStatement pre = con.prepareStatement("Update Device set Mstatus = ? where D_ID = ?");
			pre.setString(1, str);
			pre.setString(2, OrderId);
			rs = pre.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
		System.out.println("Successfuly updated");
		
	}
	private void updateBook() {
				System.out.println("Please enter the Book_ID to be changed");
				String OrderId = keyboard.next();
				System.out.println("Please type the status of the book");
				String str = keyboard.next();
				
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					// Get a connection
					con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
					st = con.createStatement();
					// Execute SQL query
					
					// process the result set
					PreparedStatement pre = con.prepareStatement("Update Book set Mstatus = ? where B_ID = ?");
					pre.setString(1, str);
					pre.setString(2, OrderId);
					rs = pre.executeQuery();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						rs.close();
						st.close();
						con.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				} 
				System.out.println("Successfuly updated");
		
	}
	
	//// ***** OTHER OPTIONS ***** ///
	
	private void showRooms() 
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			rs = st.executeQuery("SELECT * FROM Room");
			// process the result set
			System.out.println("RoomNumber" + "\t" + "Status" + "\t \t" + "Client_ID" );
			while(rs.next())
			{				
				System.out.println(rs.getString(1) + "\t \t" + rs.getString(2) + "\t" + rs.getString(3));
	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
	}
	private void inHandMaterials() 
	{
		System.out.println("Please enter the Client-ID ");
		String str = keyboard.next();
		
	
//		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");	
			PreparedStatement pre = con.prepareStatement("Select C_ID, M_id from Action where C_ID =? and return_date is null");
			pre.setString(1, str); // Gives values to questioned area(?)
			 st = con.createStatement();
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("Client_ID" + "\t" + "Material_ID");
			while(rs.next())
			{
				System.out.println(rs.getString(1) + " \t" + rs.getString(2));			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
	}
	private void addUser() 
	{
		String C_ID,FName,LName,C_Password;
		System.out.println("Please enter the client id");
		C_ID = keyboard.next();
		System.out.println("Please enter the first name of the user");
		FName = keyboard.next(); 
		System.out.println("Please enter the last name of the user");
		LName = keyboard.next(); 
		C_Password = C_ID.substring(0, 6);
		

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			PreparedStatement pre = con.prepareStatement("insert into Client values(?,?,?,?)");
			pre.setString(1, C_ID);
			pre.setString(2, FName);
			pre.setString(3, LName);
			pre.setString(4, C_Password);
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("Data added successfully." );
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("The ID already exists in the database");
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
	
		
		
		
	}
	private void showUserInfos() 
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			// Execute SQL query
			rs = st.executeQuery("SELECT * FROM Client");
			// process the result set
			System.out.println("client_ID" + "\t" + "First Name" + "\t" + "Last Name" );
			while(rs.next())
			{
				
				
				System.out.println(rs.getString(1) + "\t" + rs.getString(2) + "\t" + rs.getString(3));
				
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
	}
}

