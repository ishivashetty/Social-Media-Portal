package com.social.ngo;

import java.sql.*;
import java.util.*;

public class MemberEventWorker 
{
   public static String addMemberEvent(MemberEvent membEvent)
   {
       String result = "";
       try
       {

           String query = "Insert into MemberEvent (Id,MemberId,EventId,Time) values (?,?,?,?)";
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setInt(1,membEvent.getId());
          pstmt.setInt(2,membEvent.getMemberId());
          pstmt.setInt(3,membEvent.getEventId());
          pstmt.setTimestamp(4,membEvent.getTime());
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


   public static String updateMemberEvent(MemberEvent membEvent)
   {
       String result = " ";
       try
       {

          String query = "Update MemberEvent set MemberId=?, EventId=?, Time=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);

           pstmt.setInt(1,membEvent.getMemberId());
           pstmt.setInt(2,membEvent.getEventId());
           pstmt.setTimestamp(3,membEvent.getTime());
          pstmt.setInt(4,membEvent.getId());
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


   public static String deleteMemberEvent(int id)
   {
       String result = " ";
       try
       {

         String query = "Delete from MemberEvent where Id="+id+";" ;
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


   public static MemberEvent getMemberEventById(int id) 
   {
       MemberEvent membEvent = null;
       try
       {
           String query = "select * from MemberEvent where Id =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               membEvent = new MemberEvent();

                membEvent.setId(rs.getInt("Id"));
                membEvent.setMemberId(rs.getInt("MemberId"));
                membEvent.setEventId(rs.getInt("EventId"));
                membEvent.setTime(rs.getTimestamp("Time"));
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
       return membEvent;
   }


   public static ArrayList<MemberEvent> getAllMemberEvents()
   {
       ArrayList<MemberEvent> list=new ArrayList<>();
       
       try
       {
           String query = "select * from MemberEvent;" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               MemberEvent membEvent = new MemberEvent();

                membEvent.setId(rs.getInt("Id"));
                membEvent.setMemberId(rs.getInt("MemberId"));
                membEvent.setEventId(rs.getInt("EventId"));
                membEvent.setTime(rs.getTimestamp("Time"));
               list.add(membEvent);
               membEvent=null;
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
   
   public static String getMemberEventStatus(int membId,int eventId) 
   {
       String status = "";
       try
       {
           String query = "select id from MemberEvent where MemberId =" +membId+" and eventId = "+eventId+" ;" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
                status = String.valueOf(rs.getInt("Id"));
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
       if(status.equals("") || status == null) 
       {
    	   status = "notexists";
       }
       else
    	   status = "exists";
    	return status;
   }
   
}