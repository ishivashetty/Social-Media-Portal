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
<title>Save Card</title>
<link href="src/css/bootstrap.min.css" rel="stylesheet">
<link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="src/css/Montserrat.css" rel="stylesheet">
<link href="src/mycss/MemberAccount.css" rel="stylesheet">

<script src="src/js/jquery.min.js"></script>

<script language="javascript">
	$(document).ready(function() {
		
		$("#num").keypress(function(e){
			var key = e.which || e.keyCode;
			if(key>=48 && key <= 57)
				{
				
				}
			else
				e.preventDefault();
		});
		
		
		$("#num").blur(function(e){
			var num = $(this).val();
			if(num.length==16 || num.length==0)
			{
				var type = num.substring(0,1);
				
				if (type==4)
					$("#type").text('VISA');
				else if (type==5)
					$("#type").text('MASTERCARD');
				else if (type==6)
					$("#type").text('RUPAY');
				else
					$("#type").text('DEBIT');	
			}
			else
			{
				$("#type").text('INVALID');
				$("[cardnum-invalid-modal]").modal();
			}
			
		});
		
		$("#name").keypress(function(e){
		var key=e.which || e.keyCode;
        if(key>=97 && key<= 122 || key>=65 && key<= 90 || key==32)
        {
        	
        }
        else
			e.preventDefault();
		});
		
		$("#name").blur(function(e){
			var name = $(this).val();
			if(name.length>=5 && name.length<=20 || name.length==0)
			{
				
			}
			else
			{
				$("[cardname-invalid-modal]").modal();
			}
			
		});
		
		
		
		$("#year").keypress(function(e){
			var key = e.which || e.keyCode;
			var year = $(this).val().length;
			if(key>=48 && key <= 57)
				{
				
				}
			else
				e.preventDefault();
			if(year>=4)
				e.preventDefault();
		});
		
		$("#year").blur(function(e){
			var year = $(this).val();
			if(year.length!=4)
				$("[cardyear-invalid-modal]").modal();
			else if(year<2017 || year>2030)
				{
					$(this).val('2017');
					$("[cardyear-invalid-modal]").modal();
				}
				
		});
		
		
		$("#cvv").keypress(function(e){
			var key = e.which || e.keyCode;
			var cvv = $(this).val().length;
			if(key>=48 && key <= 57)
				{
				
				}
			else
				e.preventDefault();
			if(cvv>=3)
				e.preventDefault();
		});
		
		$("#cvv").blur(function(e){
			if($(this).val().length!=3)
				$("[cardcvv-invalid-modal]").modal();
		});
		
		
		
		
		$("#save").click(function(e) {
			
			var id = $(this).val();
			var type =$("#type").text();
			var num = $("#num").val();
			var name = $("#name").val();
			var month = $("#month").val();
			var year = $("#year").val();
			var cvv = $("#cvv").val();
			
			if(num.length!=16 || isNaN(num))
				$("[cardnum-invalid-modal]").modal();
			else if(name.length<5 || name.length>20)
				$("[cardname-invalid-modal]").modal();
			else if(year.length!=4)
				$("[cardyear-invalid-modal]").modal();
			else if(cvv.length!=3 || isNaN(cvv))
				$("[cardcvv-invalid-modal]").modal();	
			else
			{
				var date = month +'-'+ year;
				$.ajax({
	                type : "POST",
	                url : "AddCardAction.jsp",
	                data : "memberId=" + id + "&cardType=" + type + "&cardNumber=" + num + 
	                "&cardName=" + name + "&expiryDate=" + date + "&cvv=" + cvv,
	                success : function(response) {
	 					eval(response);
	                }
	            }); 
				$("#num").val('');
				$("#name").val('');
				$("#month").val('01');
				$("#year").val('2017');
				$("#cvv").val('');
				$("#type").text('');
				
			}
		});

	});
</script>
</head>

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

	
	<div class="panel panel-default">
		<div class="panel panel-header" align="center">
			
		</div>

		<div class="panel panel-body" align="center"
			style="padding: 1%; margin: 0%;">
			
		</div>

		<div class="panel panel-footer" align="center" style="margin: 0%;">
			<button id="save" value="<%=id%>" class="btn btn-primary">Save</button>
			</form>


		</div>
	</div>
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
	


	<script src="src/js/jquery.min.js"></script>
	<script src="src/js/bootstrap.min.js"></script>

</body>
</html>
<%
	}
%>