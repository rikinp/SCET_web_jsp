<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost";
String dbName = "sell_data";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<body>
<h2 align="center"><font color="#FF00FF"><strong>Select query in JSP</strong></font></h2>
<table align="center" cellpadding="4" cellspacing="4">
<tr>

</tr>
<tr bgcolor="#008000">
<td><b>Id</b></td>
<td><b>Name</b></td>
<td><b>Address</b></td>
<td><b>Destination </b></td>
<td><b>Salary</b></td>
<td><b>DateOfJoin</b></td>
</tr>
<%
try {
connection = DriverManager.getConnection(
connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM sell";

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>
<tr bgcolor="#8FBC8F">

<td><%=resultSet.getString("id")%></td>
<td><%=resultSet.getString("name")%></td>
<td><%=resultSet.getString("author")%></td>
<td><%=resultSet.getString("price")%></td>
<td><%=resultSet.getString("phonecode")%></td>
<td><%=resultSet.getString("phone")%></td>


</tr>

<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>