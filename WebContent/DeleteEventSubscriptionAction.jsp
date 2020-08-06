<%@ page import="com.social.ngo.*"%>
    
<%
  int memberId = Integer.parseInt(request.getParameter("memberId")); 

 String result = EventSubscriptionWorker.deleteEventSubscription(memberId);
 
 if(result.equals("success"))
 {
%>	 
	 $("[subs-unsuccess]").modal();
<%
 }
else
{
%>
	$("[subs-success]").modal();
<% 
}
%>	
