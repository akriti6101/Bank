package com.training.bank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;

import com.training.Bean.CustomerBean;

public class CustomerDisplay {
	
		public List<CustomerBean> getCustomers()
		{
			List<CustomerBean> ls = new ArrayList<CustomerBean>();
			String user = "root";
			String password = "root";
			try {

				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Connection myconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", user, password);
				String query = "select * from customer";
				Statement st = myconn.createStatement();
				ResultSet rs = null;
				rs = st.executeQuery(query);
				

				while (rs.next()) {
					CustomerBean cb = new CustomerBean();
					cb.setName(rs.getString("name"));
					cb.setEmail(rs.getString("email"));
					cb.setAcctno(rs.getString("acctno"));
					cb.setBalance(rs.getInt("balance"));
					ls.add(cb);
				}
				//st.close();
				//myconn.close();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
      return ls;
		}
		
		public ResultSet getConnect(String val) throws SQLException
		{
			ResultSet rs = null;
			try {
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			Connection myconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
			String query = "select * from customer where name='"+val+"'";
			Statement st = myconn.createStatement();
			
			rs = st.executeQuery(query);
					
			//myconn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
return rs;
		}
		
		public void update(String str,String val)
		{
			
			try {
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			Connection myconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
			String query = "update customer set balance='"+val+"' where name='"+str+"'";
			Statement st = myconn.createStatement();
			
			int r = st.executeUpdate(query);
			//st.close();
			//myconn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
		
		}

		
}
