<%@ page import="com.social.ngo.*, java.util.*;" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	String status = (String) session.getAttribute("admin");
	if (status == null) {
		response.sendRedirect("AdminLogin.jsp");
	} else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>All Comments</title>
<link href="src/css/bootstrap.min.css" rel="stylesheet">
<link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="src/css/Montserrat.css" rel="stylesheet">
<link href="src/mycss/MemberAccount.css" rel="stylesheet">

<script src="src/js/jquery.min.js"></script>

<script language="javascript">
	$(document).ready(function() {

	});
</script>
</head>

<body>
<br>
<div class="well" align="center">
<span class="h3">ADMIN PANEL</span><hr>
<span class="h4">Comments Section</span>
</div>
	
   <%
       ArrayList<Comment> list = CommentWorker.getAllComments();
   %>   
   <table border=1 class="table">
   <tr>

           <th>PostId</th>
           <th>UserId</th>
           <th>Description</th>
           <th>Time</th>
   </tr>   
   <% for(Comment comment:list)
   {
       int id = comment.getId();
   %>
   <tr>
       <td><a href="ShowCommentById.jsp?id=<%=id%>"><%=comment.getPostId() %></a></td>

           <th><%=comment.getUserId()%></th>
           <th><%=comment.getDescription()%></th>
           <th><%=TimeStampWorker.formatTime(comment.getTime().toString())%></th>   </tr>	
   <%
   }
   %>
</table>

	<script src="src/js/jquery.min.js"></script>
	<script src="src/js/bootstrap.min.js"></script>

</body>
</html>
<%
	}
%>