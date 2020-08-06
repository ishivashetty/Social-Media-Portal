<%@ page import="com.social.ngo.*,java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>ShowAllManagements</title>
</head>
<body>
   <%
       ArrayList<Management> list = ManagementWorker.getAllManagements();
   %>   
   <table border=1>
   <tr>

           <th>Name</th>
           <th>EmailId</th>
           <th>Password</th>
           <th>ProfilePhoto</th>
           <th>MobileNo</th>
   </tr>   
   <% for(Management mgmt:list)
   {
       int id = mgmt.getId();
   %>
   <tr>
       <td><a href="ShowManagementById.jsp?id=<%=id%>"><%=mgmt.getName() %></a></td>

           <th><%=mgmt.getEmailId()%></th>
           <th><%=mgmt.getPassword()%></th>
           <th><%=mgmt.getProfilePhoto()%></th>
           <th><%=mgmt.getMobileNo()%></th>   </tr>	
   <%
   }
   %>
</table>
</body>
</html>