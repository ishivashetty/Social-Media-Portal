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
<title>Management Registration</title>
<link href="src/css/bootstrap.min.css" rel="stylesheet">
<link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="src/css/Montserrat.css" rel="stylesheet">
<link href="src/mycss/MemberAccount.css" rel="stylesheet">

<script src="src/js/jquery.min.js"></script>

<script language="javascript">
	$(document).ready(function() {
		
		$("#name").keypress(function(e){
	        var key=e.which || e.keyCode;
	        if(key>=97 && key<= 122 || key>=65 && key<= 90 || key==32){
	            
	        }
	        else{
	            e.preventDefault();
	        }
	    });
	    
	    $("#mobile").keypress(function(e){
        var key=e.which || e.keyCode;
        var strMobile = $(this).val().length;
        if(key>=48 && key <= 57){	
        }
        else{
            e.preventDefault();
        }
        if(strMobile>=10)
        {
            e.preventDefault();
        }
    	});
	    
	    $("#submit").click(function(e){
	    	
	    	var strEmail = $("#email").val();
	        var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	        var result = expr.test(strEmail);
	        var pass = $("#password").val();
	        var cnfPass = $("#cnfPassword").val();
	        var mobile = $("#mobile").val();
	        var strMobile = $("#mobile").val().length;
	        var name = $("#name").val();
	        
	        if(result==false)
			{
	            e.preventDefault();
	            $("[email-invalid-modal]").modal();
	        }
	        else if(pass!=cnfPass)
	        {
	        	 e.preventDefault();
		           $("[password-invalid-modal]").modal();
	        }
	        else if(strMobile!=10)
	        {
	        	 e.preventDefault();
		         alert("Enter a 10 digit Mobile No");
	        }
	        else if(pass.length<6 || cnfPass.length<6)
	        {
	        	e.preventDefault();
	        	alert("Enter a password of minimum length 6");
	        }
	        else if($("#name").val().length<3)
	        {
	        	e.preventDefault();
	        	alert("Enter a valid name");
	        }
	        else
	        {
	        	$.ajax({		
	                type : "POST",
	                url : "AddManagementAction.jsp",
	                data : "name=" + name + "&emailId=" + strEmail + "&emailId=" + pass + "&mobileNo=" + mobile,
	                success : function(response) {
	 					eval(response);
	                }
	            });  	
	        }
	        
	        
	   	});
	    
    
    
	    

	});
</script>
</head>

<body>
<br>
<div class="well" align="center">
<span class="h3">ADMIN PANEL</span><br>
<span class="h4">Management Registration</span>
</div>
	
	<div class="col-sm-2"></div>
	
		<div class="col-sm-8">
		<div id="regPanel" class="panel panel-default">
			<br>
			

			<div class="panel panel-body">

				

					<div class="input-group" id="txtName">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-user"></span>
						</div>
						<input type="text" class="form-control" name="name" id="name" placeholder="Name">
					</div>
					<br>
					
					
					<div class="input-group" id="txtMobile">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-phone"></span>
						</div>
						<input type="text" class="form-control" name="mobileNo" id="mobile" placeholder="Mobile No">
					</div>
					<br>

					<div class="input-group" id="txtEmail">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-envelope"></span>
						</div>
						<input type="text" class="form-control" name="emailId" id="email" placeholder="Email-ID">
					</div>
					<br>

					<div class="input-group" id="txtPassword">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-eye-open"></span>
						</div>
						<input type="password" class="form-control" name="password" id="password" placeholder="Password">
					</div>
					<br>

					<div class="input-group" id="txtCnfPassword">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-eye-open"></span>
						</div>
						<input type="password" class="form-control" name="cnfPassword" id="cnfPassword" placeholder="Confirm Password">
					</div>
					<br>	
					
					<br>
					
					<div>
						<button id="submit" class="btn btn-primary">Submit</button>
					</div>
				

				
			</div>

		</div>
	</div>
	<div class="col-sm-2"></div>
	
	<div email-invalid-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Enter a valid Email-Id.</h3>
				</div>

				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<div password-invalid-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Both the passwords do not match with each other</h3>
				</div>

				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<div added-success class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Management has been registered successfully.</h3>
				</div>

				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<div added-unsuccess class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Management could not be registered.</h3>
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