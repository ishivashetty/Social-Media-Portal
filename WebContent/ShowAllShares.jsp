<%@ page import="com.social.ngo.*,java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>ShowAllShares</title>
</head>
<body>
   <%
       ArrayList<Share> list = ShareWorker.getAllShares();
   %>   
   <table border=1>
   <tr>

           <th>PostId</th>
           <th>UserId</th>
           <th>Time</th>
   </tr>   
   <% for(Share share:list)
   {
       int id = share.getId();
   %>
   <tr>
       <td><a href="ShowShareById.jsp?id=<%=id%>"><%=share.getPostId() %></a></td>

           <th><%=share.getUserId()%></th>
           <th><%=share.getTime()%></th>   </tr>	
   <%
   }
   %>
</table>
</body>
</html>