<%@ page import="com.social.ngo.*" language="java"
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
<title>Subscribe!</title>
<link href="src/css/bootstrap.min.css" rel="stylesheet">
<link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="src/css/Montserrat.css" rel="stylesheet">
<link href="src/mycss/MemberAccount.css" rel="stylesheet">

<script src="src/js/jquery.min.js"></script>

<script language="javascript">
	$(document).ready(function() {
	
		
		
		$("#subscribe").click(function(e) {
			
			var memberId = $(this).val();
			var emailId =$("#email").val();
			var mobileNo = $("#mobile").val();
			
				$.ajax({
	                type : "POST",
	                url : "AddEventSubscriptionAction.jsp",
	                data : "memberId=" + memberId + "&emailId=" + emailId + "&mobileNo=" + mobileNo,
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
	
   
   <%
   EventSubscription subscription = EventSubscriptionWorker.checkSubscription(Integer.parseInt(id));
   if(subscription == null)
   {
	%>   
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
		<div class="well h4">
		<center><b>
		 Hey <%=name%>, you haven't subscribed yet !
		 </b></center>
		</div>
		<br>
		<div class="panel">
		<center>
			<div class="panel panel-header">
				<div class="well">
				<center>
				 Post subscription, you will be receiving our frequent updates on :
				 </center>
				</div>
			</div>
			
			<div class="panel panel-body">
				<% 
					Member memb = MemberWorker.getMemberById(Integer.parseInt(id));
				%>
			
				<div class="row">
					<div class="col-lg-4">
						Email ID :
					</div>
					<div class="col-lg-6">
						<input type="text" class="form-control" disabled id="email" value="<%=memb.getEmailId()%>">
					</div>
				</div>		
				
				<div class="row">
					<div class="col-lg-4">
						Mobile No :
					</div>
					<div class="col-lg-6">
						<input type="text" class="form-control" disabled id="mobile" value="<%=memb.getMobileNo()%>">
					</div>
				</div>			
			
			</div>
		
			<div class="panel panel-footer">
			<center>
				<button class="btn btn-primary" id="subscribe" value="<%=id%>">Subscribe</button>
			</center>
			</div>
		
		</center>
		</div>
		</div>
		<div class="col-lg-3"></div>
	
	   
   <%
   }
   else
   {
	%>
	<div class="col-lg-3"></div>
		<div class="col-lg-6">
		<div class="well h4">
		<center><b>
		 Hey <%=name%>, you have subscribed to us !
		 </b></center>
		</div>
		<br>
		<div class="panel">
		<center>
			<div class="panel panel-header">
				<div class="well">
				<center>
				 You are receiving our updates on :
				 </center>
				</div>
			</div>
			
			<div class="panel panel-body">
				<% 
					Member memb = MemberWorker.getMemberById(Integer.parseInt(id));
				%>
			
				<div class="row">
					<div class="col-lg-4">
						Email ID :
					</div>
					<div class="col-lg-6">
						<input type="text" class="form-control" disabled id="email" value="<%=memb.getEmailId()%>">
					</div>
				</div>		
				
				<div class="row">
					<div class="col-lg-4">
						Mobile No :
					</div>
					<div class="col-lg-6">
						<input type="text" class="form-control" disabled id="mobile" value="<%=memb.getMobileNo()%>">
					</div>
				</div>			
			
			</div>
		
			<div class="panel panel-footer">
			<center>
				
			</center>
			</div>
		
		</center>
		</div>
		</div>
		<div class="col-lg-3"></div>
	
	<%     	   
   }
   %>
   
   <div subs-success class="modal fade">
   	<div class="modal-dialog modal-md">
   		<div class="modal-content">
   		<div class="modal-header">
   		<center>
   			<h4><b>Your have successfully subscribed to our updates!</b></h4>
   		</center>	
   		</div>
   		<div class="modal-footer">
					<a class="btn btn-primary "href="AddEventSubscription.jsp">OK</a>
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