<%@ page import="com.social.ngo.*"%>
    
<%  

int memberId = Integer.parseInt(request.getParameter("memberId"));
int eventId = Integer.parseInt(request.getParameter("eventId"));

MemberEvent membEvent = new MemberEvent();
membEvent.setId(0);
membEvent.setMemberId(memberId);
membEvent.setEventId(eventId);
membEvent.setTime(null);

String result = MemberEventWorker.addMemberEvent(membEvent);

 if(result.equals("success"))
 {
%>	 
	window.location.href = "EventParticipation.jsp";
<%
 }
else
{
%>
	$("[event-unsuccess]").modal();
<% 
}
%>	