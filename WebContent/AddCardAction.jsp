<%@ page import="com.social.ngo.*"%>
    
<%
  int id=0;
  int memberId = Integer.parseInt(request.getParameter("memberId")); 
  String cardType = request.getParameter("cardType");
  String cardNumber = request.getParameter("cardNumber");
  String cardName = request.getParameter("cardName");
  String expiryDate = request.getParameter("expiryDate");
  int cvv = Integer.parseInt(request.getParameter("cvv"));
     
  Card card = new Card();
  card.setId(id);
  card.setMemberId(memberId);
  card.setCardType(cardType);
  card.setCardNumber(cardNumber);
  card.setCardName(cardName);
  card.setExpiryDate(expiryDate);
  card.setCvv(cvv);
 String result = CardWorker.addCard(card);
 
 if(result.equals("success"))
 {
%>	 
	 $("[card-success-modal]").modal();
<%
 }
else
{
%>
	$("[card-unsuccess-modal]").modal();
<% 
}
%>	
