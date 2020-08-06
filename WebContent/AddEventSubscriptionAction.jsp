<%@ page import="com.social.ngo.*"%>
    
<%
  int id = 0;
  int memberId = Integer.parseInt(request.getParameter("memberId")); 
  String emailId = request.getParameter("emailId");
  String mobileNo = request.getParameter("mobileNo");

  EventSubscription eventSubs = new EventSubscription();
  eventSubs.setId(id);
  eventSubs.setMemberId(memberId);
  eventSubs.setEmailId(emailId);
  eventSubs.setMobileNo(mobileNo);

 String result = EventSubscriptionWorker.addEventSubscription(eventSubs);
 
 if(result.equals("success"))
 {
%>	 
	 $("[subs-success]").modal();
<%
 }
else
{
%>
	$("[subs-unsuccess]").modal();
<% 
}
%>	
