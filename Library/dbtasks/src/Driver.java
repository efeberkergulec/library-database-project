import java.io.IOException;
import java.sql.*;
import java.util.*;
import oracle.net.aso.k;

public class Driver 
{
	public static void main(String[] args) throws IOException 
	{
		String password, id;
		Long Userid;
		int count;
		long i = 0;
		
		Scanner keyboard = new Scanner(System.in);
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a connection
			con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");
		//	con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.10.198.10");
		//	con = DriverManager.getConnection("jdbc:oracle:thin:isim/isim@127.0.0.1");
			
			// Create a statement
			st = con.createStatement();
			// Execute SQL query
			rs = st.executeQuery("SELECT * FROM Client");
			// process the result set
			/*while(rs.next())
			{
				System.out.println(rs.getString(2) + "\t" + rs.getString(3));
				
			
			}*/
			//st.executeUpdate(""); // Adds new queries to database
			PreparedStatement pre = con.prepareStatement("SELECT * FROM clients WHERE id == ? AND name == ?");
			pre.setString(2, "Efe Berk"); // Gives values to questioned area(?)
			pre.setInt(1, 24191130);	  // Gives values to questioned area(?)
		
			//ResultSet myRs = pre.executeQuery();
			
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

		System.out.println("**********LIBRARY USER DATABASE**********\n"
						 + "Please enter your ID and password\n" + "ID :");
		id = keyboard.next();
		
		
		System.out.println("Password:");
		password = keyboard.next();
		
		// Query
		
		
		
		
		
		
		
		count = 0;
		while (count < 3) 
		{	
			
			if(!id.equalsIgnoreCase("Admin"))
			{
				i = Long.parseLong(id);
				
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					// Get a connection
					con = DriverManager.getConnection("jdbc:oracle:thin:group1/5348@10.98.98.61");	
					PreparedStatement pre = con.prepareStatement("Select C_ID from CLient where C_ID =? and C_Password=?");
					pre.setString(1, id); // Gives values to questioned area(?)
					pre.setString(2, password);
//					PreparedStatement pre2 = con.prepareStatement("Select C_ID from CLient where C_ID =? and C_Password=?");
					 st = con.createStatement();
					// Execute SQL query
					rs = pre.executeQuery();
					// process the result set
					//if((rs.getString(1)) == null) {
					//	System.out.println("An error occured");
					//}
					
						UserMenu mn = new UserMenu(i);
					
					
				} catch (Exception e) {
					System.out.println("An error occured");
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
			if(i == 1234)
			{	
				if(password.equals("cmpe232"))
				{
//					Runtime.getRuntime().exec("clear");
					UserMenu mn = new UserMenu(Long.parseLong(id));
					count = 0;
				} 
				else 
				{
					System.out.println(
							"*****************************************\n" + "Your password is not matching with your ID.");
					count++;
				}
			}
			else if(id.equalsIgnoreCase("Admin"))
			{
				if(password.equals("cmpe232"))
				{
//					Runtime.getRuntime().exec("CLS");
					AdminMenu ad = new AdminMenu();
					count = 0;
				}
				else 
				{
					System.out.println(
							"*****************************************\n" + "Your password is not matching with your ID.");
					count++;
				}
			}
			else
			{
				System.out.println("*****************************************\n"
						+ "Your id is not matching any ID in this database.");
				count++;
				
				
			}
			if(count == 3)	
			{
				System.out.println("*****************************************\n"
								 + "Because you entered your information wrong\n"
								 + "3 times, we kicked you out from our system.\n"
								 + "*****************************************");
				break;
			}
			i = 0;
			System.out.println("*****************************************");
			if(count != 0)	System.out.println("Please re-enter your ID and password\n" + "ID :");
			else			System.out.println("Please enter your ID and password\n" + "ID :");
			id = keyboard.next();
			System.out.println("Password:");
			password = keyboard.next();
			
		}
		if(count < 3)
			System.out.println("****************THANK YOU****************");
	}
}
