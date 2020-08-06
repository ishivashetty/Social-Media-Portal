<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>ShowEventSubscriptionById</title>
   </head>
   <body>
   <form method="post" action="UDEventSubscriptionAction.jsp">
       <%
           int id=Integer.parseInt(request.getParameter("id"));
           EventSubscription eventSubs = EventSubscriptionWorker.getEventSubscriptionById(id);
       %>
       <input type="hidden" name="id" value="<%=id%>">
        <br><br>
        MemberId : <input type="text" name="memberId" value="<%=eventSubs.getMemberId()%>">
        <br><br>
        EmailId : <input type="text" name="emailId" value="<%=eventSubs.getEmailId()%>">
        <br><br>
        MobileNo : <input type="text" name="mobileNo" value="<%=eventSubs.getMobileNo()%>">
        <br><br>
       <input type="submit" name="action" value="Update">
       <input type="submit" name="action" value="Delete">
   </form>
</body>
</html>