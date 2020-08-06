<%@ page import="com.social.ngo.*,java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>ShowAllEventSubscriptions</title>
</head>
<body>
   <%
       ArrayList<EventSubscription> list = EventSubscriptionWorker.getAllEventSubscriptions();
   %>   
   <table border=1>
   <tr>

           <th>MemberId</th>
           <th>EmailId</th>
           <th>MobileNo</th>
   </tr>   
   <% for(EventSubscription eventSubs:list)
   {
       int id = eventSubs.getId();
   %>
   <tr>
       <td><a href="ShowEventSubscriptionById.jsp?id=<%=id%>"><%=eventSubs.getMemberId() %></a></td>

           <th><%=eventSubs.getEmailId()%></th>
           <th><%=eventSubs.getMobileNo()%></th>   </tr>	
   <%
   }
   %>
</table>
</body>
</html>