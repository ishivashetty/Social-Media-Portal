<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>AddAdminAction</title>
</head>

<body>
<%
   int id=0;
  String emailId = request.getParameter("emailId");
  String username = request.getParameter("username");
  String password = request.getParameter("password");
     
   Admin admin = new Admin();
  admin.setId(id);
  admin.setEmailId(emailId);
  admin.setUsername(username);
  admin.setPassword(password);
 String result = AdminWorker.addAdmin(admin);
 out.println(result);   
%>
</body>
</html>