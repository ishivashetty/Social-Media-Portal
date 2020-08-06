<%@page import="com.social.ngo.*,java.util.*"%>

<%
   String Search = request.getParameter("search");
   ArrayList<Member> list = MemberWorker.memberSearch(Search);
   if(list.isEmpty()==false)
   {
%>   
   		<table class="table table-striped" border="1">
   		
<%
		for(Member memb:list)
   		{
       		int id = memb.getId();
%>
			<tr>
			<td><%=memb.getName()%></td>
   			</tr>
<%
   		}
%>
   		</table>
<%
	
}
   else
   {
	   out.println("Members starting with <b>"+Search+"</b> are currently unavailable!");
   }
%>

