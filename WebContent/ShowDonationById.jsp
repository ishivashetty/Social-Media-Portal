<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>ShowDonationById</title>
   </head>
   <body>
   <form method="post" action="UDDonationAction.jsp">
       <%
           int id=Integer.parseInt(request.getParameter("id"));
           Donation donation = DonationWorker.getDonationById(id);
       %>
       <input type="hidden" name="id" value="<%=id%>">
        <br><br>
        MemberId : <input type="text" name="memberId" value="<%=donation.getMemberId()%>">
        <br><br>
        Amount : <input type="text" name="amount" value="<%=donation.getAmount()%>">
        <br><br>
        Time : <input type="text" name="time" value="<%=donation.getTime()%>">
        <br><br>
        PaymentMode : <input type="text" name="paymentMode" value="<%=donation.getPaymentMode()%>">
        <br><br>
       <input type="submit" name="action" value="Update">
       <input type="submit" name="action" value="Delete">
   </form>
</body>
</html>