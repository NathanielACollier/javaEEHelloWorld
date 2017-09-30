<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!--  IBM i dev server link:
	http://zeus:10909/InvoiceApproval/Index.jsp
	 -->
<% Date d = new Date(); %>

<h1>
	Today's date is <%= d.toString() %> and this jsp page worked!
</h1>

<div>
	Java version is <%= System.getProperty("java.version") %>
</div>

</body>
</html>