<%@ page import="com.social.ngo.*, java.sql.*;" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>UDCommentAction</title>
</head>
<body>
<% 
   String action = request.getParameter("action");
   int ID = Integer.parseInt(request.getParameter("id"));
   if(action.equalsIgnoreCase("Update"))
   {
    int id = Integer.parseInt(request.getParameter("id"));
  int postId = Integer.parseInt(request.getParameter("postId"));
  String userId = request.getParameter("userId");
  String description = request.getParameter("description");
  Timestamp time = Timestamp.valueOf(request.getParameter("time"));
         
       Comment comment = new Comment();
    comment.setId(id);
    comment.setPostId(postId);
    comment.setUserId(userId);
    comment.setDescription(description);
    comment.setTime(time);       

       String result = CommentWorker.updateComment(comment);
       out.println(result);
   }
   else
   {
       String result = CommentWorker.deleteComment(ID);
       out.println(result);
   }
   
%>
</body>
</html>