package com.social.ngo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountWorker {

	public static String emailVerify(String Entity, String email) {
		String result = "";
		try {
			String query = "select Name from " + Entity + " where EmailId=\"" + email + "\";";

			ResultSet rs = DatabaseConnector.getResultSet(query);

			while (rs.next()) {

				result = rs.getString("Name");

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DatabaseConnector.closeConnection();
		}

		if (result.equals(""))
			result = "notexists";
		else
			result = "exists";

		return result;
	}

	public static String mobileVerify(String Entity, String mobile) {
		String result = null;
		try {
			String query = "select Name from " + Entity + " where MobileNo=\"" + mobile + "\";";
			ResultSet rs = DatabaseConnector.getResultSet(query);
			while (rs.next()) {
				result = rs.getString("Name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DatabaseConnector.closeConnection();
		}

		if (result == null)
			result = "notexists";
		else
			result = "exists";

		return result;
	}
	
	public static String updateProfilePhoto(String entity,int id,String photo)
	   {
	       String result = " ";
	       try
	       {

	          String query = "Update "+entity+" set ProfilePhoto=? where Id=?;" ;
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

}
