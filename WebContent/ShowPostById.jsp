<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>ShowPostById</title>
   </head>
   <body>
   <form method="post" action="UDPostAction.jsp">
       <%
           int id=Integer.parseInt(request.getParameter("id"));
           Post post = PostWorker.getPostById(id);
       %>
       <input type="hidden" name="id" value="<%=id%>">
        <br><br>
        UserId : <input type="text" name="userId" value="<%=post.getUserId()%>">
        <br><br>
        UserType : <input type="text" name="userType" value="<%=post.getUserType()%>">
        <br><br>
        Photo : <input type="text" name="photo" value="<%=post.getPhoto()%>">
        <br><br>
        Description : <input type="text" name="description" value="<%=post.getDescription()%>">
        <br><br>
        Time : <input type="text" name="time" value="<%=post.getTime()%>">
        <br><br>
       <input type="submit" name="action" value="Update">
       <input type="submit" name="action" value="Delete">
   </form>
</body>
</html>