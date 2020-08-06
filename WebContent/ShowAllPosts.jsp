<%@ page import="com.social.ngo.*,java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String userId = (String)session.getAttribute("id");%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Member Account</title>
<link href="src/css/bootstrap.min.css" rel="stylesheet">
<link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="src/css/Montserrat.css" rel="stylesheet">
<link href="src/mycss/MemberAccount.css" rel="stylesheet">
   
<script src="src/js/jquery.min.js"></script>
<script language="javascript">

$(document).ready(function() {
	/* var my = [22,33]; */
	
	/* $.ajax({
			    type: "POST",
			    url: "demo.jsp",
			    success: function (data) {
			    	alert(data);
			        
			        
			    }
			}); */
			/* 
			var i = 1;                     //  set your counter to 1

			function myLoop () {           //  create a loop function
			   setTimeout(function () {    //  call a 3s setTimeout when the loop is called
			      alert('hello');          //  your code here
			      i++;                     //  increment the counter
			      if (i <=4) {            //  if the counter < 10, call the loop function
			         myLoop();             //  ..  again which will trigger another 
			      }                        //  ..  setTimeout()
			   }, 3000)
			}

			myLoop(); */
		    
			
	/* 
		 for(var i = 1 ; i <= 10 ; i++)
		{
			likeCheck(i);
		}
   
		for(var j = 1 ; j <= 10 ; j++)
		{
			shareCheck(j);
		}*/
		 
		 for(var k = 1 ; k <= 10 ; k++)
		{
			postStatusCheck(k);
		}  
	 
	
	
	function likeCheck(i)
	{
		var userId="Shiva";
		$.ajax({
		type: "POST",
		url: "PostLikeChecker.jsp",
		data: "postId=" + i + "&userId=" +userId,
		success: function (response) {
			$("[post-like='"+i+"']").html(response);		         
	       }
		}); 	
	}
	
	function shareCheck(j)
	{
		var userId="Shiva";
		$.ajax({
            type : "POST",
            url : "ShareChecker.jsp",
             data : "postId=" + j + "&userId=" + userId,
            success : function(response) {
            	$("[post-share='"+j+"']").html(response);
            }
        }); 
	}
	
	function postStatusCheck(k)
	{
		
		$.ajax({
            type : "POST",
            url : "PostStatusCheck.jsp",
             data : "postId=" + k ,
            success : function(response) {
            	$("[post-data='"+k+"']").html(response);
            }
        }); 
	}
	
	

	
 	var timer1, delay1 = 2000; 
	timer1 = setTimeout(function(){
		for(var k = 1 ; k <= 8 ; k++)
		{
			setTimeout(likeCheck(k),2000);
			
		}
	
	}, delay1);
	
	/*  var timer2, delay2 = 4000; 
	timer2 = setTimeout(function(){
		for(var k = 1 ; k <= 8 ; k++)
		{
			setTimeOut(shareCheck(k),2000);
			
		}
	
	}, delay2);  */
	
	var timer3, delay3= 6000; 
	timer3 = setTimeout(function(){
		for(var k = 1 ; k <= 8 ; k++)
		{
			postStatusCheck(k);
		}
	
	}, delay3);
	 



	var timer, delay = 1500; 

	timer = setInterval(function(){
		for(var k = 1 ; k <= 4 ; k++)
		{
			postStatusCheck(k);
		}

	}, delay);
			 

    
	
	
	/* function a(){
	    for(i = 1; i <=4; i++)
	    {
	      myAjaxCall();
	    }
	}
	 */
	
	/* function myAjaxCall()
	{
		alert("ji");
		$.ajax({
		    type: "POST",
		    url: "demo.jsp",
		    success: function (data) {
		    	alert(i);
		        $("[post-data='"+i+"']").html(data);
		        
		    }
		});
	} */
	

	/* for (i = 1; i <=4; i++) { 
		
	
		
			$.ajax({
			    type: "POST",
			    url: "demo.jsp",
			    success: function (data) {
			    	alert(i);
			        $("[post-data='"+i+"']").html(data);
			        
			    }
			});
		    
		
		
		
	
	} */
	
	
	$('#abdc').click(function (e){
		e.preventDefault();
		$.ajax({
		    type: "POST",
		    url: "demo.jsp",
		    success: function (data) {
		        my = data;
		        alert(my[4]);
		    }
		});
		
		
	})
			
			
	
	userId = $('#userId').val();
	
	 //$("label[post-lblComment]").css({"background-color":"#fff","font-size":"14px","padding":"3px"}) 

	$("#abc").click(function(e) {
    	e.preventDefault();
    	
    	
    	postId = $(this).val();
    	
      	 	$.ajax({
      	 		
                type : "POST",
                url : "PostLikeChecker.jsp",
                data : "userId=" + userId + "&postId=" + postId,
                success : function(response) {
                	$("button[post-like='"+postId+"']").html(response);
                	alert(response);
                	
                }
            });

      	 /* 	$.ajax({
                type : "POST",
                url : "ShareChecker.jsp",
                 data : "postId=" + postId + "&userId=" + userId,
                success : function(response) {
                	$("[xpost-share='"+postId+"']").html(response);
                }
            }); */
    });
	
    $("button[post-like]").click(function(e) {
    	e.preventDefault();
    	postId = $(this).val();
      	 	$.ajax({
                type : "POST",
                url : "PostLiker.jsp",
                data : "postId=" + postId + "&userId=" + userId,
                success : function(response) {
                	$("[post-like='"+postId+"']").html(response);
                }
            });
    }); 
    
    $("button[post-focus-comment]").click(function(e) {
    	e.preventDefault();
    	postId = $(this).val();
      	 	
        $("textarea[post-comment='"+postId+"']").focus();

    }); 
    
    
    /* $('#btnss').click(function(e){
    	e.preventDefault();
    	
    	$.ajax({
  		       type : "POST",
                    url : "ShowAllMembers.jsp",
                    
                    success : function(response) {
                    	$("#content").html(response);
                    	
                    }
                });
    }); */
   
    $("button[post-comment]").click(function(e) {
    	e.preventDefault();
    	postId = $(this).val();
    	
comment = $("textarea[post-comment='"+postId+"']").val();
 		
		if(comment.length==0)
		{	
		}
    	
    	else{
    		
    		$.ajax({
                type : "POST",
                url : "AddCommentAction.jsp",
                
                data : "postId=" + postId + "&desc="+ comment +"&userId=" + userId,
                success : function(response) {
                	$("label[post-lblComment='"+postId+"']").fadeOut();
                	$("label[post-lblComment='"+postId+"']").html(response);
                	
                }
            });
    		
    		$("textarea[post-comment='"+postId+"']").val('');	
			$("label[post-lblComment='"+postId+"']").fadeIn(1000);
    	}
    	
      	 	
    });  
    
    
    
   /*  $("button[post-comment]").click(function(e) {
    	e.preventDefault();
    	postId = $(this).val();
    	
 		comment = $("textarea[post-comment='"+postId+"']").val();
 		
		if(comment.length==0)
		{	
		}
		else
		{
			
			$.ajax({
				
                type : "POST",
                url : "AddCommentAction.jsp" ,
                data :  + "postId=" + postId + "&userId=" + userId + "&desc=" + comment,
                success : function(response) {
                	
                	$("label[post-lblComment='"+postId+"']").fadeOut();
                	$("label[post-lblComment='"+postId+"']").html(response);
                }
            }); 
			
			$("textarea[post-comment='"+postId+"']").val('');	
			$("label[post-lblComment='"+postId+"']").fadeIn(1000);
			
			
		}
      	 	
    });   */
    
   /*  $("label[post-lblComment]").fadeOut(); */
    
     
    $("button[post-share]").click(function(e) {
    	e.preventDefault();
    	postId = $(this).val();
    	
    	$.ajax({
            type : "POST",
            url : "ShareModalChecker.jsp",
             data : "postId=" + postId + "&userId=" + userId,
            success : function(response) {
            	eval(response);
            }
        });
		
    });  
    
    $("button[post-shared-yes]").click(function(e) {
    	e.preventDefault();
    	postId = $(this).val();
    	
    	$.ajax({
            type : "POST",
            url : "AddShareAction.jsp",
             data : "postId=" + postId + "&userId=" + userId,
            success : function(response) {
            	$("button[post-share='"+postId+"']").html(response);
            }
        });
    });  
    
    
});

