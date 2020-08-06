package com.social.ngo;

import java.sql.*;
import java.util.*;

public class EventSubscriptionWorker 
{
   public static String addEventSubscription(EventSubscription eventSubs)
   {
       String result = "";
       try
       {

          String query = "Insert into EventSubscription (Id,MemberId,EmailId,MobileNo) values (?,?,?,?)";
          PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setInt(1,eventSubs.getId());
          pstmt.setInt(2,eventSubs.getMemberId());
          pstmt.setString(3,eventSubs.getEmailId());
          pstmt.setString(4,eventSubs.getMobileNo());
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


   public static String updateEventSubscription(EventSubscription eventSubs)
   {
       String result = " ";
       try
       {

          String query = "Update EventSubscription set MemberId=?, EmailId=?, MobileNo=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);

           pstmt.setInt(1,eventSubs.getMemberId());
           pstmt.setString(2,eventSubs.getEmailId());
           pstmt.setString(3,eventSubs.getMobileNo());
          pstmt.setInt(4,eventSubs.getId());
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


   public static String deleteEventSubscription(int id)
   {
       String result = "";
       try
       {

         String query = "Delete from EventSubscription where Id="+id+";" ;
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


   public static EventSubscription getEventSubscriptionById(int id) 
   {
       EventSubscription eventSubs = null;
       try
       {
           String query = "select * from EventSubscription where Id =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               eventSubs = new EventSubscription();

                eventSubs.setId(rs.getInt("Id"));
                eventSubs.setMemberId(rs.getInt("MemberId"));
                eventSubs.setEmailId(rs.getString("EmailId"));
                eventSubs.setMobileNo(rs.getString("MobileNo"));
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
       return eventSubs;
   }


   public static ArrayList<EventSubscription> getAllEventSubscriptions()
   {
       ArrayList<EventSubscription> list=new ArrayList<>();
       
       try
       {
           String query = "select * from EventSubscription;" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               EventSubscription eventSubs = new EventSubscription();

                eventSubs.setId(rs.getInt("Id"));
                eventSubs.setMemberId(rs.getInt("MemberId"));
                eventSubs.setEmailId(rs.getString("EmailId"));
                eventSubs.setMobileNo(rs.getString("MobileNo"));
               list.add(eventSubs);
               eventSubs=null;
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
   
   public static EventSubscription checkSubscription(int id) 
   {
       EventSubscription eventSubs = null;
       try
       {
           String query = "select * from EventSubscription where MemberId =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               	eventSubs = new EventSubscription();

                eventSubs.setId(rs.getInt("Id"));
                eventSubs.setMemberId(rs.getInt("MemberId"));
                eventSubs.setEmailId(rs.getString("EmailId"));
                eventSubs.setMobileNo(rs.getString("MobileNo"));
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
       return eventSubs;
   }
   
}