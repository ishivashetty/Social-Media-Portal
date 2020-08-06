<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>ShowPostLikeById</title>
   </head>
   <body>
   <form method="post" action="UDPostLikeAction.jsp">
       <%
           int id=Integer.parseInt(request.getParameter("id"));
           PostLike pLike = PostLikeWorker.getPostLikeById(id);
       %> 
       <input type="hidden" name="id" value="<%=id%>">
        <br><br>
        PostId : <input type="text" name="postId" value="<%=pLike.getPostId()%>">
        <br><br>
        UserId : <input type="text" name="userId" value="<%=pLike.getUserId()%>">
        <br><br>
        Status : <input type="text" name="status" value="<%=pLike.getStatus()%>">
        <br><br>
        Time : <input type="text" name="time" value="<%=pLike.getTime()%>">
        <br><br>
       <input type="submit" name="action" value="Update">
       <input type="submit" name="action" value="Delete">
   </form>
</body>
</html>