package com.social.ngo;

import java.sql.*;
import java.util.*;

public class ShareWorker 
{
   public static String addShare(Share pShare)
   {
       String result = "";
       try
       {
           String query = "Insert into Share (Id,PostId,UserId,Status,Time) values (?,?,?,?,?)";
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setInt(1,pShare.getId());
          pstmt.setInt(2,pShare.getPostId());
          pstmt.setString(3,pShare.getUserId());
          pstmt.setString(4,pShare.getStatus());
          pstmt.setTimestamp(5,pShare.getTime());
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


   public static String updateShare(Share pShare)
   {
       String result = " ";
       try
       {

          String query = "Update Share set PostId=?, UserId=?, Status=?, Time=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);

           pstmt.setInt(1,pShare.getPostId());
           pstmt.setString(2,pShare.getUserId());
           pstmt.setString(3,pShare.getStatus());
           pstmt.setTimestamp(4,pShare.getTime());
          pstmt.setInt(5,pShare.getId());
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


   public static String deleteShare(int id)
   {
       String result = " ";
       try
       {

         String query = "Delete from Share where Id="+id+";" ;
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


   public static Share getShareById(int id) 
   {
       Share pShare = null;
       try
       {
           String query = "select * from Share where Id =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               pShare = new Share();

                pShare.setId(rs.getInt("Id"));
                pShare.setPostId(rs.getInt("PostId"));
                pShare.setUserId(rs.getString("UserId"));
                pShare.setStatus(rs.getString("Status"));
                pShare.setTime(rs.getTimestamp("Time"));
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
       return pShare;
   }


   public static ArrayList<Share> getAllShares()
   {
       ArrayList<Share> list=new ArrayList<>();
       
       try
       {
           String query = "select * from Share;" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               Share pShare = new Share();

                pShare.setId(rs.getInt("Id"));
                pShare.setPostId(rs.getInt("PostId"));
                pShare.setUserId(rs.getString("UserId"));
                pShare.setStatus(rs.getString("Status"));
                pShare.setTime(rs.getTimestamp("Time"));
               list.add(pShare);
               pShare=null;
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
   
   public static String shareStatusCheck(int postId,String userId)
   {
	   String status = "";
       try
       {
          String query = "Select Status from Share where PostId = \""+postId+"\" and UserId = \""+userId+"\";";
          ResultSet rs = DatabaseConnector.getResultSet(query);
          while(rs.next())
          {
        	  status = rs.getString("Status");
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
       return status;
   }
   
   public static void postShare(int postId, String userId)
   {
	   PreparedStatement pstmt = null;
	   String query = "";
	   String result = "";
       try
       {
    	  String status = ShareWorker.shareStatusCheck(postId, userId);
    	  if(status.equals(""))
    	  {
    		  query = "Insert into Share (Id,PostId,UserId,Status,Time) values (?,?,?,?,?)";
              pstmt = DatabaseConnector.getPreparedStatement(query);
              pstmt.setInt(1,0);
              pstmt.setInt(2,postId);
              pstmt.setString(3,userId);
              pstmt.setString(4,"shared");
              pstmt.setTimestamp(5,null);
    	  }
    	  else if(status.equals("unshared"))
    	  {
    		  query = "Update Share set Status=? where PostId=? and UserId=?";
              pstmt = DatabaseConnector.getPreparedStatement(query);
              pstmt.setString(1,"shared");
              pstmt.setInt(2,postId);
              pstmt.setString(3,userId);
    	  }
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
   }
   
   public static void postUnshare(int postId, String userId)
   {
       String result = "";
       try
       {
          String query = "Update Share set Status=? where PostId=? and UserId=?";
          PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setString(1,"unshared");
          pstmt.setInt(2,postId);
          pstmt.setString(3,userId);
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
   }
   
}