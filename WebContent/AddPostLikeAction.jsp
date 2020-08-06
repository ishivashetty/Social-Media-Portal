<%@ page import="com.social.ngo.*, java.sql.*;" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>AddPostLikeAction</title>
</head>

<body>
<%
   int id=0;
  int postId = Integer.parseInt(request.getParameter("postId"));
  String userId = request.getParameter("userId");
  String status = request.getParameter("status");
  Timestamp time= null;
     
   PostLike pLike = new PostLike();
  pLike.setId(id);
  pLike.setPostId(postId);
  pLike.setUserId(userId);
  pLike.setStatus(status); 
  pLike.setTime(time);
 String result = PostLikeWorker.addPostLike(pLike);
 out.println(result);
%>
</body>
</html>