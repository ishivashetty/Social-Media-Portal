<%@ page import="com.social.ngo.*,java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>ShowAllMembers</title>
   <script src="src/js/jquery.min.js"></script>
<script language="javascript">

$(document).ready(function() {
	
    
    $("button[data-btn]").click(function(e){
    	/* $('#content').load('ShowAllMembers.jsp'); */
    	abc = this.val();
    	alert(abc);
    });
   
    $("button[data-xx]").click(function(e){
    	
    	/* $('#content').load('ShowAllMembers.jsp'); */
    	abc = $(this).val();
    	alert(abc);
    });
    
   
});

</script>
</head>
<body>
   <%
       ArrayList<Member> list = MemberWorker.getAllMembers();
   
   %>   
   
   
   
   <table border=1>
   <tr>
	
           <th>Name</th>
           <th>Button</th>
           <th></th>
           <th>EmailId</th>
           <th>Password</th>
           <th>MobileNo</th>
           <th>ProfilePhoto</th>
           <th>Gender</th>
           <th>Address</th>
           <th>Dob</th>
   </tr>   
   <% for(Member memb:list)
   {
       int id = memb.getId();
   %>
   <tr>
       <td data-abc="<%=memb.getId()%>"><a href="ShowMemberById.jsp?id=<%=id%>"><%=memb.getName() %></a></td>

           <th><button data-xx value="<%=memb.getId() %>">Click</button></th> 
           <th></th>
           
           <th><%=memb.getEmailId()%></th>
           <th><%=memb.getPassword()%></th>
           <th><%=memb.getMobileNo()%></th>
           <th><%=memb.getProfilePhoto()%></th>
           <th><%=memb.getGender()%></th>
           <th><%=memb.getAddress()%></th>
           <th><%=memb.getDob()%></th> 
           
           </tr>	
   <%
   }
   %>
</table>

</body>
</html>