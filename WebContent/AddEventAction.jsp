<%@ page import="com.social.ngo.*"%>
    
<%
int managementId = Integer.parseInt(request.getParameter("mgmtId"));
String caption = request.getParameter("caption");
String date = request.getParameter("date");
int days = Integer.parseInt(request.getParameter("days"));

Event event = new Event();
event.setId(0);
event.setCaption(caption);
event.setDate(date);
event.setDays(days);
event.setManagementId(managementId);

String result = EventWorker.addEvent(event);

 if(result.equals("success"))
 {
%>	 
	 $("[event-success]").modal();
<%
 }
else
{
%>
	$("[event-unsuccess]").modal();
<% 
}
%>	