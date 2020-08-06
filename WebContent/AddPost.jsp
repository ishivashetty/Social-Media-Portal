<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title> AddPost </title>
   </head>
   <body>
   <form method="post" action="AddPostAction.jsp">
        <br><br>
        UserId : <input type="text" name="userId">
        <br><br>
        UserType : <input type="text" name="userType">
        <br><br>
        Photo : <input type="text" name="photo">
        <br><br>
        Description : <input type="text" name="description">
        <br><br>
        Time : <input type="text" name="time">
    <br><br>       <input type="submit" value="Submit">
   </form>
   </body>
</html>