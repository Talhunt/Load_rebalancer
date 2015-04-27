
<%@page import="com.oreilly.servlet.*,java.sql.*,java.java.classes.databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Statement st = null;
ResultSet rs = null;
String name=null;
String email = request.getParameter("email");


String password = request.getParameter("password");

try
			{
			Connection con=databasecon.getconnection();
			st=con.createStatement();
	String qry =" select  * from owner where email='"+email+"' and password='"+password+"' "; 
	rs = st.executeQuery(qry);
	if(!rs.next()){
	out.println("Enter correct email, password");
	
	}
	else{
	
	
	
	name=rs.getString("name");
	session.setAttribute("name",name);
	response.sendRedirect("fileupload.jsp");
	
	
	
	
			
	}
	con.close();
	st.close();
}
catch(Exception ex){
	out.println(ex);
}
%>
</body>
</html>


