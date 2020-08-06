<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html lang="en">
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Member Login</title>
    <link href="src/css/bootstrap.css" rel="stylesheet">
    <link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="src/css/Montserrat.css" rel="stylesheet">
    <link href="src/mycss/AdminLogin.css" rel="stylesheet">
    
<script src="src/js/jquery.min.js"></script>
<script language="javascript">
	$(document).ready(function() {	
		
		

				$("#adminLogin").click(function(e) {
					e.preventDefault();
					emailId = $("#txtEmailId").val();
					password = $("#txtPassword").val();
					entity = "member";
					
					if(emailId.length==0)
					{
							$("[email-modal]").modal();
					}
					else if(password.length==0)
					{
						$("[password-modal]").modal();
					}
					else
					{
						$.ajax({
							type : "POST",
							url : "AdminLoginCheck.jsp",
							data : "username=" + emailId +  "&password=" + password,
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


     <div class="col-xs-4"></div>

    <div class="col-md-4 col-xs-12">
      <div id="loginPanel" class="panel panel-default">
        <br>
        <div class="panel panel-header">
          <h1>ADMIN</h1>
        </div>
        <br>
		
        <div class="input-group" id="txtUser">
          <div class="input-group-addon">
            <span class="glyphicon glyphicon-envelope"></span>
          </div>
          <input type="text" required class="form-control" name="username"  id="txtEmailId" placeholder="Username">
        </div> 
        <br>

        <div class="input-group" id="txtPass">
          <div class="input-group-addon">
            <span class="glyphicon glyphicon-lock"></span>
          </div>
          <input type="password" minlength="6" required class="form-control" name="password" id="txtPassword" placeholder="Password">
        </div>
        <br>

        <div>
          <button id="adminLogin" class="btn btn-primary btn-submit" id="btnAdminSubmit">Admin Login</button> 
        </div><br>


        <div class="modal fade" id="forgot">
        <div class="modal-dialog modal-md">
        <div class="modal-content">

           <div class="modal-header">
            <h3>Forgot Password?</h3>
           </div>

           <div class="modal-body">
            <h4>Password will be sent to your registered Email-ID.</h4>
            <br>
            <div class="input-group" name="email">
              <div class="input-group-addon">
                <span class="glyphicon glyphicon-envelope"></span>
              </div>
              <input type="text" name="txtEmail" class="form-control" placeholder="Enter your Email-ID">
           </div>
           </div>

           <div class="modal-footer">
            <a href="" class="btn btn-primary">Send E-Mail</a>
            <a href="" class="btn btn-default" data-dismiss="modal">Close</a>
           </div>
        </div>
        </div>
        </div>

        <br><br>


      </div>
    </div>

    <div class="col-xs-4"></div>
    
    <div email-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Please enter your Username</h3>
				</div>

				<div class="modal-footer">
					<a class="btn btn-primary" href="AdminLogin.jsp">OK</a>
				</div>
			</div>
		</div>
	</div>
	
	<div password-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Please enter your Password.</h3>
				</div>

				<div class="modal-footer">
					<a class="btn btn-primary" href="AdminLogin.jsp">OK</a>
				</div>
			</div>
		</div>
	</div>
	
	
	<div login-failed-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Login Failed</h3>
				</div>
				
				<div class="modal-body">
					<h4>Email-ID and Password did not match with each other</h4>
				</div>

				<div class="modal-footer">
					<a class="btn btn-primary "href="AdminLogin.jsp">Try Again</a>
				</div>
			</div>
		</div>
	</div>
	
    <script src="src/js/jquery.min.js"></script>
    <script src="src/js/bootstrap.min.js"></script>
    <script src="src/js/Validations.js"></script>
   
</body>
</html>