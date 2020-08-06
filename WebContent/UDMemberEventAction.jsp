<%@ page import="com.social.ngo.*, java.sql.*;" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>UDMemberEventAction</title>
</head>
<body>
<% 
   String action = request.getParameter("action");
   int ID = Integer.parseInt(request.getParameter("id"));
   if(action.equalsIgnoreCase("Update"))
   {
    int id = Integer.parseInt(request.getParameter("id"));
  int memberId = Integer.parseInt(request.getParameter("memberId"));
  int eventId = Integer.parseInt(request.getParameter("eventId"));
  Timestamp time = Timestamp.valueOf(request.getParameter("time"));
         
       MemberEvent membEvent = new MemberEvent();
    membEvent.setId(id);
    membEvent.setMemberId(memberId);
    membEvent.setEventId(eventId);
    membEvent.setTime(time);       

       String result = MemberEventWorker.updateMemberEvent(membEvent);
       out.println(result);
   }
   else
   {
       String result = MemberEventWorker.deleteMemberEvent(ID);
       out.println(result);
   }
   
%>
</body>
</html>