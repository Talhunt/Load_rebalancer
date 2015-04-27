<%@ page import="java.util.Date.*,java.util.*,java.text.ParseException.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.java.classes.databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>	 
<%@ page import="java.sql.*"%>
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

String userid=request.getParameter("userid");
String name=request.getParameter("name");
String age=request.getParameter("age");
String gender=request.getParameter("gender");
String email=request.getParameter("email");
String password=request.getParameter("password");
 
 
 
 






PreparedStatement psmt1=null;
try
{



Connection con=databasecon.getconnection();
psmt1=con.prepareStatement("insert into user   values(?,?,?,?,?,?)");


psmt1.setString(1,userid);
psmt1.setString(2,name);
psmt1.setString(3,age);
psmt1.setString(4,gender);
psmt1.setString(5,email);
psmt1.setString(6,password);




psmt1.executeUpdate();


response.sendRedirect("user.jsp?message=success");


}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}



%>



</body>
</html>