<%@ page import="com.social.ngo.*, java.sql.*;" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>AddMemberPostAction</title>
</head>

<body>
<%
   int id=0;
  int postId = Integer.parseInt(request.getParameter("postId"));
  String uploader = request.getParameter("uploader");
  String status = request.getParameter("status");
  Timestamp lastSeen= null;
  String reason = request.getParameter("reason");
     
   MemberPost membPost = new MemberPost();
  membPost.setId(id);
  membPost.setPostId(postId);
  membPost.setUploader(uploader);
  membPost.setStatus(status);
  membPost.setLastSeen(lastSeen);
  membPost.setReason(reason);
 String result = MemberPostWorker.addMemberPost(membPost);
 out.println(result);   
%>
</body>
</html>