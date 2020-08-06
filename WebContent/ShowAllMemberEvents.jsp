<%@ page import="com.social.ngo.*,java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>ShowAllMemberEvents</title>
</head>
<body>
   <%
       ArrayList<MemberEvent> list = MemberEventWorker.getAllMemberEvents();
   %>   
   <table border=1>
   <tr>

           <th>MemberId</th>
           <th>EventId</th>
           <th>Time</th>
   </tr>   
   <% for(MemberEvent membEvent:list)
   {
       int id = membEvent.getId();
   %>
   <tr>
       <td><a href="ShowMemberEventById.jsp?id=<%=id%>"><%=membEvent.getMemberId() %></a></td>

           <th><%=membEvent.getEventId()%></th>
           <th><%=membEvent.getTime()%></th>   </tr>	
   <%
   }
   %>
</table>
</body>
</html>