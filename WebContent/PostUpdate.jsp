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
<title>Account Update</title>
<link href="src/css/bootstrap.min.css" rel="stylesheet">
<link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="src/css/Montserrat.css" rel="stylesheet">
<link href="src/mycss/MemberAccount.css" rel="stylesheet">

<script src="src/js/jquery.min.js"></script>

<script language="javascript">

$(document).ready(function() {
	
	$("button[btn-update-desc]").click(function(e) {
		e.preventDefault();
    	var postId = $(this).val();
    	var desc = $("textarea[txt-description='"+postId+"']").val();
    	if(desc.length==0)
    		{
    		}
    	else
    		{
				$.ajax({
                type : "POST",
                url : "PostDescUpdate.jsp",
                data : "postId=" + postId + "&description=" + desc ,
                success : function(response) {
 					eval(response);
                }
            });  
    		}
    });
	
	$("button[btn-delete]").click(function(e) {
		e.preventDefault();
		var postId = $(this).val();
		$("[post-deletion-modal='"+postId+"']").modal();
    });
	
	$("button[btn-post-delete]").click(function(e) {
		e.preventDefault();
    	var postId = $(this).val(); 
				$.ajax({
                type : "POST",
                url : "DeletePostAction.jsp",
                data : "postId=" + postId ,
                success : function(response) {
 					eval(response);
                }
            });  
    });

});
	
</script>
</head>

<body>
<input type="hidden" id="entity" value="<%=entity%>">

<%
if(entity.equals("member"))
{
%>
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

<%
}
else
{

%>
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
				<li><a href="ManagementAccount.jsp"><span
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
						<li><a href="MgmtAccountUpdate.jsp"><span
								class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;Update
								Account</a></li>
						<li><a href=""><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;Logout</a></li>
					</ul></li>
			</ul>

		</div>
	</div>
<%
}
%>

	
	
	<br><br><br>
	<%
		ArrayList<Post> list = PostWorker.getPost(entity,Integer.parseInt(id));
		if(!list.isEmpty())
		{
			for(Post post:list)
			   {
			       String postId = String.valueOf(post.getId());
			       String user = post.getUserId();
			       String desc = post.getDescription();
			       String image = "Images/" + post.getPhoto();
			      
	%>
	
	<div class="col-lg-4">
	<div class="panel panel-default">
			<div class="panel panel-header" style="padding-left: 6%; padding-left: 4%; margin : 0%;">
				<div class="row">
					<div class="col-xs-3">
						<img src="src/mycss/images/user.jpg"
							class="img-thumbnail img-circle pull-left"
							style="margin-right: 2%; height: 60px; width: 60px;">
						</div>
						<div class="col-xs-6">	
						<div style="margin-top: 4%;"><br>
						<span class="h5">&nbsp;&nbsp;<%=TimeStampWorker.formatTime(String.valueOf(post.getTime()))%></span>
						</div>
						</div>
						<div class="col-xs-1">
						<button btn-delete value="<%=postId%>"><i class="fa fa-trash fa-2x"></i></button>
						</div> 
				</div>
			</div>


			<div class="panel panel-body" style="padding: 3%; margin : 0%;">
			<div class="row">
						<textarea txt-description="<%=postId%>" class="form-control" required name="description" cols="1" rows="3"
							style="max-height: 80% max-width:80%; resize: vertical;"><%=desc%></textarea>			
			</div>
			<br>
			<div class="row">	
				<center>
				<button btn-update-desc class="btn btn-primary" value="<%=postId%>">Update Description</button>
				</center>
			</div>
			<br>
			<div class="row" style="padding: 3%; margin : 0%;">	
				<img src="<%=image%>" class="img-responsive"
					style="height: 100%; width: 100%;"> </img>
			</div>
			<div class="row">	
			<br>
			<form method="post" action="PostPhotoUpdate.jsp" enctype="multipart/form-data">
			<input type="file" required name="photo" accept="image/*"><br>
			<center>
			<input type="hidden" name="postId" value="<%=postId%>">
			
			<button type="submit" class="btn btn-primary">Update Photo</button>
			<h4><a href="PostUpdate.jsp" class="glyphicon glyphicon-refresh"></a></h4>
			</center>
			</form>
			</div>		
			</div>
			
			<div post-deletion-modal="<%=postId%>" class="modal fade">
			<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Delete this post?</h3>
				</div>

				<div class="modal-footer">
					<button btn-post-delete value="<%=postId%>" class="btn btn-default" value>YES</button>
					<button class="btn btn-default" data-dismiss="modal">NO</button>
				</div>
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
	<div class="well">
		<h3>You have no posts to display!!</h3> <hr>
		<a href="MemberAccount.jsp" class="btn btn-primary">Upload a post</a>
	</div>
<%
}
%>
	<div post-updated-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Your post has been updated.</h3>
				</div>

				<div class="modal-footer">
					<a class="btn btn-default" href="PostUpdate.jsp">OK</a>
				</div>
			</div>
		</div>
	</div>
	
	<div post-notupdated-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Your post could not be updated.</h3>
					<h4>Please try again later.</h4>
				</div>

				<div class="modal-footer">
					<a class="btn btn-default" href="PostUpdate.jsp">OK</a>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<div post-deleted-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Your post has been deleted.</h3>
				</div>

				<div class="modal-footer">
					<a class="btn btn-default" href="PostUpdate.jsp">OK</a>
				</div>
			</div>
		</div>
	</div>
	
	<div post-notdeleted-modal class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<div class="modal-header">
					<h3>Your post could not be deleted.</h3>
					<h4>Please try again later.</h4>
				</div>

				<div class="modal-footer">
					<a class="btn btn-default" href="PostUpdate.jsp">OK</a>
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