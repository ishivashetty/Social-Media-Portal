<%@ page import="com.social.ngo.*, java.sql.*;" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>UDMemberPostAction</title>
</head>
<body>
<% 
   String action = request.getParameter("action");
   int ID = Integer.parseInt(request.getParameter("id"));
   if(action.equalsIgnoreCase("Update"))
   {
    int id = Integer.parseInt(request.getParameter("id"));
  int postId = Integer.parseInt(request.getParameter("postId"));
  String uploader = request.getParameter("uploader");
  String status = request.getParameter("status");
  Timestamp lastSeen = Timestamp.valueOf(request.getParameter("lastSeen"));
  String reason = request.getParameter("reason");
         
       MemberPost membPost = new MemberPost();
    membPost.setId(id);
    membPost.setPostId(postId);
    membPost.setUploader(uploader);
    membPost.setStatus(status);
    membPost.setLastSeen(lastSeen);
    membPost.setReason(reason);       

       String result = MemberPostWorker.updateMemberPost(membPost);
       out.println(result);
   }
   else
   {
       String result = MemberPostWorker.deleteMemberPost(ID);
       out.println(result);
   }
   
%>
</body>
</html>