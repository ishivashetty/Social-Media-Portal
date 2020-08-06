<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>UDAdminAction</title>
</head>
<body>
<% 
   String action = request.getParameter("action");
   int ID = Integer.parseInt(request.getParameter("id"));
   if(action.equalsIgnoreCase("Update"))
   {
    int id = Integer.parseInt(request.getParameter("id"));
  String emailId = request.getParameter("emailId");
  String username = request.getParameter("username");
  String password = request.getParameter("password");
         
       Admin admin = new Admin();
    admin.setId(id);
    admin.setEmailId(emailId);
    admin.setUsername(username);
    admin.setPassword(password);       

       String result = AdminWorker.updateAdmin(admin);
       out.println(result);
   }
   else
   {
       String result = AdminWorker.deleteAdmin(ID);
       out.println(result);
   }
   
%>
</body>
</html>