package com.social.ngo;

import java.sql.*;
import java.util.*;

public class DonationWorker 
{
   public static String addDonation(Donation donation)
   {
       String result = "";
       try
       {

           String query = "Insert into Donation (Id,MemberId,CardId,Amount,Time,PaymentMode) values (?,?,?,?,?,?)";
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setInt(1,donation.getId());
          pstmt.setInt(2,donation.getMemberId());
          pstmt.setInt(3,donation.getCardId());
          pstmt.setFloat(4,donation.getAmount());
          pstmt.setTimestamp(5,donation.getTime());
          pstmt.setString(6,donation.getPaymentMode());
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


   public static String updateDonation(Donation donation)
   {
       String result = " ";
       try
       {

          String query = "Update Donation set MemberId=?, Amount=?, Time=?, PaymentMode=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);

           pstmt.setInt(1,donation.getMemberId());
           pstmt.setFloat(2,donation.getAmount());
           pstmt.setTimestamp(3,donation.getTime());
           pstmt.setString(4,donation.getPaymentMode());
          pstmt.setInt(5,donation.getId());
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


   public static String deleteDonation(int id)
   {
       String result = " ";
       try
       {

         String query = "Delete from Donation where Id="+id+";" ;
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


   public static Donation getDonationById(int id) 
   {
       Donation donation = null;
       try
       {
           String query = "select * from Donation where Id =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               donation = new Donation();

                donation.setId(rs.getInt("Id"));
                donation.setMemberId(rs.getInt("MemberId"));
                donation.setCardId(rs.getInt("CardId"));
                donation.setAmount(rs.getFloat("Amount"));
                donation.setTime(rs.getTimestamp("Time"));
                donation.setPaymentMode(rs.getString("PaymentMode"));
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
       return donation;
   }


   public static ArrayList<Donation> getAllDonations()
   {
       ArrayList<Donation> list=new ArrayList<>();
       try
       {
           String query = "select * from Donation;";
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               Donation donation = new Donation();

                donation.setId(rs.getInt("Id"));
                donation.setMemberId(rs.getInt("MemberId"));
                donation.setCardId(rs.getInt("CardId"));
                donation.setAmount(rs.getFloat("Amount"));
                donation.setTime(rs.getTimestamp("Time"));
                donation.setPaymentMode(rs.getString("PaymentMode"));
               list.add(donation);
               donation=null;
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
   
   public static int getPreviousDonationId() 
   {
       int id = 0;
       try
       {
    	   String query = "select max(id) from Donation;" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
              id = rs.getInt(1);
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
       return id; 
   }
   
   public static int getTotalDonation() 
   {
       int count=0;
       try
       {
           String query = "select sum(amount) from Donation;" ;
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
       return count;
   }

   
}