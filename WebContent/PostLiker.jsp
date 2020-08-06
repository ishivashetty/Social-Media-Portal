<%@ page import="com.social.ngo.*" %>

<% 
String pId = request.getParameter("postId");
String userId = request.getParameter("userId");
int postId = Integer.parseInt(pId); 
String status = PostLikeWorker.likeStatusCheck(postId,userId);
if(status.equals("") || status.equals("unliked"))
{
%>
	<a><span class="glyphicon glyphicon-ok"></span><span>&nbsp;&nbsp;Liked</span></a>
<%
	PostLikeWorker.postLike(postId, userId);
}
else if(status.equals("liked"))
{
%>
	<span class="glyphicon glyphicon-thumbs-up"></span><span>&nbsp;&nbsp;Like</span>
<%
	PostLikeWorker.postUnlike(postId,userId);
}
%>

