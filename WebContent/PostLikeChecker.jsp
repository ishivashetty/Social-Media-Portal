<%@ page import="com.social.ngo.*" %>

<% 
String pId = request.getParameter("postId");
String userId = request.getParameter("userId");
int postId = Integer.parseInt(pId); 
String status = PostLikeWorker.likeStatusCheck(postId,userId);
if(status.equals("") || status.equals("unliked"))
{
%>
	<span class="glyphicon glyphicon-thumbs-up"></span><span>&nbsp;&nbsp;Like</span>
<%
}
else if(status.equals("liked"))
{
%>
	<a><span class="glyphicon glyphicon-ok"></span><span>&nbsp;&nbsp;Liked</span></a>
	
<%
}
%>