</script>
   
</head>
<body>

<input type="hidden" id="userId" value="<%=userId%>">

	<div class="col-lg-12">
	<%
	
  ArrayList<Post> list = PostWorker.getAllPosts();
if(!list.isEmpty())
{
  for(Post post:list)
   {
       String postId = String.valueOf(post.getId());
       String user = post.getUserId();
       String userType = post.getUserType();
       if(userType.equals("member"))
       {
    	   Member memb = MemberWorker.getMemberById(Integer.parseInt(user));
    	   user = memb.getName();
       }
       else
       {
    	   Management mgmt = ManagementWorker.getManagementById(Integer.parseInt(user));
    	   user = mgmt.getName();
       }
       String desc = post.getDescription();
       String image = "Images/" + post.getPhoto();
       String name = "Shiva";
               
   %>
	
	

		<br> <br>

		<div class="panel panel-default">
			<div class="panel panel-header">
				<div class="row">
					<div class="col-xs-9 col-md-5">
						<img src="src/mycss/images/user.jpg"
							class="img-thumbnail img-circle pull-left"
							style="margin-right: 2%; height: 60px; width: 60px;">
						<div style="margin-top: 4%;">
							<span class="h5">&nbsp;&nbsp;</span>
							<%=user%><br> <span class="h6">&nbsp;&nbsp;<%=TimeStampWorker.formatTime(String.valueOf(post.getTime()))%></span>
						</div>         
					</div>
					<div class="col-xs-2 col-md-6"></div>
					
				</div>
			</div>


			<div class="panel panel-body" style="padding: 1%; margin : 0%;">
				<p style="text-align: center;">
					<span class="h5"><%=desc%></span>
				</p>

				<img src="<%=image%>" class="img-responsive"
					style="height: 100%; width: 100%;"> </img>
					
				<div post-data="<%=postId%>" value="<%=postId%>" class="panel" style="text-align: left;">
					
				</div>
			</div>



			<div class="panel panel-footer" style="margin : 0%;">
				<div class="row">
					
					<div class="col-xs-4">
						<button post-like="<%=postId%>" value="<%=postId%>" id="btnLike">
							
						</button>
					</div>


					<div class="col-xs-4">
						<button post-focus-comment="<%=postId%>" value="<%=postId%>" id="btnComment">
							<span class="glyphicon glyphicon-comment"></span><span
								class="hidden-xs">&nbsp;&nbsp;Comment</span>
						</button>
					</div>

					<div class="col-xs-4">

						<button post-share="<%=postId%>" value="<%=postId%>">
							<div post-share-btn="<%=postId%>" id="divBtnLike"></div>
						</button>


						<div post-share-yes-modal="<%=postId%>" id="modalShare"
							class="modal fade">
							<div class="modal-dialog modal-md">
								<div class="modal-content">

									<div class="modal-header">
										<h3>Share this post?</h3>
									</div>

									<div class="modal-body">
										<h4>Sharing will make this post available on your
											profile.</h4>
										<h6>You can share a post only once!</h6>
										<br>
									</div>

									<div class="modal-footer">
										<button post-shared-yes class="btn btn-primary"
											value="<%=postId%>" data-dismiss="modal">Yes, Share</button>
										<button class="btn btn-default" data-dismiss="modal">No,
											Thanks</button>
									</div>
								</div>
							</div>
						</div>

						<div post-share-no-modal="<%=postId%>" class="modal fade">
							<div class="modal-dialog modal-md">
								<div class="modal-content">

									<div class="modal-header">
										<h3>Remove this shared post?</h3>
									</div>

									<div class="modal-body">
										<h4>Removing this share will delete the post from your
											profile.</h4>
										<h6>Once removed, you can share again</h6>
										<br>
									</div>

									<div class="modal-footer">
										<button post-shared-yes class="btn btn-primary"
											value="<%=postId%>" data-dismiss="modal">Yes, Remove</button>
										<button class="btn btn-default" data-dismiss="modal">No,
											Thanks</button>
									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
				
				<hr>
				<div class="media">
					<div class="media-left media-top">
					
						<img src="src/mycss/images/user.jpg" class="media-object"
							style="width: 45px">
					</div>

					<div class="media-body">
						<textarea post-comment="<%=postId%>" value="<%=postId%>" required placeholder="Comment"
							cols="1" rows="2"
							style="display: table-cell; width: 100%; resize: vertical;"></textarea>
						<label post-lblComment="<%=postId%>"></label>
					</div>

					<div class="media-right media-top">
						<button class="btn btn-default btn-lg" post-comment
							value="<%=postId%>">
							<span class="glyphicon glyphicon-comment"></span>
						</button>
					</div>
				</div>





				
			</div>

		</div>

		<br>
	  
	
	<%
   }
}
else
{
	%>
	No posts to display !!
	<%
}

   %> 
</div>

	<script src="src/js/jquery.min.js"></script>
	<script src="src/js/bootstrap.min.js"></script>
</body>
</html>