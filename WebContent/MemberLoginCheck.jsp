<%@ page import="com.social.ngo.*" %>

 <%
response.setContentType("text/html");
String username = request.getParameter("username");
String password = request.getParameter("password");

Member memb = MemberWorker.loginVerify(username,password); 
if(memb.getName()==null)
{
%>
$("[login-failed-modal]").modal();
<%
}
else if(memb.getName()!=null)
{
	session.setAttribute("username",memb.getName());
	session.setAttribute("id",String.valueOf(memb.getId()));
	session.setAttribute("entity","member");
	session.setAttribute("profilePhoto",memb.getProfilePhoto());
%>	
	window.location.href = "MemberAccount.jsp";
<%    
}
else
{	
%>	
	window.location.href = "MemberLogin.jsp";
<%
}
%>




