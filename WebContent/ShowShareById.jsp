<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>ShowShareById</title>
   </head>
   <body>
   <form method="post" action="UDShareAction.jsp">
       <%
           int id=Integer.parseInt(request.getParameter("id"));
           Share share = ShareWorker.getShareById(id);
       %>
       <input type="hidden" name="id" value="<%=id%>">
        <br><br>
        PostId : <input type="text" name="postId" value="<%=share.getPostId()%>">
        <br><br>
        UserId : <input type="text" name="userId" value="<%=share.getUserId()%>">
        <br><br>
        Time : <input type="text" name="time" value="<%=share.getTime()%>">
        <br><br>
       <input type="submit" name="action" value="Update">
       <input type="submit" name="action" value="Delete">
   </form>
</body>
</html>