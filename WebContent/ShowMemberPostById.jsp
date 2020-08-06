<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>ShowMemberPostById</title>
   </head>
   <body>
   <form method="post" action="UDMemberPostAction.jsp">
       <%
           int id=Integer.parseInt(request.getParameter("id"));
           MemberPost membPost = MemberPostWorker.getMemberPostById(id);
       %>
       <input type="hidden" name="id" value="<%=id%>">
        <br><br>
        PostId : <input type="text" name="postId" value="<%=membPost.getPostId()%>">
        <br><br>
        Uploader : <input type="text" name="uploader" value="<%=membPost.getUploader()%>">
        <br><br>
        Status : <input type="text" name="status" value="<%=membPost.getStatus()%>">
        <br><br>
        LastSeen : <input type="text" name="lastSeen" value="<%=membPost.getLastSeen()%>">
        <br><br>
        Reason : <input type="text" name="reason" value="<%=membPost.getReason()%>">
        <br><br>
       <input type="submit" name="action" value="Update">
       <input type="submit" name="action" value="Delete">
   </form>
</body>
</html>