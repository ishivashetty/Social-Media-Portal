<%@ page import="com.social.ngo.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>ShowCardById</title>
   </head>
   <body>
   <form method="post" action="UDCardAction.jsp">
       <%
           int id=Integer.parseInt(request.getParameter("id"));
           Card card = CardWorker.getCardById(id);
       %>
       <input type="hidden" name="id" value="<%=id%>">
        <br><br>
        MemberId : <input type="text" name="memberId" value="<%=card.getMemberId()%>">
        <br><br>
        CardType : <input type="text" name="cardType" value="<%=card.getCardType()%>">
        <br><br>
        CardNumber : <input type="text" name="cardNumber" value="<%=card.getCardNumber()%>">
        <br><br>
        CardName : <input type="text" name="cardName" value="<%=card.getCardName()%>">
        <br><br>
        ExpiryDate : <input type="text" name="expiryDate" value="<%=card.getExpiryDate()%>">
        <br><br>
        Cvv : <input type="text" name="cvv" value="<%=card.getCvv()%>">
        <br><br>
       <input type="submit" name="action" value="Update">
       <input type="submit" name="action" value="Delete">
   </form>
</body>
</html>