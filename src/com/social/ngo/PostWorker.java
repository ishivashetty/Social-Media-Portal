package com.social.ngo;

import java.sql.*;
import java.util.*;

public class PostWorker 
{
   public static String addPost(Post post)
   {
       String result = "";
       try
       {

           String query = "Insert into Post (Id,UserId,UserType,Description,Photo,Time) values (?,?,?,?,?,?)";
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setInt(1,post.getId());
          pstmt.setString(2,post.getUserId());
          pstmt.setString(3,post.getUserType());
          pstmt.setString(4,post.getDescription());
          pstmt.setString(5,post.getPhoto());
          pstmt.setTimestamp(6,post.getTime());
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
 

   public static String updatePost(Post post)
   {
       String result = " ";
       try
       {

          String query = "Update Post set UserId=?, Description=?, Photo=?, Time=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);

           pstmt.setString(1,post.getUserId());
           pstmt.setString(2,post.getDescription());
           pstmt.setString(3,post.getPhoto());
           pstmt.setTimestamp(4,post.getTime());
          pstmt.setInt(5,post.getId());
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
   
   
   public static String updatePostDesc(int postId, String desc)
   {
       String result = "";
       try
       {

          String query = "Update Post set Description=? where Id=?;" ;
                              
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
           pstmt.setString(1,desc);
           pstmt.setInt(2,postId);   
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
   
   public static String updatePostPhoto(int id,String photo)
   {
       String result = "";
       try
       {

          String query = "Update Post set Photo=? where Id=?;" ;
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

   public static String deletePost(int id)
   {
       String result = " ";
       try
       {

         String query = "Delete from Post where Id="+id+";" ;
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


   public static Post getPostById(int id) 
   {
       Post post = null;
       try
       {
           String query = "select * from Post where Id =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               post = new Post();

                post.setId(rs.getInt("Id"));
                post.setUserId(rs.getString("UserId"));
                post.setUserType(rs.getString("UserType"));
                post.setDescription(rs.getString("Description"));
                post.setPhoto(rs.getString("Photo"));
                post.setTime(rs.getTimestamp("Time"));
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
       return post;
   }


   public static ArrayList<Post> getAllPosts()
   {
       ArrayList<Post> list=new ArrayList<>();
       
       try
       {
           String query = "select * from Post;" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               Post post = new Post();

                post.setId(rs.getInt("Id"));
                post.setUserId(rs.getString("UserId"));
                post.setUserType(rs.getString("UserType"));
                post.setDescription(rs.getString("Description"));
                post.setPhoto(rs.getString("Photo"));
                post.setTime(rs.getTimestamp("Time"));
               list.add(post);
               post=null;
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
   
   public static Post getStatus(int postId)
   {
	   Post post = new Post();
	   
	   int likes = 0;
	   int comments = 0;
	   int shares = 0;
	   
	   try
       {
           String query = "Select Count(PostId) from PostLike where status = \"liked\" and PostId =" +postId+";";
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
        	   likes = rs.getInt(1);
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
	   
	   try
       {
           String query = "Select Count(PostId) from Comment where PostId =" +postId+";";
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
        	   comments = rs.getInt(1);
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
	   
	   try
       {
           String query = "Select Count(PostId) from Share where status = \"shared\" and PostId =" +postId+";";
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
        	   shares = rs.getInt(1);
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
	   
	   post.setId(0);
	   
	   post.setUserId("");
	   post.setPhoto("");
	   post.setDescription("");
	   post.setTime(null);
	   post.setLikes(likes);
	   post.setComments(comments);
	   post.setShares(shares);
	   
	   return post;
   }
   
   public static ArrayList<Post> getPost(String entity,int id) 
   {
       ArrayList<Post> list = new ArrayList<>();
       try
       {
           String query = "select * from Post where userId=" +id+" and userType = \""+entity+"\";" ;
           
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
        	   Post post = new Post();
               post = new Post();
               post.setId(rs.getInt("Id"));
               post.setUserId(rs.getString("UserId"));
               post.setDescription(rs.getString("Description"));
               post.setPhoto(rs.getString("Photo"));
               post.setTime(rs.getTimestamp("time"));
               list.add(post);
               post=null;
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