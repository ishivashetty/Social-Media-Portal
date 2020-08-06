$(document).ready(function(){
    $("label[data-msg]").css({display:"none","background-color":"#fff","font-size":"14px","padding":"3px"})
    
    $("button[no-click]").click(function(e){
            e.preventDefault();
    })

    $("input[data-accept='number'], input[data-accept='digit']").keypress(function(e){
        var key=e.which || e.keyCode;
        if(key>=48 && key <= 57){
            $(this).next("label[data-msg='number']").fadeOut();
        }
        else{
            e.preventDefault();
            $(this).next("label[data-msg='number']").text("Please enter number digit");
            $(this).next("label[data-msg='number']").css({color:"#C0392B"}).fadeIn();
            
        }
    })

    $("input[data-accept='name']").keypress(function(e){
        var key=e.which || e.keyCode;
        if(key>=97 && key<= 122 || key>=65 && key<= 90 || key==32){
            $("label[data-msg='name']").fadeOut();
        }
        else{
            e.preventDefault();
            $("label[data-msg='name']").text("Only letters are allowed");
            $("label[data-msg='name']").css({color:"#C0392B"}).fadeIn();
            $("label[data-msg='name']").fadeOut(2000);
        }
    })
    
    $("input[data-accept='name']").blur(function(e){
        var strName = $(this).val().length;
        if($(this).val().length>=3 || $(this).val().length==0)
        {
            $(this).next("label[data-msg='name']").fadeOut();
        }
        else
        {
            e.preventDefault();
            $("label[data-msg='name']").text("Inavlid Name");
            $("label[data-msg='name']").css({color:"#C0392B"}).fadeIn();
            $(this).focus();
        }
    })

    $("input[data-accept='email']").blur(function(e){
        var strEmail = $(this).val();
        var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        var result = expr.test(strEmail);
        if(result==true || $(this).val().length==0)
        {
        	$("label[data-msg='email']").fadeOut();
        }
        else
        {
            e.preventDefault();
            $("label[data-msg='email']").text("Invalid Email ID");
            $("label[data-msg='email']").css({color:"#C0392B"}).fadeIn();
            $(this).focus();
        }
    })

    $("input[data-accept='mobile']").keypress(function(e){
        var key=e.which || e.keyCode;
        var strMobile = $(this).val().length;
        if(key>=48 && key <= 57){
        	$("label[data-msg='mobile']").fadeOut();
        }
        else{
            e.preventDefault();
            $("label[data-msg='mobile']").text("");
            $("label[data-msg='mobile']").css({color:"#C0392B"}).fadeIn();
            $("label[data-msg='mobile']").fadeOut(2000);
        }
        if(strMobile>=10)
        {
            e.preventDefault();
            $("label[data-msg='mobile']").text("Mobile Number cannot exceed 10 digits");
            $("label[data-msg='mobile']").css({color:"#C0392B"}).fadeIn();
            $("label[data-msg='mobile']").fadeOut(2000);
        }
    })

    $("input[data-accept='mobile']").blur(function(e){
        var strMobile = $(this).val().length;
        if($(this).val().length==10 || $(this).val().length==0)
        {
            $(this).next("label[data-msg='mobile']").fadeOut();
        }
        else
        {
            e.preventDefault();
            $("label[data-msg='mobile']").text("Inavlid Mobile Number");
            $("label[data-msg='mobile']").css({color:"#C0392B"}).fadeIn();
            $(this).focus();
        }
    })
    
    $("input[data-accept='password']").click(function(e){
            e.preventDefault();
            $("label[data-msg='password']").text("Password should contain minimum 6 characters");
            $("label[data-msg='password']").css({color:"#C0392B"}).fadeIn();
            $("label[data-msg='password']").fadeOut(2000);
            $(this).focus();
    })

    $("input[data-accept='password']").blur(function(e){
       $("input[data-accept='cnfPassword']").val("");
       if($(this).val().length>=6 || $(this).val().length==0)
       {
    	   $("label[data-msg='password']").fadeOut();
       }
       else
       {
            e.preventDefault();
            $("label[data-msg='password']").text("Password should contain minimum 6 characters");
            $("label[data-msg='password']").css({color:"#C0392B"}).fadeIn();
            $(this).focus();
       }
    })
    
    $('#txtLoginPassword').keypress(function (e) {		//MemberLogin.jsp
    	var key = e.which;
    	if(key == 13)
    	{
    		e.preventDefault();
    		$('#btnMemberSubmit').click();
    	}
    })


    $("input[data-accept='cnfPassword']").click(function(e){
       if($("input[data-accept='password']").val().length==0)
       {
            $("input[data-accept='password']").focus();
       }
    })

    $("input[data-accept='cnfPassword']").blur(function(e){
        var pass = $("input[data-accept='password']").val();
        var cnfPass = $(this).val();
        if(pass==cnfPass)
        {
        	$("label[data-msg='cnfPassword']").fadeOut();
        }
        else
        {
            e.preventDefault();
            $("label[data-msg='cnfPassword']").text("Passwords did not match. Confirm Again.");
            $("label[data-msg='cnfPassword']").css({color:"#C0392B"}).fadeIn(1000);
            $(this).val("");
        }
    })
    
    $("input[data-accept='dob']").click(function(e){
            $("label[data-msg='dob']").text("You should be minimum 15 years old to Register!");
            $("label[data-msg='dob']").css({color:"#C0392B"}).fadeIn();
            $("label[data-msg='dob']").fadeOut(4000);
            $(this).focus();
    })
     
    $("textarea[data-accept='address']").blur(function(e){
        if($(this).val().length>=30 || $(this).val().length==0)
        {
            $(this).next("label[data-msg='address']").fadeOut();
        }
        else
        {
            e.preventDefault();
            $("label[data-msg='address']").text("Address must contain atleast 30 characters");
            $("label[data-msg='address']").css({color:"#C0392B"}).fadeIn();
            $("label[data-msg]").fadeOut(2000);
            $(this).focus();
        }
    })
    
     $("input[data-accept], input[data-accept]").blur(function(e){
        $("label[data-msg]").fadeOut(2000);
    })
    
})