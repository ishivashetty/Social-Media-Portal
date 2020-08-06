<%@ page import="com.social.ngo.*" %>

 <%
String username = request.getParameter("username");
String password = request.getParameter("password");

Management mgmt = ManagementWorker.loginVerify(username,password); 
if(mgmt.getName()==null)
{
%>
$("[login-failed-modal]").modal();
<%
}
else if(mgmt.getName()!=null)
{
	session.setAttribute("username",mgmt.getName());
	session.setAttribute("id",String.valueOf(mgmt.getId()));
	session.setAttribute("entity","management");
	session.setAttribute("profilePhoto",mgmt.getProfilePhoto());
%>	
	window.location.href = "ManagementAccount.jsp";
<%    
}
else
{	
%>	
	window.location.href = "ManagementLogin.jsp";
<%
}
%>




