<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>ShowMemberById</title>
   </head>
   <body>
   <form method="post" action="UDMemberAction.jsp">
       <%
           int id=Integer.parseInt(request.getParameter("id"));
           Member memb = MemberWorker.getMemberById(id);
       %>
       <input type="hidden" name="id" value="<%=id%>">
        <br><br>
        Name : <input type="text" name="name" value="<%=memb.getName()%>">
        <br><br>
        EmailId : <input type="text" name="emailId" value="<%=memb.getEmailId()%>">
        <br><br>
        Password : <input type="text" name="password" value="<%=memb.getPassword()%>">
        <br><br>
        MobileNo : <input type="text" name="mobileNo" value="<%=memb.getMobileNo()%>">
        <br><br>
        ProfilePhoto : <input type="text" name="profilePhoto" value="<%=memb.getProfilePhoto()%>">
        <br><br>
        Gender : <input type="text" name="gender" value="<%=memb.getGender()%>">
        <br><br>
        Address : <input type="text" name="address" value="<%=memb.getAddress()%>">
        <br><br>
        Dob : <input type="text" name="dob" value="<%=memb.getDob()%>">
        <br><br>
       <input type="submit" name="action" value="Update">
       <input type="submit" name="action" value="Delete">
   </form>
</body>
</html>