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
		
		$("button[btn-card-delete]").click(function(e){
			e.preventDefault();
			var id = $(this).val();
			$("[card-delete-modal='"+id+"']").modal();
			
		});
		
		$("button[btn-yes]").click(function(e){
			e.preventDefault();
			var cardId = $(this).val();
			$.ajax({
                type : "POST",
                url : "DeleteCardAction.jsp",
                data : "cardId=" + cardId,
                success : function(response) {
 					eval(response);
                }
            }); 
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
	
	<div class="well" align="center">
	<h3>Hi <%=name%>, Your Saved Cards go here.</h3>
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
						<div class="media-right media-middle">
						<button btn-card-delete value="<%=card.getId()%>"><i class="fa fa-trash fa-2x"></i></button>
							<div card-delete-modal="<%=card.getId()%>" class="modal fade">
								<div class="modal-dialog modal-md">
									<div class="modal-content">

										<div class="modal-header">
										<div class="media">
											<div class="media-body">
											<h3>Delete this card?</h3>
											</div>
											<div class="media-right media-middle">
												<h4><i class="fa fa-credit-card fa-2x"></i></h4>
											</div>
										</div>	
											
										</div>

										<div class="modal-body">
											<h4>Card Number : <%=card.getCardNumber()%></h4>
											<h4>Card Name : <%=card.getCardName()%></h4>
										</div>

										<div class="modal-footer">
											<button btn-yes value="<%=card.getId()%>"class="btn btn-primary" data-dismiss="modal">YES</button>
											<button class="btn btn-default" data-dismiss="modal">NO</button>
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

	<div card-deleted class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<div class="media">
						<div class="media-body">
							<h3>Card has been Deleted.</h3>
						</div>
						<div class="media-right media-middle">
							<h4>
								<i class="fa fa-credit-card fa-2x"></i>
							</h4>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<a href="ShowAllCards.jsp" class="btn btn-default" >OK</a>
				</div>
			</div>
		</div>
	</div>
	
	<div card-not-deleted class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<div class="media">
						<div class="media-body">
							<h3>Card could not be Deleted.</h3>
							<h2>Please try again later.</h2>
						</div>
						<div class="media-right media-middle">
							<h4>
								<i class="fa fa-credit-card fa-2x"></i>
							</h4>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<a href="ShowAllCards.jsp" class="btn btn-default" data-dismiss="modal">OK</a>
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