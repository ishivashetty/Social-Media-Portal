package com.social.ngo;

import java.sql.*;
import java.util.*;

public class AdminWorker 
{
	
	public static Admin loginVerify(String username, String password) {
		Admin admin = new Admin();
		try {
			String query = "select Id, EmailId from Admin where username=\"" + username + "\" and password=\""
					+ password + "\";";
			ResultSet rs = DatabaseConnector.getResultSet(query);
			while (rs.next()) {
				admin.setId(rs.getInt("Id"));
				admin.setEmailId(rs.getString("EmailId"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DatabaseConnector.closeConnection();
		}
		return admin;
	}
   
	
	public static String addAdmin(Admin admin)
   {
       String result = "";
       try
       {

           String query = "Insert into Admin (Id,EmailId,Username,Password) values (?,?,?,?)";
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setInt(1,admin.getId());
          pstmt.setString(2,admin.getEmailId());
          pstmt.setString(3,admin.getUsername());
          pstmt.setString(4,admin.getPassword());
           int i = pstmt.executeUpdate();
           if(i==1)
               result = Results.SUCCESS;
           else
               result = Results.FAILURE;
       }
       catch(Exception ex)
       {
           ex.printStackTrace();
           result = Results.PROBLEM;
       }
       finally
       {
           DatabaseConnector.closeConnection();
       }
       return result;
   }


   public static String updateAdmin(Admin admin)
   {
       String result = " ";
       try
       {

          String query = "Update Admin set EmailId=?, Username=?, Password=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);

           pstmt.setString(1,admin.getEmailId());
           pstmt.setString(2,admin.getUsername());
           pstmt.setString(3,admin.getPassword());
          pstmt.setInt(4,admin.getId());
           int i = pstmt.executeUpdate();
           if(i==1)
           {
               result = Results.SUCCESS;
           }
           else
           {
               result = Results.FAILURE;
           }
       }
       catch(Exception e)
       {
           e.printStackTrace();
           result = Results.PROBLEM;
       }
       finally
       {
           DatabaseConnector.closeConnection();
       }
       return result;
   }


   public static String deleteAdmin(int id)
   {
       String result = " ";
       try
       {

         String query = "Delete from Admin where Id="+id+";" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
           int i = pstmt.executeUpdate();
           if(i==1)
           {
               result = Results.SUCCESS;
           }
           else
           {
               result = Results.FAILURE;
           }
       }
       catch(Exception e)
       {
           e.printStackTrace();
           result = Results.PROBLEM;
       }
       finally
       {
           DatabaseConnector.closeConnection();
       }
       return result;
   }


   public static Admin getAdminById(int id) 
   {
       Admin admin = null;
       try
       {
           String query = "select * from Admin where Id =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               admin = new Admin();

                admin.setId(rs.getInt("Id"));
                admin.setEmailId(rs.getString("EmailId"));
                admin.setUsername(rs.getString("Username"));
                admin.setPassword(rs.getString("Password"));
           }
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       finally
       {
           DatabaseConnector.closeConnection();
       }
       return admin;
   }


   public static ArrayList<Admin> getAllAdmins()
   {
       ArrayList<Admin> list=new ArrayList<>();
       
       try
       {
           String query = "select * from Admin;" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               Admin admin = new Admin();

                admin.setId(rs.getInt("Id"));
                admin.setEmailId(rs.getString("EmailId"));
                admin.setUsername(rs.getString("Username"));
                admin.setPassword(rs.getString("Password"));
               list.add(admin);
               admin=null;
           }
       }
   catch(Exception e)
   {
       e.printStackTrace();
   }
   finally
   {
       DatabaseConnector.closeConnection();
   }
   return list;
   }
   
}