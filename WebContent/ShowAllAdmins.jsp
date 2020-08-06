<%@ page import="com.social.ngo.*,java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>ShowAllAdmins</title>
</head>
<body>
   <%
       ArrayList<Admin> list = AdminWorker.getAllAdmins();
   %>   
   <table border=1>
   <tr>

           <th>EmailId</th>
           <th>Username</th>
           <th>Password</th>
   </tr>   
   <% for(Admin admin:list)
   {
       int id = admin.getId();
   %>
   <tr>
       <td><a href="ShowAdminById.jsp?id=<%=id%>"><%=admin.getEmailId() %></a></td>

           <th><%=admin.getUsername()%></th>
           <th><%=admin.getPassword()%></th>   </tr>	
   <%
   }
   %>
</table>
</body>
</html>