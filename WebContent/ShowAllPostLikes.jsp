<%@ page import="com.social.ngo.*,java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>ShowAllPostLikes</title>
</head>
<body>
   <%
       ArrayList<PostLike> list = PostLikeWorker.getAllPostLikes();
   %>  
   <table border=1>
   <tr> 

           <th>PostId</th>
           <th>UserId</th>
           <th>Status</th>
           <th>Time</th>
   </tr>   
   <% for(PostLike pLike:list)
   {
       int id = pLike.getId();
   %>
   <tr>
       <td><a href="ShowPostLikeById.jsp?id=<%=id%>"><%=pLike.getPostId() %></a></td>

           <th><%=pLike.getUserId()%></th>
           <th><%=pLike.getStatus()%></th>
           <th><%=pLike.getTime()%></th>   </tr>	
   <%
   }
   %>
</table>
</body>
</html>