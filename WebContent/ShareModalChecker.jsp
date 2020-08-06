<%@ page import="com.social.ngo.*" %>

<% 
String pId = request.getParameter("postId");
String userId = request.getParameter("userId");
int postId = Integer.parseInt(pId); 
String status = ShareWorker.shareStatusCheck(postId,userId);


if(status.equals("") || status.equals("unshared"))
{
%>
	$("[post-share-yes-modal='"+postId+"']").modal();
<%
}
else if(status.equals("shared"))
{
%>
	$("[post-share-no-modal='"+postId+"']").modal();
<%
}
%>