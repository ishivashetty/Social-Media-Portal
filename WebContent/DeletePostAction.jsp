<%@ page import="com.social.ngo.*"%>
<% 
   int ID = Integer.parseInt(request.getParameter("postId"));
   String result = PostWorker.deletePost(ID);
     if(result.equals("success"))
     {
%>    	 
$("[post-deleted-modal]").modal();
<%
}
else
{
%>
$("[post-notdeleted-modal]").modal();	 
<%
}
%>
