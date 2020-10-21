<%@page import="java.sql.ResultSet"%>
<%@ page import="com.training.Bean.CustomerBean"%>
<%@ page import="com.training.bank.CustomerDisplay"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:skyblue">
<a href="Home.html">BACK TO HOME</a>
<div align="center">
<h2>TRANSACTION COMPLETE</h2>
<b>Money is transferred to :</b>
<%= request.getParameter("TransCust") %>
<br/> <b>Money transferred by :</b>
<%= session.getAttribute("cust") %>
<br/>
<%
CustomerDisplay obj = new CustomerDisplay();
String str=(String)session.getAttribute("cust");
 ResultSet rs =obj.getConnect(str);//will have the donar amt
 //Smilarly for the recpient 
 String str1=request.getParameter("TransCust");
ResultSet rs1=obj.getConnect(str1);	//will have the recipient amt
rs.next();	 
String amtdedc=rs.getString("balance");
rs1.next();	
String amtinc=rs1.getString("balance");
float amt1=Float.parseFloat(amtdedc);
float amt2=Float.parseFloat(amtinc);
String amtfromtxt=request.getParameter("amt");//text box value
float amttxt=Float.parseFloat(amtfromtxt);
float subamt=amt1-amttxt;
float addamt=amt2+amttxt;
String strsubamt=Float.toString(subamt);
String straddamt=Float.toString(addamt);
out.println("Current amount after transfer:"+strsubamt);
obj.update(str,strsubamt);
obj.update(str1,straddamt);
%>

</div>
</body>
</html>