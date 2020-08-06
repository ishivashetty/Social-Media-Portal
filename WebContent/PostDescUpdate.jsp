<%@ page import="com.social.ngo.*;"%>

<%
	String postId = request.getParameter("postId");
	String description = request.getParameter("description");
	String result = PostWorker.updatePostDesc(Integer.parseInt(postId), description);
	if (result.equals("success")) {	
%>
$("[post-updated-modal]").modal();
<%
}
else 
{
%>
$("[post-notupdated-modal]").modal();
<%
}
%>
