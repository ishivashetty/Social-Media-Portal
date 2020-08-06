<%@ page import="com.social.ngo.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Donation Receipt</title>
<link href="src/css/bootstrap.min.css" rel="stylesheet">
<link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="src/css/Montserrat.css" rel="stylesheet">
<link href="src/mycss/MemberAccount.css" rel="stylesheet">


<script src="src/js/jquery.min.js"></script>

<script language="javascript">
	$(document).ready(function() {

	});
</script>
</head>
<%
	String name = (String) session.getAttribute("username");
	if (name == null) {
		response.sendRedirect("MemberLogin.jsp");
	} else {
		String id = (String) session.getAttribute("id");
		String entity = (String) session.getAttribute("entity");
		String donationStatus = (String) session.getAttribute("donationStatus");
%>


<body>
	<input type="hidden" id="entity" value="<%=entity%>">

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
				<li><a href=""><i class="fa fa-globe fa-lg"></i></a></li>
				<li class="dropdown"><a class="dropdown-toggle" type="button"
					data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<%=name%>&nbsp;
						<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="">View Profile</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Account Settings</li>
						<li><a href="AccountUpdate.jsp"><span
								class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;Update
								Account</a></li>
						<li><a href=""><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;Logout</a></li>
					</ul></li>
			</ul>

		</div>
	</div>
	<br>
	<br>
	<br>
	<br>

	<%
		if (donationStatus.equals("success")) {
				String donationId = (String) session.getAttribute("donationId");
	%>

	<div class="col-lg-3"></div>
	<div class="col-lg-6">

		<%
			Donation donation = DonationWorker.getDonationById(Integer.parseInt(donationId));
					int memberId = donation.getMemberId();
					int cardId = donation.getCardId();
					Member memb = MemberWorker.getMemberById(memberId);
					Card card = CardWorker.getCardById(cardId);
		%>
		<div class="">
			<h2 align="center">
				Donation Status : <u>SUCCESSFUL</u>
			</h2>
		</div>

		<center>
			<img src="src\\mycss\\images\\ReceiptLogo.jpg"
				style="display: table-cell; padding: 5%; height: 10%; width: 50%;">
		</center>


		<table class="table table-striped" border="1">

			<col width="40%">
			<col width="30%">

			<tr>
				<div class="well h3" align="center" style="margin-bottom: 0px;">DONATION
					RECEIPT</div>
			</tr>
			
			<tr>
				<th>Receipt No</th>
				<td><%=donation.getId()%></td>
			</tr>

			<tr>
				<th>Donation Amount
				</td>
				<td><i class="fa fa-inr"></i><span>&nbsp;</span><%=donation.getAmount()%>
				</th>
			</tr>

			<tr>
				<th>Donation Time</th>
				<td><%=donation.getTime()%></td>
			</tr>


			<tr>
				<td>Name</td>
				<td><%=memb.getName()%></td>
			</tr>

			<tr>
				<td>Email Id</td>
				<td><%=memb.getEmailId()%></td>
			</tr>

			<tr>
				<td>Mobile No</td>
				<td><%=memb.getMobileNo()%></td>
			</tr>

			<tr>
				<td>Donation Mode</td>
				<td><%=donation.getPaymentMode()%></td>
			</tr>

			<tr>
				<td>Card No</td>
				<td><%=card.getCardNumber()%></td>
			</tr>

			<tr>
				<td>Card Name</td>
				<td><%=card.getCardName()%></td>
			</tr>


		</table>


		<div class="well h3" align="center" style="margin-bottom: 0px;">
			Thank You ! We value your contribution <i class="fa fa-heart"></i>
		</div>

	</div>
	<div class="col-lg-3"></div>

	<%
		} else {
	%>
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
		<div class="well">
			<div class="well">
				<h2 align="center">
					Donation Status : <u>UNSUCCESSFUL</u>
				</h2>
				<h3 align="center">Reason : Invalid Card Credentials</h3>
			</div>
			
			<div class="well">
			<h3 align="center">
				We value your contribution <i class="fa fa-heart"></i>
			</h3>
			<hr>
			<h4 align="center">Please try again!</h4>
			<h4 align="center">
				<a href="AddDonation.jsp" class=" btn btn-primary" align="center">Retry
					Donation</a>
			</h4>
			</div>

		</div>
	</div>
	<div class="col-lg-3"></div>

	<%
		}
	%>
	<script src="src/js/jquery.min.js"></script>
	<script src="src/js/bootstrap.min.js"></script>

</body>
</html>

<%
	}
%>