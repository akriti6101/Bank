<%@page import="java.util.List"%>
<%@ page import="com.training.Bean.CustomerBean"%>
<%@ page import="com.training.bank.CustomerDisplay"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

	<a href="Home.html">Back</a>
	<form action="display.jsp" method="post" >
	<div align="center">
		<font color="Blue" size="3px">
			<h2 style="text-decoration: underline">Customers List</h4>
		</font> <big>Select Customer:</big> 
		<select name="cust">
			<option>Select Customers</option>
			<%
				CustomerDisplay obj = new CustomerDisplay();
				List<CustomerBean> ls = obj.getCustomers();//function from CustomerDisplayClass
               
				for (CustomerBean cbs : ls) {
					
			%>
			<option><%out.print(cbs.getName());%></option>
			<%
				}
			%>
		</select>
		
		<input type="submit" value="SUBMIT">
</div>
	</form>

</body>
</html>