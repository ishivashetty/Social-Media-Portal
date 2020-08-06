package com.social.ngo;

import java.sql.*;
import java.util.*;

public class CommentWorker 
{
   public static String addComment(Comment comment)
   {
       String result = "";
       try
       {

           String query = "Insert into Comment (Id,PostId,UserId,Description,Time) values (?,?,?,?,?)";
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setInt(1,comment.getId());
          pstmt.setInt(2,comment.getPostId());
          pstmt.setString(3,comment.getUserId());
          pstmt.setString(4,comment.getDescription());
          pstmt.setTimestamp(5,comment.getTime());
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


   public static String updateComment(Comment comment)
   {
       String result = " ";
       try
       {

          String query = "Update Comment set PostId=?, UserId=?, Description=?, Time=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);

           pstmt.setInt(1,comment.getPostId());
           pstmt.setString(2,comment.getUserId());
           pstmt.setString(3,comment.getDescription());
           pstmt.setTimestamp(4,comment.getTime());
          pstmt.setInt(5,comment.getId());
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


   public static String deleteComment(int id)
   {
       String result = " ";
       try
       {

         String query = "Delete from Comment where Id="+id+";" ;
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


   public static Comment getCommentById(int id) 
   {
       Comment comment = null;
       try
       {
           String query = "select * from Comment where Id =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               comment = new Comment();

                comment.setId(rs.getInt("Id"));
                comment.setPostId(rs.getInt("PostId"));
                comment.setUserId(rs.getString("UserId"));
                comment.setDescription(rs.getString("Description"));
                comment.setTime(rs.getTimestamp("Time"));
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
       return comment;
   }


   public static ArrayList<Comment> getAllComments()
   {
       ArrayList<Comment> list=new ArrayList<>();
       
       try
       {
           String query = "select * from Comment;" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               Comment comment = new Comment();
               
                comment.setId(rs.getInt("Id"));
                comment.setPostId(rs.getInt("PostId"));
                comment.setUserId(rs.getString("UserId"));
                comment.setDescription(rs.getString("Description"));
                comment.setTime(rs.getTimestamp("Time"));
               list.add(comment);
               comment=null;
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
  /* 
   public static int getCommentCount(int postId)
   {
	   int count = 0;
	   try
       {
		   
		   String query = "Select Count(PostId) from Share where status=\"shared\" PostId =" +postId+";";
		   
           String query = "Select Count(PostId) from Comment where PostId =" +postId+";";
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
        	   count = rs.getInt(1);
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
	   System.out.println(count);
	   return count;
   }*/
   
}