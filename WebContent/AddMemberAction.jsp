<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>AddMemberAction</title>
</head>

<body>
<%
  int id=0;
  String name = request.getParameter("name");
  String emailId = request.getParameter("emailId");
  String password = request.getParameter("password");
  String mobileNo = request.getParameter("mobileNo");
  String profilePhoto = request.getParameter("profilePhoto");
  String gender = request.getParameter("gender");
  String address = request.getParameter("address");
  String dob = request.getParameter("dob");
     
   Member memb = new Member();
  memb.setId(id);
  memb.setName(name);
  memb.setEmailId(emailId);
  memb.setPassword(password);
  memb.setMobileNo(mobileNo);
  memb.setProfilePhoto(profilePhoto);
  memb.setGender(gender);
  memb.setAddress(address);
  memb.setDob(dob);
 String result = MemberWorker.addMember(memb);
 
	response.sendRedirect("MemberLogin.jsp");
%>
</body>
</html>