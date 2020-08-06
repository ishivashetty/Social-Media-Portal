<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>ShowAdminById</title>
   </head>
   <body>
   <form method="post" action="UDAdminAction.jsp">
       <%
           int id=Integer.parseInt(request.getParameter("id"));
           Admin admin = AdminWorker.getAdminById(id);
       %>
       <input type="hidden" name="id" value="<%=id%>">
        <br><br>
        EmailId : <input type="text" name="emailId" value="<%=admin.getEmailId()%>">
        <br><br>
        Username : <input type="text" name="username" value="<%=admin.getUsername()%>">
        <br><br>
        Password : <input type="text" name="password" value="<%=admin.getPassword()%>">
        <br><br>
       <input type="submit" name="action" value="Update">
       <input type="submit" name="action" value="Delete">
   </form>
</body>
</html>