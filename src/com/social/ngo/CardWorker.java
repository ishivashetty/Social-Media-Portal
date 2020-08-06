package com.social.ngo;

import java.sql.*;
import java.util.*;

public class CardWorker 
{
   public static String addCard(Card card)
   {
       String result = "";
       try
       {

           String query = "Insert into Card (Id,MemberId,CardType,CardNumber,CardName,ExpiryDate,Cvv) values (?,?,?,?,?,?,?)";
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);
          pstmt.setInt(1,card.getId());
          pstmt.setInt(2,card.getMemberId());
          pstmt.setString(3,card.getCardType());
          pstmt.setString(4,card.getCardNumber());
          pstmt.setString(5,card.getCardName());
          pstmt.setString(6,card.getExpiryDate());
          pstmt.setInt(7,card.getCvv());
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


   public static String updateCard(Card card)
   {
       String result = " ";
       try
       {

          String query = "Update Card set MemberId=?, CardType=?, CardNumber=?, CardName=?, ExpiryDate=?, Cvv=? where Id=?;" ;
           PreparedStatement pstmt = DatabaseConnector.getPreparedStatement(query);

           pstmt.setInt(1,card.getMemberId());
           pstmt.setString(2,card.getCardType());
           pstmt.setString(3,card.getCardNumber());
           pstmt.setString(4,card.getCardName());
           pstmt.setString(5,card.getExpiryDate());
           pstmt.setInt(6,card.getCvv());
          pstmt.setInt(7,card.getId());
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


   public static String deleteCard(int id)
   {
       String result = " ";
       try
       {

         String query = "Delete from Card where Id="+id+";" ;
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


   public static Card getCardById(int id) 
   {
       Card card = null;
       try
       {
           String query = "select * from Card where Id =" +id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               card = new Card();

                card.setId(rs.getInt("Id"));
                card.setMemberId(rs.getInt("MemberId"));
                card.setCardType(rs.getString("CardType"));
                card.setCardNumber(rs.getString("CardNumber"));
                card.setCardName(rs.getString("CardName"));
                card.setExpiryDate(rs.getString("ExpiryDate"));
                card.setCvv(rs.getInt("Cvv"));
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
       return card;
   }


   public static ArrayList<Card> getAllCardsById(int id)
   {
       ArrayList<Card> list=new ArrayList<>();
       
       try
       {
           String query = "select * from Card where memberId = "+id+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
               Card card = new Card();

                card.setId(rs.getInt("Id"));
                card.setMemberId(rs.getInt("MemberId"));
                card.setCardType(rs.getString("CardType"));
                card.setCardNumber(rs.getString("CardNumber"));
                card.setCardName(rs.getString("CardName"));
                card.setExpiryDate(rs.getString("ExpiryDate"));
                card.setCvv(rs.getInt("Cvv"));
               list.add(card);
               card=null;
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
   
   public static String verifyCvv(int id, int cvv) 
   {
       String cardName = null;
       try
       {
           String query = "select cardName from Card where Id ="+id+" and cvv= "+cvv+";" ;
           ResultSet rs = DatabaseConnector.getResultSet(query);
           while(rs.next())
           {
        	   cardName = rs.getString("CardName");
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
       if(cardName==null)
    	   return "notexists";
       else
    	   return "exists";
   }
   
}