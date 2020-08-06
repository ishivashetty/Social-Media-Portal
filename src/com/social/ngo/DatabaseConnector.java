package com.social.ngo;

import java.sql.*;

public class DatabaseConnector{
   public static String dbName = "ngo";
   public static String url = "jdbc:mysql://localhost:3306/"+dbName;
   public static String username = "root";
   public static String password = "root";
   public static Connection con = null;

   public static Connection getConnection()
   {
       try
       {
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection(url,username,password);
       }
       catch(Exception ex)
       {
           ex.printStackTrace();
       }
       return con;
   }

   public static PreparedStatement getPreparedStatement(String query)
   {
       PreparedStatement pstmt = null;
       try
       {
           con=getConnection();
           pstmt=con.prepareStatement(query);
       }
       catch(Exception ex)
       {
           ex.printStackTrace();
       }
       return pstmt;
   }

   public static ResultSet getResultSet(String query)
   {
       ResultSet rs=null;
       try
       {
           con=getConnection();
           Statement stmt = con.createStatement();
           rs = stmt.executeQuery(query);
       }
       catch(Exception ex)
       {
           ex.printStackTrace();
       }
       return rs;
   }

   public static void closeConnection()
   {
       try
       {
           con.close();
       }
       catch(Exception ex)
       {
           ex.printStackTrace();
       }
   }
}
