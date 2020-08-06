<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>UDManagementAction</title>
</head>
<body>
<% 
   String action = request.getParameter("action");
   int ID = Integer.parseInt(request.getParameter("id"));
   if(action.equalsIgnoreCase("Update"))
   {
    int id = Integer.parseInt(request.getParameter("id"));
  String name = request.getParameter("name");
  String emailId = request.getParameter("emailId");
  String password = request.getParameter("password");
  String profilePhoto = request.getParameter("profilePhoto");
  String mobileNo = request.getParameter("mobileNo");
         
       Management mgmt = new Management();
    mgmt.setId(id);
    mgmt.setName(name);
    mgmt.setEmailId(emailId);
    mgmt.setPassword(password);
    mgmt.setProfilePhoto(profilePhoto);
    mgmt.setMobileNo(mobileNo);       

       String result = ManagementWorker.updateManagement(mgmt);
       out.println(result);
   }
   else
   {
       String result = ManagementWorker.deleteManagement(ID);
       out.println(result);
   }
   
%>
</body>
</html>