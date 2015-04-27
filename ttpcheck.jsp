
<%@page import="com.oreilly.servlet.*,java.sql.*,java.java.classes.databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

String a="ttp";
String b="ttp";
String username = request.getParameter("username");


String password = request.getParameter("password");

if((a.equals(username)) && (b.equals(password)))
{
		response.sendRedirect("filedetails.jsp");	
	}
	else {
	out.println("Enter correct username, password");
	
	}
	
	
%>
</body>
</html>


