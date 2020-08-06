<%@ page import="com.social.ngo.*,java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>ShowAllMemberPosts</title>
</head>
<body>
   <%
       ArrayList<MemberPost> list = MemberPostWorker.getAllMemberPosts();
   %>   
   <table border=1>
   <tr>

           <th>PostId</th>
           <th>Uploader</th>
           <th>Status</th>
           <th>LastSeen</th>
           <th>Reason</th>
   </tr>   
   <% for(MemberPost membPost:list)
   {
       int id = membPost.getId();
   %>
   <tr>
       <td><a href="ShowMemberPostById.jsp?id=<%=id%>"><%=membPost.getPostId() %></a></td>

           <th><%=membPost.getUploader()%></th>
           <th><%=membPost.getStatus()%></th>
           <th><%=membPost.getLastSeen()%></th>
           <th><%=membPost.getReason()%></th>   </tr>	
   <%
   }
   %>
</table>
</body>
</html>