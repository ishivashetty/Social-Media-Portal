<%@ page import="com.social.ngo.*, java.sql.*;" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>UDDonationAction</title>
</head>
<body>
<% 
   String action = request.getParameter("action");
   int ID = Integer.parseInt(request.getParameter("id"));
   if(action.equalsIgnoreCase("Update"))
   {
    int id = Integer.parseInt(request.getParameter("id"));
  int memberId = Integer.parseInt(request.getParameter("memberId"));
  float amount = Float.parseFloat(request.getParameter("amount"));
  Timestamp time = Timestamp.valueOf(request.getParameter("time"));
  String paymentMode = request.getParameter("paymentMode");
         
       Donation donation = new Donation();
    donation.setId(id);
    donation.setMemberId(memberId);
    donation.setAmount(amount);
    donation.setTime(time);
    donation.setPaymentMode(paymentMode);       

       String result = DonationWorker.updateDonation(donation);
       out.println(result);
   }
   else
   {
       String result = DonationWorker.deleteDonation(ID);
       out.println(result);
   }
   
%>
</body>
</html>