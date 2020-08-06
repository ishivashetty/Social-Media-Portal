package com.social.ngo;

import java.sql.*;
import java.util.*;

public class PostLikeWorker 
{
   public static String addPostLike(PostLike pLike)
   {
       String result = "";
       try
       {

          String query = "Insert into PostLike (Id,PostId,UserId,Status,Time) values (?,?,?,?,?)";
          PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setInt(1,pLike.getId());
          pstmt.setInt(2,pLike.getPostId());
          pstmt.setString(3,pLike.getUserId());
          pstmt.setString(4,pLike.getStatus());
          pstmt.setTimestamp(5,pLike.getTime());
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


   public static String updatePostLike(PostLike pLike)
   {
       String result = " ";
       try
       {

          String query = "Update PostLike set PostId=?, UserId=?, Status=?, Time=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);

           pstmt.setInt(1,pLike.getPostId());
           pstmt.setString(2,pLike.getUserId());
           pstmt.setString(3,pLike.getStatus());
           pstmt.setTimestamp(4,pLike.getTime());
          pstmt.setInt(5,pLike.getId());
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


   public static String deletePostLike(int id)
   {
       String result = " ";
       try
       {

         String query = "Delete from PostLike where Id="+id+";" ;
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


   public static PostLike getPostLikeById(int id) 
   {
       PostLike pLike = null;
       try
       {
           String query = "select * from PostLike where Id =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               pLike = new PostLike();

                pLike.setId(rs.getInt("Id"));
                pLike.setPostId(rs.getInt("PostId"));
                pLike.setUserId(rs.getString("UserId"));
                pLike.setStatus(rs.getString("Status"));
                pLike.setTime(rs.getTimestamp("Time"));
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
       return pLike;
   }


   public static ArrayList<PostLike> getAllPostLikes()
   {
       ArrayList<PostLike> list=new ArrayList<>();
       
       try
       {
           String query = "select * from PostLike;" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               PostLike pLike = new PostLike();

                pLike.setId(rs.getInt("Id"));
                pLike.setPostId(rs.getInt("PostId"));
                pLike.setUserId(rs.getString("UserId"));
                pLike.setStatus(rs.getString("Status"));
                pLike.setTime(rs.getTimestamp("Time"));
               list.add(pLike);
               pLike=null;
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
   
   public static String likeStatusCheck(int postId,String userId)
   {
	   String status = "";
       try
       {
          String query = "Select Status from postlike where PostId = \""+postId+"\" and UserId = \""+userId+"\";";
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
   
   public static void postLike(int postId, String userId)
   {
	   PreparedStatement pstmt = null;
	   String query = "";
	   String result = "";
       try
       {
    	  String status = PostLikeWorker.likeStatusCheck(postId, userId);
    	  if(status.equals(""))
    	  {
    		  query = "Insert into PostLike (Id,PostId,UserId,Status,Time) values (?,?,?,?,?)";
              pstmt = DatabaseConnector.getPreparedStatement(query);
              pstmt.setInt(1,0);
              pstmt.setInt(2,postId);
              pstmt.setString(3,userId);
              pstmt.setString(4,"liked");
              pstmt.setTimestamp(5,null);
    	  }
    	  else if(status.equals("unliked"))
    	  {
    		  query = "Update PostLike set Status=? where PostId=? and UserId=?";
              pstmt = DatabaseConnector.getPreparedStatement(query);
              pstmt.setString(1,"liked");
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
   
   public static void postUnlike(int postId, String userId)
   {
       String result = "";
       try
       {
          String query = "Update PostLike set Status=? where PostId=? and UserId=?";
          PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setString(1,"unliked");
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