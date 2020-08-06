package com.social.ngo;

import java.sql.*;
import java.util.*;

public class MemberWorker 
{
	public static final String path = "D://Dropbox//Eclipse//NGO//WebContent//Images//";
	public static final String jspPath = "Images//";

	public static String getPath() {
		return (path);
	}
	
	public static String getJspPath() {
		return (jspPath);
	}
	
	
	public static String addMember(Member memb)
   {
       String result = "";
       try
       {

          String query = "Insert into Member (Id,Name,EmailId,Password,MobileNo,ProfilePhoto,Gender,Address,Dob) values (?,?,?,?,?,?,?,?,?)";
          PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setInt(1,memb.getId());
          pstmt.setString(2,memb.getName());
          pstmt.setString(3,memb.getEmailId());
          pstmt.setString(4,memb.getPassword());
          pstmt.setString(5,memb.getMobileNo());
          pstmt.setString(6,"user.jpg");
          pstmt.setString(7,memb.getGender());
          pstmt.setString(8,memb.getAddress());
          pstmt.setString(9,memb.getDob());
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


   public static String updateMember(Member memb)
   {
       String result = " ";
       try
       {

          String query = "Update Member set EmailId=?, MobileNo=?, Address=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
           pstmt.setString(1,memb.getEmailId());
           pstmt.setString(2,memb.getMobileNo());
           pstmt.setString(3,memb.getAddress());
           pstmt.setInt(4,memb.getId());
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

          String query = "Update Member set EmailId=? where Id=?;" ;
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

          String query = "Update Member set MobileNo=? where Id=?;" ;
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
   
   public static String updateAddress(int id,String address)
   {
       String result = " ";
       try
       {
          String query = "Update Member set Address=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
           pstmt.setString(1,address);
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
   
   public static String updateProfilePhoto(int id,String photo)
   {
       String result = " ";
       try
       {

          String query = "Update Member set ProfilePhoto=? where Id=?;" ;
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
   

   public static String deleteMember(int id)
   {
       String result = " ";
       try
       {

         String query = "Delete from Member where Id="+id+";" ;
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


   public static Member getMemberById(int id) 
   {
       Member memb = null;
       try
       {
           String query = "select * from Member where Id =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               memb = new Member();

                memb.setId(rs.getInt("Id"));
                memb.setName(rs.getString("Name"));
                memb.setEmailId(rs.getString("EmailId"));
                memb.setPassword(rs.getString("Password"));
                memb.setMobileNo(rs.getString("MobileNo"));
                memb.setProfilePhoto(rs.getString("ProfilePhoto"));
                memb.setGender(rs.getString("Gender"));
                memb.setAddress(rs.getString("Address"));
                memb.setDob(rs.getString("Dob"));
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
       return memb;
   }


   public static ArrayList<Member> getAllMembers()
   {
       ArrayList<Member> list=new ArrayList<>();
       
       try
       {
           String query = "select * from Member;" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               Member memb = new Member();

                memb.setId(rs.getInt("Id"));
                memb.setName(rs.getString("Name"));
                memb.setEmailId(rs.getString("EmailId"));
                memb.setPassword(rs.getString("Password"));
                memb.setMobileNo(rs.getString("MobileNo"));
                memb.setProfilePhoto(rs.getString("ProfilePhoto"));
                memb.setGender(rs.getString("Gender"));
                memb.setAddress(rs.getString("Address"));
                memb.setDob(rs.getString("Dob"));
               list.add(memb);
               memb=null;
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
   
   public static ArrayList<Member> memberSearch(String Search)
   {
	   ArrayList<Member> list=new ArrayList<>();
       try
       {
           String query = "select * from Member where Name like \""+Search+"%\";";
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               	Member memb = new Member();
                memb.setId(rs.getInt("Id"));
                memb.setName(rs.getString("Name"));
               	list.add(memb);
	       	memb=null;
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
   
   public static Member loginVerify(String username, String password) {
		Member memb = new Member();
		try {
			String query = "select Id, Name from Member where EmailId=\"" + username + "\" and password=\""
					+ password + "\";";
			ResultSet rs = DatabaseConnector.getResultSet(query);
			while (rs.next()) {
				memb.setId(rs.getInt("Id"));
				memb.setName(rs.getString("Name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DatabaseConnector.closeConnection();
		}
		return memb;
	}
   
   
}