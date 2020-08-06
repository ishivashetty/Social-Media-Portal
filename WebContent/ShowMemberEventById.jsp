<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>ShowMemberEventById</title>
   </head>
   <body>
   <form method="post" action="UDMemberEventAction.jsp">
       <%
           int id=Integer.parseInt(request.getParameter("id"));
           MemberEvent membEvent = MemberEventWorker.getMemberEventById(id);
       %>
       <input type="hidden" name="id" value="<%=id%>">
        <br><br>
        MemberId : <input type="text" name="memberId" value="<%=membEvent.getMemberId()%>">
        <br><br>
        EventId : <input type="text" name="eventId" value="<%=membEvent.getEventId()%>">
        <br><br>
        Time : <input type="text" name="time" value="<%=membEvent.getTime()%>">
        <br><br>
       <input type="submit" name="action" value="Update">
       <input type="submit" name="action" value="Delete">
   </form>
</body>
</html>