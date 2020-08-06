<%@ page import="com.social.ngo.*, java.util.*;" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	String name = (String) session.getAttribute("username");
	if (name == null) {
		response.sendRedirect("MemberLogin.jsp");
	} else {
		String id = (String) session.getAttribute("id");
		String entity = (String) session.getAttribute("entity");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Display Cards</title>
<link href="src/css/bootstrap.min.css" rel="stylesheet">
<link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="src/css/Montserrat.css" rel="stylesheet">
<link href="src/mycss/MemberAccount.css" rel="stylesheet">

<script src="src/js/jquery.min.js"></script>

<script language="javascript">

	$(document).ready(function() {

		$("#amount").keypress(function(e){
			var key = e.which || e.keyCode;
			if(key==43 || key==45 ||key==46)
				e.preventDefault();
			if($(this).val().length>=5)
				e.preventDefault();
			
		});
		
		$("#amount").blur(function(e){
			var amount = $(this).val();
			if(amount.length<3)
			{
				$("[amount-modal]").modal();
			}
				
		});
		
		
		$("button[btn-donate]").click(function(e){
			e.preventDefault();
			var id = $(this).val();
			var amount = $("#amount").val();
			if(amount.length<3)
			{
				$("[amount-modal]").modal();
			}
			else
			{
				$("[donation-modal='"+id+"']").modal();
			}
		});
		
		$("button[btn-yes]").click(function(e){
			e.preventDefault();
			var id = $(this).val();
			$("[cvv-pin-modal='"+id+"']").modal();
			var cvv = $("[cvv='"+id+"']").val('');
			var pin = $("[pin='"+id+"']").val('');
			/* var cardId = $(this).val();
			$.ajax({
                type : "POST",
                url : "DeleteCardAction.jsp",
                data : "cardId=" + cardId,
                success : function(response) {
 					eval(response);
                }
            });  */
		});
		
		$("[cvv]").keypress(function(e){
			var key = e.which || e.keyCode;
			if(key>=48 && key <= 57)
				{
				
				}
			else
				e.preventDefault();
			
			var cvv = $(this).val().length;
			if(cvv>=3)
				e.preventDefault();
		});
		
		$("[pin]").keypress(function(e){
			var key = e.which || e.keyCode;
			if(key>=48 && key <= 57)
				{
				
				}
			else
				e.preventDefault();
			
			var pin = $(this).val().length;
			if(pin>=4)
				e.preventDefault();
		});
		
		$("button[btn-proceed-donation]").click(function(e){
			e.preventDefault();
			var id = $(this).val();
			var amount = $("#amount").val();
			var cvv = $("[cvv='"+id+"']").val();
			var pin = $("[pin='"+id+"']").val();
			
			if(cvv.length!=3)
				alert('Please enter a valid 3-digit CVV and try again.');
			else if(pin.length!=4)
				alert('Please enter a valid 4-digit PIN and try again.');
			else
				{
					$.ajax({
	                type : "POST",
	                url : "AddDonationAction.jsp",
	                data : "amount=" + amount + "&cardId=" + id + "&cvv=" + cvv + "&pin=" + pin,
	                success : function(response) {
	                	window.location = response;
	                }
	                
	                
	            }); 
				}
		});
		
		
		
		
		

	});
</script>


</head>
<body>

	<div class="navbar navbar-fixed-top navbar-inverse" id="navbarTop">
		<div class="navbar-header">
			<div class="navbar-brand">PROJECT MAD</div>
			<button ="button" class="navbar-toggle btn-md" data-toggle="collapse"
				data-target="#navbarAccount">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<div class="collapse navbar-collapse" id="navbarAccount">

			<ul class="nav navbar-nav navbar-left">
				<li><img src="src/mycss/images/logo-circular.png"
					alt="Project MAD Logo" title="Project MAD" width="35" height="35"
					style="margin-top: 7px;"></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><a href="MemberAccount.jsp"><span
						class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Home</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				
				<li><a href="AccountUpdate.jsp"><span
								class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;
								Account</a></li>
				<li><a href="PostUpdate.jsp"><span
								class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;
								Post</a></li>	
								
				<li><a href=""><span
								class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;
								<%=name%></a></li>			
					<li><a href="Logout.jsp"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;Logout</a></li>
											
			</ul>

		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	
	
	<div class="media well">
	
		<div class="media-left" style="width:30%;">
				<h3>Enter your Donation Amount </h3>
				<h3>And choose your card below </h3>
		</div>
		
		<div class="media-body" width="10%">
				
		</div>
		
		
		<div class="media-right" style="width:15%;">
			
			<div class="media well">
			<div class="media-left media-middle">
			<i class="fa fa-inr fa-3x"></i>
			</div>
			<div class="media-right media-middle">
			<input type="number" min="1" id="amount">
			</div>
			</div>
			
			
		
		</div>
	
	</div>
	
	
	<%
      ArrayList<Card> list = CardWorker.getAllCardsById(Integer.parseInt(id));
   	if(!list.isEmpty())
   	{
   		for(Card card:list)
   		{
   	%>
   	
   	
	<div class="col-xs-12 col-sm-4 col-lg-6">
	
		<div class="panel panel-card well">
		
				<div class="panel-heading">
					<div class="media">
						<div class="media-body">
							<%
								if (card.getCardType().equals("VISA")) {
							%>
							<h3>
								<i class="fa fa-cc-visa fa-3x"></i>
							</h3>
							<%
								} else if (card.getCardType().equals("MASTERCARD")) {
							%><h3>
							<i class="fa fa-cc-mastercard fa-3x"></i></h3>
							<%
								} else {
							%><h3>
							<i class="fa fa-credit-card fa-3x"></i></h3>
							<%
								}
							%>
						</div>
						<div class="media-right media-middle" style="width:25%;">
						<button btn-donate value="<%=card.getId()%>">
						<i class="fa fa-inr fa-2x"></i><span>&nbsp;&nbsp;</span><span class="h4">Donate</span>
						</button>
							<div donation-modal="<%=card.getId()%>" class="modal fade">
								<div class="modal-dialog modal-md">
									<div class="modal-content">

										<div class="modal-header">
										<div class="media">
											<div class="media-body">
											<h3>Donate to Project MAD ?</h3>
											</div>
											<div class="media-right media-middle">
												<h4><i class="fa fa-credit-card fa-2x"></i></h4>
											</div>
										</div>	
											
										</div>

										<div class="modal-body">
											<h4>Card Number : <%=card.getCardNumber()%></h4>
											<h4>Card Name : <%=card.getCardName()%></h4>
											<h4>Card Expiry : <%=card.getExpiryDate()%></h4>
										</div>

										<div class="modal-footer">
											<button btn-yes value="<%=card.getId()%>"class="btn btn-primary" data-dismiss="modal">Yes, Donate</button>
											<button class="btn btn-default" data-dismiss="modal">No</button>
										</div>
									</div>
								</div>
							</div>
							
							<div cvv-pin-modal="<%=card.getId()%>" class="modal fade">
								<div class="modal-dialog modal-md">
									<div class="modal-content">

										<div class="modal-header">
										<div class="media">
											<div class="media-body">
											<h3>Provide Credentials</h3>
											</div>
											<div class="media-right media-middle">
												<h4><i class="fa fa-credit-card fa-2x"></i></h4>
											</div>
										</div>	
											
										</div>

										<div class="modal-body">
											<h4>Enter CVV : <span>&nbsp;</span><input type="password" cvv="<%=card.getId()%>"></h4> <hr>
											<h4>Enter PIN : <span>&nbsp;&nbsp;</span><input type="password" pin="<%=card.getId()%>"></h4>
										</div>

										<div class="modal-footer">
											<button btn-proceed-donation value="<%=card.getId()%>"class="btn btn-primary" data-dismiss="modal">Proceed</button>
											<button class="btn btn-default" data-dismiss="modal">Go Back</button>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>

				</div>
				<div class="panel-body well">
			
			<div class="row">
			<div class="col-lg-3">
			<label>Card Number : </label>
			</div> 
			<div class="col-lg-6">
			<input type="text" value="<%=card.getCardNumber()%>" disabled>
			</div>
			</div>
			<hr>
			
			<div class="row">
			<div class="col-lg-3">
			<label>Card Name : </label>
			</div>
			<div class="col-lg-6">
			<input type="text" value="<%=card.getCardName()%>" disabled>
			</div>
			</div>
			<hr>
			
			<div class="row">
			<div class="col-lg-3">
			<label>Card Expiry : </label>
			</div>
			<div class="col-lg-6">
			<input type="text" value="<%=card.getExpiryDate()%>" disabled>
			</div>
			</div>
			

			</div>

		
	</div>
	
	</div>

	<%
   		}
   	}
   	else
   	{
   	%>
   		
		<div class="col-xs-12">
		<div class="panel panel-card">
			<div class="panel-heading">
				<center>
				<h3>
					You haven't saved any cards yet!
				</h3>
				</center>
			</div>
			
			<div class="panel-body">
	
			</div>
			
			<div class="panel-footer">
				<center>
					<a class="btn btn-primary" href="AddCard.jsp">Save your card here</a>
				</center>
			</div>
			</div>
		</div>
	</div>
	<% 
   	}
   		
   %>

	<div amount-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">

					<h4>
						<i class="fa fa-credit-card fa-2x"></i>
					</h4>
				</div>


				<div class="modal-body">
					<h3>
						Please enter a Donation Amount above <i class="fa fa-inr"></i>
						100.
					</h3>
				</div>

				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script src="src/js/jquery.min.js"></script>
	<script src="src/js/bootstrap.min.js"></script>
	
	

</body>
</html>
<%
}
%>