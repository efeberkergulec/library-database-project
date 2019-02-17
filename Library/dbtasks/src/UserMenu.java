
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class UserMenu {
	Scanner keyboard = new Scanner(System.in);
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	long id;
	static int Action_ID =30;

	public UserMenu(long id) {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			PreparedStatement pre = con.prepareStatement("SELECT Fname,Lname FROM Client where C_ID = ?");
			pre.setLong(1, id);
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			
			while(rs.next())
			{	
				System.out.println("*****************************************\n" + "Welcome to the database system, " + rs.getString(1) + " " + rs.getString(2));
				
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
		
		
		
		this.id = id;
		menu();
	}

	private void menu() {
		while (true) {
			System.out.println("*****************************************\n" + "Please select one of the operations:\n"
					+ "1) SHOW PERSONAL INFORMATION\n" + "2) AVAILABLE MATERIALS\n" + "3) BORROW MATERIAL\n"
					+ "4) MATERIALS IN-HAND\n"+ "5) MAKE PAYMENT\n" + "6) RESERVE ROOM\n" + "9) LOGOUT\n" + "0) EXIT\n"
					+ "*****************************************");
			int op = keyboard.nextInt();
			if (op == 9)
				return;
			if (op == 0) {
				System.out.println("****************THANK YOU****************");
				System.exit(0);
			}
			cases(op);
		}
	}

	private void cases(int op) {
		switch (op) {
		case 1:
			showPersonalInfo();
			break;
		case 2:
			availableMaterials();
			break;
		case 3:
			borrowMaterials();
			break;
		case 4:
			materialsInHand();
			break;
		case 5:
			makePayment();
			break;
		case 6:
			reserveRoom();
			break;
			
		default:
			System.out.println("There aren't any operation for your input. Please try again:");
			break;
		}
	}

	private void makePayment() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			PreparedStatement pre = con.prepareStatement("SELECT sum(Fine) FROM Action where C_ID = ?");
			PreparedStatement pre2 = con.prepareStatement("Update Action set fine = 0  where C_ID = ?");
			pre.setLong(1, id);
			pre2.setLong(1, id);
			// Execute SQL query
			rs = pre.executeQuery();
			rs = pre2.executeQuery();
			// process the result set
			
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
		System.out.println("Successfully paid the whole fine");
		
		
	}

	private void availableMaterials() {
		System.out
				.println("*****************************************\n" + "Which material type do you want to borrow:\n"
						+ "1) BOOK\n" + "2) DEVICE\n" + "3) CD\n" + "4) JOURNAL\n" + "5) PERIODICAL\n" + "6) EBOOK\n"
						+ "9) RETURN\n" + "0) EXIT\n" + "*****************************************");

		int op = keyboard.nextInt();
		if (op == 9)
			return;
		if (op == 0) {
			System.out.println("****************THANK YOU****************");
			System.exit(0);
		}
		availableCases(op);

	}

	private void showPersonalInfo() {
		// DISPLAYS PERSONAL INFORMATION OF THE USER
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			PreparedStatement pre = con.prepareStatement("SELECT * FROM Client where C_ID = ?");
			pre.setLong(1, id);
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("client_ID" + "\t" + "First Name" + "\t" + "Last Name" + "\t " + "Password" );
			while(rs.next())
			{	
				System.out.println(rs.getString(1) + "\t" + rs.getString(2) + "\t" + rs.getString(3) + "\t\t " + rs.getString(4));
				
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

	private void materialsInHand()
	// DISPLAYS THE ALREAY BORROWED MATERIALS OF THE USER
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			PreparedStatement pre = con.prepareStatement("Select M_id from Action where C_ID =? and return_date is null");
			pre.setLong(1, id); // Gives values to questioned area(?)
			st = con.createStatement();
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("Material_ID");
			while (rs.next()) {
				System.out.println(rs.getString(1));
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

	private void borrowMaterials() {

		System.out
		.println("*****************************************\n" + "Which material type do you want to borrow:\n"
				+ "1) BOOK\n" + "2) DEVICE\n" + "3) CD\n" + "4) JOURNAL\n" + "5) PERIODICAL\n" + "6) EBOOK\n"
				+ "9) RETURN\n" + "0) EXIT\n" + "*****************************************");

		int op = keyboard.nextInt();
		if (op == 9)
	return;
		if (op == 0) {
	System.out.println("****************THANK YOU****************");
	System.exit(0);
}
availableCases2(op);
		
		
		
		
	}
	// FOLLOWING FUCTIONS ARE FOR SHOWING AVALIABLE MATERIALS
	private void availableCases(int op) {
		//THESE OPTIONS ARE FOR SHOWING AVALIABLE MATERIALS

		switch (op) {
		case 1:
			callBook();
			break;
		case 2:
			callDevice();
			break;
		case 3:
			callCD();
			break;
		case 4:
			callJournal();
			break;
		case 5:
			callPeriodical();
			break;
		case 6:
			callEbook();
			break;
		default:
			System.out.println("There aren't any operation for your input. Please try again:");
			break;
		}
	}
	
	
	private void callCD() {
		System.out.println("Available CD's are:");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			PreparedStatement pre = con
					.prepareStatement("Select CD_id, Album_Name, Group_Name, Genre, Release_Year from CD where Mstatus = 'Available'");
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("-------------------------------------------------------------------------------------------------------------------------------------------------------");
			System.out.printf("| %8s | %50s | %30s | %30s | %12s |\n","CD_ID","Album Name","Group Name","Genre","Release Year");
			System.out.println("-------------------------------------------------------------------------------------------------------------------------------------------------------");
			while (rs.next()) {
				System.out.printf("| %8s | %50s | %30s | %30s | %12s |\n",rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
			}
			System.out.println("-------------------------------------------------------------------------------------------------------------------------------------------------------");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}

	private void callEbook() {
		System.out.println("Available e-books are:");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			PreparedStatement pre = con
					.prepareStatement("Select E_id, Title, Author from Ebook");
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			System.out.printf("| %8s | %120s | %100s |\n","E_ID","Title","Author");
			System.out.println("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			while (rs.next()) {
				System.out.printf("| %8s | %120s | %100s |\n",rs.getString(1),rs.getString(2),rs.getString(3));
			}
			System.out.println("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	private void callPeriodical() {
		System.out.println("Available periodicals are:");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			PreparedStatement pre = con
					.prepareStatement("Select P_id, Pname from Periodical where p_id in (select p_id from periodical where p_id not in (select m_id from action where return_date is null))");
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("---------------------------------------------------------------------");
			System.out.printf("| %8s | %50s |\n","P_ID","Periodical Name");
			System.out.println("---------------------------------------------------------------------");
			while (rs.next()) {
				System.out.printf("| %8s | %50s |\n",rs.getString(1),rs.getString(2));
			}
			System.out.println("---------------------------------------------------------------------");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	private void callJournal() {
		System.out.println("Available journals are:");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			PreparedStatement pre = con
					.prepareStatement("Select J_id, Title, Author, Category from Journal where Mstatus = 'Available'");
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			System.out.printf("| %8s | %150s | %100s | %60s |\n","J_ID","Title","Author","Category");
			System.out.println("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			
			while (rs.next()) {
				System.out.printf("| %8s | %150s | %100s | %60s |\n",rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
			}
			System.out.println("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	private void callDevice() {
		System.out.println("Available devices are:");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			PreparedStatement pre = con
					.prepareStatement("Select D_id, Dtype, Dname from Device where Mstatus = 'Available'");
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("---------------------------------------------------------------------------------");
			System.out.printf("| %8s | %25s | %40s |\n","E_ID","Title","Author");
			System.out.println("---------------------------------------------------------------------------------");
			while (rs.next()) {
				System.out.printf("| %8s | %25s | %40s |\n",rs.getString(1),rs.getString(2),rs.getString(3));
			}
			System.out.println("---------------------------------------------------------------------------------");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		
	}

	public void callBook() {
		System.out.println("Available books are:");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			PreparedStatement pre = con
					.prepareStatement("Select B_id, Title, Author from Book where Mstatus = 'Available'");
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			System.out.printf("| %8s | %120s | %100s |\n","J_ID","Title","Author");
			System.out.println("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			
			while (rs.next()) {
				System.out.printf("| %8s | %120s | %100s |\n",rs.getString(1),rs.getString(2),rs.getString(3));
			}
			System.out.println("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	public void BorrowingGeneralFunction()
	{
		System.out.println("Enter the material_ID you want to take");
		String str = keyboard.next();
		
		if((str.substring(0, 1)).equals("B"))
		{
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				// Get a connection
				con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
				st = con.createStatement();
				PreparedStatement pre = con.prepareStatement("insert into Action values(?,(to_date('2018-05-20','yyyy/mm/dd')),null,(to_date('2018-06-10','yyyy/mm/dd')),?,?,0)");
				pre.setInt(1, Action_ID);
				pre.setLong(2,id);
				pre.setString(3, str);
				// Execute SQL query
				rs = pre.executeQuery();
				// process the result set
				System.out.println("Data added successfully." );
				
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
	
	// FOLLOWING FUNCTIONS ARE FOR GETTING NEW MATERIALS FOR A USER
	private void availableCases2(int op) {
		//THESE OPTIONS ARE FOR SHOWING AVALIABLE MATERIALS

		switch (op) {
		case 1:
			BorrowBook();
			break;
		case 2:
			BorrowDevice();
			break;
		case 3:
			BorrowCD();
			break;
		case 4:
			BorrowJournal();
			break;
		case 5:
			BorrowPeriodical();
			break;
		case 6:
			BorrowEbook();
			break;
		default:
			System.out.println("There aren't any operation for your input. Please try again:");
			break;
		}
	}

	private void BorrowEbook() {
		System.out.println("Enter the material_ID you want to take");
		String str = keyboard.next();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			PreparedStatement pre = con.prepareStatement("insert into Action values(?,(to_date('2018-05-20','yyyy/mm/dd')),null,(to_date('2018-06-10','yyyy/mm/dd')),?,?,0)");
			pre.setInt(1, Action_ID++);
			pre.setLong(2,id);
			pre.setString(3, str);
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("Data added successfully." );
			
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
		
	private void reserveRoom()
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			System.out.println("Which day do you want to reserve room?(yyyymmdd)");

			String inp = keyboard.next();

			st = con.createStatement();

			PreparedStatement pre = con.prepareStatement(
					"select RoomNo, Ho10_12, Ho12_14, Ho14_16, Ho16_18, Ho18_20, Ho20_22 from RoomAction where substr(RD_ID,1,8) = ?");

			pre.setString(1, inp);
			rs = pre.executeQuery();

			while (rs.next())

			{
				System.out.printf("%3d | %11s | %11s | %11s | %11s | %11s | %11s |\n", rs.getInt(1), rs.getString(2),
						rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}

			if (rs != null)
				System.out.println("Available rooms are marked with null\n");
			else {
				System.out.println("No available rooms in that date.");
				return;
			}
			System.out.println("Please select the room you want to take(e.g101)");
			String roomno = keyboard.next();
			String newRID = inp.concat(roomno.substring(1, 3));

			System.out.println("Please select an appropriate hour(e.g Ho10_12) below table");
			String hour = keyboard.next();

			PreparedStatement prep = con.prepareStatement("Select ? from RoomAction where RD_ID = ?");
			prep.setString(1, hour);
			prep.setString(2, newRID);
			
			ResultSet rs2 = prep.executeQuery();
			
			if (rs2 != null) {
				switch (hour) {
				case "Ho10_12":
					PreparedStatement pre2 = con.prepareStatement("Update RoomAction set Ho10_12 = ? where RD_ID = ?");
					pre2.setLong(1, id);
					pre2.setString(2, newRID);
					rs = pre2.executeQuery();
					break;

				case "Ho12_14":
					PreparedStatement pre3 = con.prepareStatement("Update RoomAction set Ho12_14 = ? where RD_ID = ?");
					pre3.setLong(1, id);
					pre3.setString(2, newRID);
					rs = pre3.executeQuery();
					break;

				case "Ho14_16":
					PreparedStatement pre4 = con.prepareStatement("Update RoomAction set Ho14_16 = ? where RD_ID = ?");
					pre4.setLong(1, id);
					pre4.setString(2, newRID);
					rs = pre4.executeQuery();
					break;

				case "Ho16_18":
					PreparedStatement pre5 = con.prepareStatement("Update RoomAction set Ho16_18 = ? where RD_ID = ?");

					pre5.setLong(1, id);
					pre5.setString(2, newRID);
					rs = pre5.executeQuery();
					break;

				case "Ho20_22":
					PreparedStatement pre6 = con.prepareStatement("Update RoomAction set Ho20_22 = ? where RD_ID = ?");

					pre6.setLong(1, id);
					pre6.setString(2, newRID);
					rs = pre6.executeQuery();
					break;
				default:
					break;
				}
				System.out.println("Successfully updated.");
			}
			else	System.out.println("Someone's reserved is that interval before");

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

	private void BorrowPeriodical() {
		// TODO Auto-generated method stub
		System.out.println("Enter the material_ID you want to take");
		String str = keyboard.next();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			PreparedStatement pre = con.prepareStatement("insert into Action values(?,(to_date('2018-05-20','yyyy/mm/dd')),null,(to_date('2018-06-10','yyyy/mm/dd')),?,?,0)");
			pre.setInt(1, Action_ID++);
			pre.setLong(2,id);
			pre.setString(3, str);
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("Data added successfully." );
			
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

	private void BorrowJournal() {
		// TODO Auto-generated method stub
		System.out.println("Enter the material_ID you want to take");
		String str = keyboard.next();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			PreparedStatement pre = con.prepareStatement("insert into Action values(?,(to_date('2018-05-20','yyyy/mm/dd')),null,(to_date('2018-06-10','yyyy/mm/dd')),?,?,0)");
			pre.setInt(1, Action_ID++);
			pre.setLong(2,id);
			pre.setString(3, str);
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("Data added successfully." );
			
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

	private void BorrowCD() {
		// TODO Auto-generated method stub
		System.out.println("Enter the material_ID you want to take");
		String str = keyboard.next();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			PreparedStatement pre = con.prepareStatement("insert into Action values(?,(to_date('2018-05-20','yyyy/mm/dd')),null,(to_date('2018-06-10','yyyy/mm/dd')),?,?,0)");
			pre.setInt(1, Action_ID++);
			pre.setLong(2,id);
			pre.setString(3, str);
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("Data added successfully." );
			
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

	private void BorrowDevice() {
		// TODO Auto-generated method stub
		System.out.println("Enter the material_ID you want to take");
		String str = keyboard.next();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			PreparedStatement pre = con.prepareStatement("insert into Action values(?,(to_date('2018-05-20','yyyy/mm/dd')),null,(to_date('2018-06-10','yyyy/mm/dd')),?,?,0)");
			pre.setInt(1, Action_ID++);
			pre.setLong(2,id);
			pre.setString(3, str);
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("Data added successfully." );
			
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

	private void BorrowBook() {
		System.out.println("Enter the material_ID you want to take");
		String str = keyboard.next();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
			st = con.createStatement();
			PreparedStatement pre = con.prepareStatement("insert into Action values(?,(to_date('2018-05-20','yyyy/mm/dd')),null,(to_date('2018-06-10','yyyy/mm/dd')),?,?,0)");
			pre.setInt(1, Action_ID++);
			pre.setLong(2,id);
			pre.setString(3, str);
			// Execute SQL query
			rs = pre.executeQuery();
			// process the result set
			System.out.println("Data added successfully." );
			
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
	
