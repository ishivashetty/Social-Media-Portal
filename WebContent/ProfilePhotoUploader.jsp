<%@page contentType="text/html" pageEncoding="UTF-8"
	import="com.social.ngo.*,java.io.*,java.lang.*,java.sql.*,java.io.File,java.io.FileInputStream"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>

<html>
<head></head>
<body>
	<%
		String id = null;
		String entity = null;
		String photo = request.getParameter("photo");
		
		File savedFile;
		try {
			String fileimage = "";
			String itemName = "";
			boolean isMultipartRequest = ServletFileUpload.isMultipartContent(request);
			if (!isMultipartRequest) {
				/* System.out.println("<br>Not a Multipart Request"); */
			} else {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List items = null;
				try {
					items = upload.parseRequest(request);
				} catch (FileUploadException e) {
					e.getMessage();
				}

				Iterator itr = items.iterator();

				while (itr.hasNext()) {
					FileItem item = (FileItem) itr.next();
					if (item.isFormField()) {
						if ("id".equals(item.getFieldName()))
							id = item.getString();
						if ("entity".equals(item.getFieldName()))
							entity = item.getString();
					} else {
						try {
							itemName = item.getName();
							String path = MemberWorker.getPath();
							savedFile = new File(path + File.separator + itemName);
							item.write(savedFile);
							/* System.out.println("<br>Saved file path is " + savedFile);
							System.out.println("<br>Item Name is " + itemName); */
						} catch (Exception e) {
							/* out.println("<br>Error" + e.getMessage()); */
						}
					}
				}

				try {
					
					String result = AccountWorker.updateProfilePhoto(entity,Integer.parseInt(id),itemName);
					if (result.equals(Results.SUCCESS) && entity.equals("member") ) { 
						response.sendRedirect("AccountUpdate.jsp");
					} 
					else if (result.equals(Results.SUCCESS) && entity.equals("management") ) { 
						response.sendRedirect("MgmtAccountUpdate.jsp");
					} else {
						/* out.println("<br>Image NOT uploaded"); */
					}


				} catch (Exception e1) {
					out.println("<br>Image Insertion Error : " + e1.getMessage());
				}
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>
