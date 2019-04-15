<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	conn=DriverManager.getConnection("jdbc:mysql://localhost/sell_data","root","");
	Statement stmt = conn.createStatement();
	String sql = "select * from sell";
	ResultSet rs = stmt.executeQuery(sql);
	%>
	  <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>Displaying books available!</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Author</th>
                <th>Price</th>
                <th>PhoneCode</th>
                <th>Phone</th>
            </tr>
        
       <% 
	while(rs.next())
	{
		%><tr><%
		%><th><%
		out.print(rs.getString("id"));
		%><th><%
		out.print(rs.getString("name"));
		%><th><%
		out.print(rs.getString("author"));
		%><th><%
		out.print(rs.getInt("price"));
		%><th><%
		out.print(rs.getInt("phonecode"));
		%><th><%

		out.print(rs.getLong("phone"));
		//out.print("ID:" + rs.getInt("id") + "name:" + rs.getString("name") + "author:" + rs.getString("author") + "phonecode:" + rs.getInt("phonecode") + "phone:" + rs.getInt("phone") + "price:" + rs.getInt("price"));
		%><tr><%
	}
	
	if(conn!=null)
	{
		out.print("Connected successfully");
		
	}
}catch(SQLException e)
{
	//out.print("not connectedddd!");
}
%>
</body>
</html>

