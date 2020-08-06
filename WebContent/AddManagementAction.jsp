
<%@ page import="com.social.ngo.*" %>

<% 
int id=0;
String name = request.getParameter("name");
String emailId = request.getParameter("emailId");
String password = request.getParameter("password");
String mobileNo = request.getParameter("mobileNo");
   
Management mgmt = new Management();
mgmt.setId(id);
mgmt.setName(name);
mgmt.setEmailId(emailId);
mgmt.setPassword(password);
mgmt.setProfilePhoto("user.jpg");
mgmt.setMobileNo(mobileNo);

String result = ManagementWorker.addManagement(mgmt);
if(result.equals("success"))
{
%>
	 $("[added-success]").modal();
<%
}
else
{
%>
	$("[added-unsuccess]").modal();
<%
}
%>
