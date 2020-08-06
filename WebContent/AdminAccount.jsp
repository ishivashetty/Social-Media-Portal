<%@ page import="com.social.ngo.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	String status = (String) session.getAttribute("admin");
	if (status == null) {
		response.sendRedirect("AdminLogin.jsp");
	} else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Panel</title>
<link href="src/css/bootstrap.min.css" rel="stylesheet">
<link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="src/css/Montserrat.css" rel="stylesheet">
<link href="src/mycss/MemberAccount.css" rel="stylesheet">

<script src="src/js/jquery.min.js"></script>

<script language="javascript">
	$(document).ready(function() {
		
		$("#mgmtRegistration").click(function(e) {
			
			window.location.href = "AddManagement.jsp";
		
		});
		
		$("#notify").click(function(e) {
			
			window.location.href = "SendNotifications.jsp";
		
		});
		
		$("#event").click(function(e) {
			
			window.location.href = "ShowAllEvents.jsp";
		
		});
		
		$("#donation").click(function(e) {
			
			window.location.href = "ShowAllDonations.jsp";
		
		});
		
		$("#comments").click(function(e) {
			
			window.location.href = "ShowAllComments.jsp";
		
		});
		
		$("#logout").click(function(e) {
			
			window.location.href = "AdminLogout.jsp";
		
		});

	});
</script>
</head>

<body>
<br>
<div class="well" align="center">
<span class="h2">ADMIN PANEL</span>
</div>
<div class="well">
<div class="row">
<div class="col-lg-3"></div>

	<div class="col-lg-3">
	<div class="panel panel-default">
		<div class="panel panel-header" align="center">
			
		</div>

		<div class="panel panel-body" align="center">
			<button id="mgmtRegistration" class="btn btn-primary">Management Registration</button>
		</div>

		<div class="panel panel-footer" align="center" style="margin: 0%;">

		</div>
	</div>
	</div>	
	
	<div class="col-lg-3">
	<div class="panel panel-default">
		<div class="panel panel-header" align="center">
			
		</div>

		<div class="panel panel-body" align="center">
			<button id="notify" class="btn btn-primary">Send Event Notifications</button>
		</div>

		<div class="panel panel-footer" align="center" style="margin: 0%;">

		</div>
	</div>
	</div>	
	
	<div class="col-lg-3"></div>
	
	</div>
	
	<div class="row">
	<div class="col-lg-3"></div>
	<div class="col-lg-3">
	<div class="panel panel-default">
		<div class="panel panel-header" align="center">
			
		</div>

		<div class="panel panel-body" align="center">
			<button id="event" class="btn btn-primary">Event Details</button>
		</div>

		<div class="panel panel-footer" align="center" style="margin: 0%;">

		</div>
	</div>
	</div>	
	
	<div class="col-lg-3">
	<div class="panel panel-default">
		<div class="panel panel-header" align="center">
			
		</div>

		<div class="panel panel-body" align="center">
			<button id="donation" class="btn btn-primary">Donation Details</button>
		</div>

		<div class="panel panel-footer" align="center" style="margin: 0%;">

		</div>
	</div>
	</div>	
	
	
	<div class="col-lg-3"></div>
	
	</div>
	
	<div class="row">
	<div class="col-lg-3"></div>
	<div class="col-lg-3">
	<div class="panel panel-default">
		<div class="panel panel-header" align="center">
			
		</div>

		<div class="panel panel-body" align="center">
			<button id="comments" class="btn btn-primary">Delete Comments</button>
		</div>

		<div class="panel panel-footer" align="center" style="margin: 0%;">

		</div>
	</div>
	</div>	
	
	<div class="col-lg-3">
	<div class="panel panel-default">
		<div class="panel panel-header" align="center">
			
		</div>

		<div class="panel panel-body" align="center">
			<button id="logout" class="btn btn-primary">Logout</button>
		</div>

		<div class="panel panel-footer" align="center" style="margin: 0%;">

		</div>
	</div>
	</div>	
	
	<div class="col-lg-3"></div>
	</div>
	
	
	<div card-success-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Your Card has been saved successfully.</h3>
				</div>

				<div class="modal-footer">
					<a class="btn btn-primary "href="AccountUpdate.jsp">Visit Saved Cards</a>
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
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