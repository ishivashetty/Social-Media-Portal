package com.social.ngo;

import java.sql.*;
import java.util.*;

public class ManagementWorker 
{
	public static final String path = "D://Dropbox//Eclipse//NGO//WebContent//Images//";
	public static final String jspPath = "Images//";

	public static String getPath() {
		return (path);
	}
	
	public static String getJspPath() {
		return (jspPath);
	}
	
	public static String addManagement(Management mgmt)
   {
       String result = "";
       try
       {

           String query = "Insert into Management (Id,Name,EmailId,Password,ProfilePhoto,MobileNo) values (?,?,?,?,?,?)";
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setInt(1,mgmt.getId());
          pstmt.setString(2,mgmt.getName());
          pstmt.setString(3,mgmt.getEmailId());
          pstmt.setString(4,mgmt.getPassword());
          pstmt.setString(5,mgmt.getProfilePhoto());
          pstmt.setString(6,mgmt.getMobileNo());
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


   public static String updateManagement(Management mgmt)
   {
       String result = " ";
       try
       {

          String query = "Update Management set Name=?, EmailId=?, Password=?, ProfilePhoto=?, MobileNo=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);

           pstmt.setString(1,mgmt.getName());
           pstmt.setString(2,mgmt.getEmailId());
           pstmt.setString(3,mgmt.getPassword());
           pstmt.setString(4,mgmt.getProfilePhoto());
           pstmt.setString(5,mgmt.getMobileNo());
          pstmt.setInt(6,mgmt.getId());
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


   public static String deleteManagement(int id)
   {
       String result = " ";
       try
       {

         String query = "Delete from Management where Id="+id+";" ;
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


   public static Management getManagementById(int id) 
   {
       Management mgmt = null;
       try
       {
           String query = "select * from Management where Id =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               mgmt = new Management();

                mgmt.setId(rs.getInt("Id"));
                mgmt.setName(rs.getString("Name"));
                mgmt.setEmailId(rs.getString("EmailId"));
                mgmt.setPassword(rs.getString("Password"));
                mgmt.setProfilePhoto(rs.getString("ProfilePhoto"));
                mgmt.setMobileNo(rs.getString("MobileNo"));
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
       return mgmt;
   }


   public static ArrayList<Management> getAllManagements()
   {
       ArrayList<Management> list=new ArrayList<>();
       
       try
       {
           String query = "select * from Management;" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               Management mgmt = new Management();

                mgmt.setId(rs.getInt("Id"));
                mgmt.setName(rs.getString("Name"));
                mgmt.setEmailId(rs.getString("EmailId"));
                mgmt.setPassword(rs.getString("Password"));
                mgmt.setProfilePhoto(rs.getString("ProfilePhoto"));
                mgmt.setMobileNo(rs.getString("MobileNo"));
               list.add(mgmt);
               mgmt=null;
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
   
   public static Management loginVerify(String username, String password) {
		Management mgmt = new Management();
		try {
			String query = "select Id, Name from Management where EmailId=\"" + username + "\" and password=\""
					+ password + "\";";
			ResultSet rs = DatabaseConnector.getResultSet(query);
			while (rs.next()) {
				mgmt.setId(rs.getInt("Id"));
				mgmt.setName(rs.getString("Name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DatabaseConnector.closeConnection();
		}
		return mgmt;
	}
   
   public static String updateProfilePhoto(int id,String photo)
   {
       String result = " ";
       try
       {

          String query = "Update Management set ProfilePhoto=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
           pstmt.setString(1,photo);
           pstmt.setInt(2,id);
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
   
   public static String updateEmailId(int id,String emailId)
   {
       String result = " ";
       try
       {

          String query = "Update Management set EmailId=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
           pstmt.setString(1,emailId);
           pstmt.setInt(2,id);
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
   
   public static String updateMobileNo(int id,String mobileNo)
   {
       String result = " ";
       try
       {

          String query = "Update Management set MobileNo=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
           pstmt.setString(1,mobileNo);
           pstmt.setInt(2,id);
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
   
}