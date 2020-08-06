<%@ page import="com.social.ngo.* , java.util.*;"%>

<%
	String pId = request.getParameter("postId");
	int postId = Integer.parseInt(pId);

	Post pos = PostWorker.getStatus(postId);
%>
<br>
<span class="glyphicon glyphicon-thumbs-up"></span>
&nbsp;
<%=pos.getLikes()%>  
<span>&nbsp;&nbsp;&nbsp;</span>

<span class="glyphicon glyphicon-comment"></span>
&nbsp;
<%=pos.getComments()%> 
<span>&nbsp;&nbsp;&nbsp;</span>

<span class="glyphicon glyphicon-share"></span>
&nbsp;
<%=pos.getShares()%>


