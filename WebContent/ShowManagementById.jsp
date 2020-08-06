<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>ShowManagementById</title>
   </head>
   <body>
   <form method="post" action="UDManagementAction.jsp">
       <%
           int id=Integer.parseInt(request.getParameter("id"));
           Management mgmt = ManagementWorker.getManagementById(id);
       %>
       <input type="hidden" name="id" value="<%=id%>">
        <br><br>
        Name : <input type="text" name="name" value="<%=mgmt.getName()%>">
        <br><br>
        EmailId : <input type="text" name="emailId" value="<%=mgmt.getEmailId()%>">
        <br><br>
        Password : <input type="text" name="password" value="<%=mgmt.getPassword()%>">
        <br><br>
        ProfilePhoto : <input type="text" name="profilePhoto" value="<%=mgmt.getProfilePhoto()%>">
        <br><br>
        MobileNo : <input type="text" name="mobileNo" value="<%=mgmt.getMobileNo()%>">
        <br><br>
       <input type="submit" name="action" value="Update">
       <input type="submit" name="action" value="Delete">
   </form>
</body>
</html>