<%@ page import="java.util.Date.*,java.text.DateFormat.*,java.text.ParseException.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.java.classes.databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>	 
<%@ page import="java.sql.*,java.java.classes.databaseconnection.*"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript">

</script>
</head>

<body>



 
<%

String ownerid=request.getParameter("ownerid");
String name=request.getParameter("name");
String age=request.getParameter("age");
String gender=request.getParameter("gender");
String email=request.getParameter("email");
String password=request.getParameter("password");
 
 
 
 






PreparedStatement psmt1=null;
try
{



Connection con=databasecon.getconnection();
psmt1=con.prepareStatement("insert into owner   values(?,?,?,?,?,?)");


psmt1.setString(1,ownerid);
psmt1.setString(2,name);
psmt1.setString(3,age);
psmt1.setString(4,gender);
psmt1.setString(5,email);
psmt1.setString(6,password);




psmt1.executeUpdate();


response.sendRedirect("owner.jsp?message=success");


}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}



%>



</body>
</html>