<%@ page import="com.social.ngo.*;"%>

<%
	String id = request.getParameter("userId");
	String entity = request.getParameter("entity");
	String emailId = request.getParameter("emailId");
	String mobileNo = request.getParameter("mobileNo");
	String address = request.getParameter("address");
	
	if (mobileNo.equals("") && address.equals("")) {
		if (AccountWorker.emailVerify(entity, emailId).equals("exists")) {
%>
$("[email-exists-modal]").modal();
<%
	} else {
			String result = MemberWorker.updateEmailId(Integer.parseInt(id), emailId);
			if (result.equals("success")) {
%>
$("[update-success-modal]").modal();
<%
	} else {
%>
$("[update-unsuccess-modal]").modal();
<%
	}
		}

	}

	if (emailId.equals("") && address.equals("")) {
		if (AccountWorker.mobileVerify(entity, mobileNo).equals("exists")) {
%>
$("[mobile-exists-modal]").modal();
<%
	} else {
			String result = MemberWorker.updateMobileNo(Integer.parseInt(id), mobileNo);
			if (result.equals("success")) {
%>
$("[update-success-modal]").modal();
<%
	} else {
%>
$("[update-unsuccess-modal]").modal();
<%
	}
		}

	}

	if (emailId.equals("") && mobileNo.equals("")) {
		String result = MemberWorker.updateAddress(Integer.parseInt(id), address);
		if (result.equals("success")) {
%>
$("[update-success-modal]").modal();
<%
	} else {
%>
$("[update-unsuccess-modal]").modal();
<%
	}
	}
%>