package com.social.ngo;

import java.sql.*;
import java.util.*;

public class MemberPostWorker 
{
   public static String addMemberPost(MemberPost membPost)
   {
       String result = "";
       try
       {
          String query = "Insert into MemberPost (Id,PostId,Uploader,Status,LastSeen,Reason) values (?,?,?,?,?,?)";
          PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setInt(1,membPost.getId());
          pstmt.setInt(2,membPost.getPostId());
          pstmt.setString(3,membPost.getUploader());
          pstmt.setString(4,membPost.getStatus());
          pstmt.setTimestamp(5,membPost.getLastSeen());
          pstmt.setString(6,membPost.getReason());
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


   public static String updateMemberPost(MemberPost membPost)
   {
       String result = " ";
       try
       {

          String query = "Update MemberPost set PostId=?, Uploader=?, Status=?, LastSeen=?, Reason=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);

           pstmt.setInt(1,membPost.getPostId());
           pstmt.setString(2,membPost.getUploader());
           pstmt.setString(3,membPost.getStatus());
           pstmt.setTimestamp(4,membPost.getLastSeen());
           pstmt.setString(5,membPost.getReason());
          pstmt.setInt(6,membPost.getId());
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


   public static String deleteMemberPost(int id)
   {
       String result = " ";
       try
       {

         String query = "Delete from MemberPost where Id="+id+";" ;
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


   public static MemberPost getMemberPostById(int id) 
   {
       MemberPost membPost = null;
       try
       {
           String query = "select * from MemberPost where Id =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               membPost = new MemberPost();

                membPost.setId(rs.getInt("Id"));
                membPost.setPostId(rs.getInt("PostId"));
                membPost.setUploader(rs.getString("Uploader"));
                membPost.setStatus(rs.getString("Status"));
                membPost.setLastSeen(rs.getTimestamp("LastSeen"));
                membPost.setReason(rs.getString("Reason"));
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
       return membPost;
   }


   public static ArrayList<MemberPost> getAllMemberPosts()
   {
       ArrayList<MemberPost> list=new ArrayList<>();
       
       try
       {
           String query = "select * from MemberPost;" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               MemberPost membPost = new MemberPost();

                membPost.setId(rs.getInt("Id"));
                membPost.setPostId(rs.getInt("PostId"));
                membPost.setUploader(rs.getString("Uploader"));
                membPost.setStatus(rs.getString("Status"));
                membPost.setLastSeen(rs.getTimestamp("LastSeen"));
                membPost.setReason(rs.getString("Reason"));
               list.add(membPost);
               membPost=null;
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