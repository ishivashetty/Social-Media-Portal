<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title> AddMemberPost </title>
   </head>
   <body>
   <form method="post" action="AddMemberPostAction.jsp">
        <br><br>
        PostId : <input type="text" name="postId">
        <br><br>
        Uploader : <input type="text" name="uploader">
        <br><br>
        Status : <input type="text" name="status">
        <br><br>
        Reason : <input type="text" name="reason">
    <br><br>       <input type="submit" value="Submit">
   </form>
   </body>
</html>