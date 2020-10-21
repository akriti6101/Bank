<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@ page import="com.training.Bean.CustomerBean"%>
<%@ page import="com.training.bank.CustomerDisplay"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	 function check(){
		 if (document.getElementById("amt").value=="0"){
			 alert("Not enough money to transfer!!!");
		 window.location.reload(true);
		 }
		 
	 }
	</script>
</head>
<body>
<div align="center">
<h1>Customer Details</h1>
	<form action="Transaction.jsp">
   <table>
   
		<b>The selected customer is:</b>
		<%
		String val1 = request.getParameter("cust");
	out.println(val1);
	session.setAttribute("cust", val1);
	CustomerDisplay obj = new CustomerDisplay();
    ResultSet rs = obj.getConnect(val1);
    while(rs.next())
    {
        out.println("<br/><b>Email:</b>"+rs.getString("email")+"<br/><b>Account No.:</b>"+rs.getString("acctno") +" <br/><b>Balance:</b>"+rs.getString("balance")); 
    }
    
	%>
	<br/>
	<br/>
	
	<b>Select the customer whom you want to transfer money:</b>
	<select name="TransCust">
		<option>Select Customers</option>
			<%
				CustomerDisplay objs = new CustomerDisplay();
				List<CustomerBean> ls = objs.getCustomers();//function from CustomerDisplayClass
               
				for (CustomerBean cbs : ls) {
					
			%>
			<option><%out.print(cbs.getName());%></option>
			<%
				}
			%>
		
	</select>
	
	<br/><br/>
	<b>Enter the amount you want to transfer:</b>
	<input type="text" id="amt" name="amt" >
	
		<br /> <br /> <input type="submit" value="PAY" onclick="check()">
		
		</table>
	</form>
	</div>
</body>
</html>