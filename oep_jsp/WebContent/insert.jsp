<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name = request.getParameter("name");
String author = request.getParameter("author");
String phonecode = request.getParameter("phonecode");
String phone = request.getParameter("phone");
String price = request.getParameter("price");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/sell_data", "root", "");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into sell(name,author,price,phonecode,phone)values('"+name+"','"+author+"','"+price+"','"+phonecode+"','"+phone+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>