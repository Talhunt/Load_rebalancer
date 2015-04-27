<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
 <%@ page import="java.nio.charset.Charset.*"%>
<%@ page import="java.util.*,java.lang.String.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.java.classes.databaseconnection.*,java.text.SimpleDateFormat.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  %>
<%@page import=" java.security.MessageDigest.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

</head>
<body>
<%
String p="Entered string present in the list";
String q="Entered string is not present in the list";
String words=(String)session.getAttribute("t");
String searchstring=request.getParameter("searchstring");

				
			
	 if(words.equals(searchstring))
{
response.sendRedirect("filedetails2.jsp?message=success");
}
else
{
response.sendRedirect("filedetails2.jsp?message=failure");
}
	 %>
	 
	

</body>
</html>