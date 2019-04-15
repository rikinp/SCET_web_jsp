<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid=request.getParameter("userid"); 
session.putValue("userid",userid); 
String password=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sell_data","root","");
Statement st= con.createStatement(); 
String fuser = "";
String fpass = "";
ResultSet rs=st.executeQuery("select * from login1 where userid='"+userid+"' and password='"+password+"'"); 
try{
while(rs.next()){
fuser = rs.getString("userid");
fpass = rs.getString("password");
}
if(userid.equals(fuser) && password.equals(fpass)) 
{ 	
	//out.print("Welcome " +userid); 
	String redirectURL = "http://localhost:8071/oep_jsp/buysell.html";
	response.sendRedirect(redirectURL);
} 
else
{
	out.print("Invalid password or username.");
}
}
catch (Exception e) {
out.print("Invalid password or username. frmmm");
	}
%>