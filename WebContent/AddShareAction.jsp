<%@ page import="com.social.ngo.*" %>

<% 
String pId = request.getParameter("postId");
String userId = request.getParameter("userId");
int postId = Integer.parseInt(pId);  
String status = ShareWorker.shareStatusCheck(postId,userId);
if(status.equals("") || status.equals("unshared"))
{
%>
	<a><span class="glyphicon glyphicon-ok"></span><span>&nbsp;&nbsp;Shared</span></a>
<%
	ShareWorker.postShare(postId, userId);
}
else if(status.equals("shared"))
{
%>
	<span class="glyphicon glyphicon-share"></span><span>&nbsp;&nbsp;Share</span>
<%
	ShareWorker.postUnshare(postId,userId);
}
%>
