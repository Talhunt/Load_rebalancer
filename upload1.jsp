<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DateFormat.*"%>
<%@ page import="java.text.SimpleDateFormat.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.java.classes.databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%


String id=(String)session.getAttribute("id");
String fname=(String)session.getAttribute("fname");
String bb=request.getParameter("b");

java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);
	 
	 
	 String person="cloud provider";
	 String date=strDateNew1;
	 String activity="made an attempt";
 




try
{
String t=null;
Connection con=databasecon.getconnection();
PreparedStatement ps=con.prepareStatement("select AES_DECRYPT(file,'key') from file where id='"+id+"' ");
ResultSet rs = ps.executeQuery();
while(rs.next())
{
Blob file = rs.getBlob("AES_DECRYPT(file,'key')");
byte [] b= file.getBytes(1,(int)file.length());
t=new String(b);
session.setAttribute("t",t);
}




if(t.equals(bb))

{

		
		
		response.sendRedirect("login.jsp?message=success");
		
		}
		
		
		
		else
		
		{
		
		try
{



con=databasecon.getconnection();
PreparedStatement psmt1=con.prepareStatement("insert into alert   values(?,?,?,?,?) ");



psmt1.setString(1,id);

psmt1.setString(2,fname);

psmt1.setString(3,person);

psmt1.setString(4,activity);

psmt1.setString(5,date);

psmt1.executeUpdate();


out.println("you cant modify the original data");



}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

		
		}
		







		
		
		
		
		}
			
	catch(Exception e)
		{
		out.println(e.getMessage());
		}
		
	




		
	
	



%>
</body>
</html>
