<%@ page import="com.social.ngo.*, java.sql.*;" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String name = (String) session.getAttribute("username");
	if (name == null) {
		response.sendRedirect("MemberLogin.jsp");
	} else {
		String id = (String) session.getAttribute("id");
		String entity = (String) session.getAttribute("entity");
		String amount = request.getParameter("amount");
		String cardId = request.getParameter("cardId");
		String cvv = request.getParameter("cvv");
	
		String pin = request.getParameter("pin");
		if (CardWorker.verifyCvv(Integer.parseInt(cardId), Integer.parseInt(cvv)).equals("exists") && pin.equals("9999")) {
			
			int memberId = Integer.parseInt(id);
			float donationAmount = Float.parseFloat(amount);
			String paymentMode = "Saved Cards";
			int donationId =  DonationWorker.getPreviousDonationId()+1;
			
			Donation donation = new Donation();
			donation.setId(donationId);
			donation.setMemberId(memberId);
			donation.setCardId(Integer.parseInt(cardId));
			donation.setAmount(donationAmount);
			donation.setTime(null);
			donation.setPaymentMode(paymentMode);
			String result = DonationWorker.addDonation(donation);
			if(result.equals("success"))
			{
				session.setAttribute("donationId",donationId+"");
				session.setAttribute("donationStatus","success");
				%>
				DisplayDonation.jsp
				<%
			}
			else
			{
				session.setAttribute("donationStatus","unsuccess");
				%>
				DisplayDonation.jsp
				<%
			}
			
		} else if (CardWorker.verifyCvv(Integer.parseInt(cardId), Integer.parseInt(cvv)).equals("notexists") || !pin.equals("9999")) {
			session.setAttribute("donationStatus","unsuccess");
			%>
			DisplayDonation.jsp
			<%
		}

	}
%>