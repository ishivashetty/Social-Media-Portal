<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>UDEventAction</title>
</head>
<body>
<% 
   String action = request.getParameter("action");
   int ID = Integer.parseInt(request.getParameter("id"));
   if(action.equalsIgnoreCase("Update"))
   {
    int id = Integer.parseInt(request.getParameter("id"));
  String caption = request.getParameter("caption");
  String date = request.getParameter("date");
  int days = Integer.parseInt(request.getParameter("days"));
  int managementId = Integer.parseInt(request.getParameter("managementId"));
         
       Event event = new Event();
    event.setId(id);
    event.setCaption(caption);
    event.setDate(date);
    event.setDays(days);
    event.setManagementId(managementId);       

       String result = EventWorker.updateEvent(event);
       out.println(result);
   }
   else
   {
       String result = EventWorker.deleteEvent(ID);
       out.println(result);
   }
   
%>
</body>
</html>