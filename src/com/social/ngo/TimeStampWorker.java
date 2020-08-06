package com.social.ngo;

import java.sql.PreparedStatement;

public class TimeStampWorker {
	
	public static String formatTime(String strTimeStamp)
	   {
	       String time = "";
	       String monthName = "";
	       String year = strTimeStamp.substring(0,4);
	       String month = strTimeStamp.substring(5,7);
	       String day = strTimeStamp.substring(8,10);
	       String strHour = strTimeStamp.substring(11,13);
	       String minute = strTimeStamp.substring(14,16);
	       String second = strTimeStamp.substring(17,19);
	       
	       if(month.equals("01"))
	    	   monthName = "January";
	       else if(month.equals("02"))
	    	   monthName = "February";
	       else if(month.equals("03"))
	    	   monthName = "March";
	       else if(month.equals("04"))
	    	   monthName = "April";
	       else if(month.equals("05"))
	    	   monthName = "May";
	       else if(month.equals("06"))
	    	   monthName = "June";
	       else if(month.equals("07"))
	    	   monthName = "July";
	       else if(month.equals("08"))
	    	   monthName = "August";
	       else if(month.equals("09"))
	    	   monthName = "September";
	       else if(month.equals("10"))
	    	   monthName = "October";
	       else if(month.equals("11"))
	    	   monthName = "November";
	       else if(month.equals("12"))
	    	   monthName = "December";
	       
	    	   
	       time = monthName.substring(0,3)+" "+day+", "+year+" at "+strHour+":"+minute ;
	      
	       return time;
	   }
	
}