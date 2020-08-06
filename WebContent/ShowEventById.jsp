<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>ShowEventById</title>
   </head>
   <body>
   <form method="post" action="UDEventAction.jsp">
       <%
           int id=Integer.parseInt(request.getParameter("id"));
           Event event = EventWorker.getEventById(id);
       %>
       <input type="hidden" name="id" value="<%=id%>">
        <br><br>
        Caption : <input type="text" name="caption" value="<%=event.getCaption()%>">
        <br><br>
        Date : <input type="text" name="date" value="<%=event.getDate()%>">
        <br><br>
        Days : <input type="text" name="days" value="<%=event.getDays()%>">
        <br><br>
        ManagementId : <input type="text" name="managementId" value="<%=event.getManagementId()%>">
        <br><br>
       <input type="submit" name="action" value="Update">
       <input type="submit" name="action" value="Delete">
   </form>
</body>
</html>