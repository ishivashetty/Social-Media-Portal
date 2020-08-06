<%@ page import="com.social.ngo.*, java.sql.*;"%>
<%
	String pId = request.getParameter("postId");
	String userId = request.getParameter("userId");
	String description = request.getParameter("desc");
	
	int postId = Integer.parseInt(pId);
	int id = 0;
	Timestamp time = null;

	Comment comment = new Comment();
	comment.setId(id);
	comment.setPostId(postId);
	comment.setUserId(userId);
	comment.setDescription(description);
	comment.setTime(time);

	String result = CommentWorker.addComment(comment);

	if (result.equals("success")) {
%>
Your comment has been added.
<%
	} else {
%>
Some problem occured in commenting.
<%
	}
%>
