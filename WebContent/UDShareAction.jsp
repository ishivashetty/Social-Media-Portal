<%@ page import="com.social.ngo.*, java.sql.*;" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>UDShareAction</title>
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
  Timestamp time = Timestamp.valueOf(request.getParameter("time"));
         
       Share share = new Share();
    share.setId(id);
    share.setPostId(postId);
    share.setUserId(userId);
    share.setTime(time);       

       String result = ShareWorker.updateShare(share);
       out.println(result);
   }
   else
   {
       String result = ShareWorker.deleteShare(ID);
       out.println(result);
   }
   
%>
</body>
</html>