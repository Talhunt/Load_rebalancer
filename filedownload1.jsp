<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DateFormat.*"%>
<%@ page import="java.text.SimpleDateFormat.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.java.classes.databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Limitless   
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20120203

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Load Rebalancing in Clouds</title>
<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
		content_main2.C1{background-color:#CCCCCC;}
		form.f1{background-color:#CCCCCC;}
		form1.f5{background-color:#CCCCCC;}
		input.sub{background-color:#009900;}
		input.sub1{background-color:#990000;}
		input.sub2{background-color:#009900;}
		input.sub3{background-color:#CC3366;}
		input.sub4{background-color:#FF6666;}
		input.sub5{background-color:#99FFFF;}
		input.sub6{background-color:#FFFFFF;}
		input.sub7{background-color:#000000;}
		content_maina1.a{background-color:#CCCCCC;}
		td.d{color:#FF9900;}
		tr.r{color:#FF9900;}
		tr.r1{color:#000000;}
		</style>
		
</head>
<body>
	<div id="menu-wrapper">
		<div id="menu">
			<ul>
			<li ><a href="#"></a></li>
			<li ><a href="#"></a></li>
			<li ><a href="#"></a></li>
			<li ><a href="index1.jsp">Home</a></li>
				<li class="current_page_item"><a href="">FileDownload</a></li>
				<li ><a href="javascript:history.go(-1)">GoBack</a></li>
				<li ><a href="chartcoding.jsp">Chart</a></li>
				<li ><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>
		<!-- end #menu -->
	</div>

<div id="wrapper">
	<div id="header-wrapper">
		
			<div id="logo">
			<%@ include file="header.jsp"%>
				
				</div>
			</div>
		
	</div>
	<!-- end #header -->
	
	<%
	String name=(String)session.getAttribute("name");
	String id=request.getQueryString();
String fname=null;
String date=null;
String fsize=null;
String fkey=null;
String fsize1=null;
String fsize2=null;
String fsize3=null;

	%>
	
		
			<table width="1000"  bgcolor="#212121">
			<th><font color="#669999">Welcome:</font><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong><%=name%></strong></font></th>
			
			
			
			
			
			
			<tr>
			
			
			
			
			<td>
			
			<form name="form" method="post" action="filedownload1.jsp">
			   <%
			   //java.util.Date now = new java.util.Date();
	 //String DATE_FORMAT1 = "HH:mm:ss";
	 //SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     //String strDateNew1 = sdf1.format(now);
	 //System.out.println(strDateNew1);
	   
try
{
String t=null;
Connection con=databasecon.getconnection();
PreparedStatement ps=con.prepareStatement("select id,fname,date,AES_DECRYPT(file,'key'),fsize,fkey from file where id='"+id+"' ");
ResultSet rs = ps.executeQuery();
while(rs.next())
{
Blob file = rs.getBlob("AES_DECRYPT(file,'key')");
byte [] b= file.getBytes(1,(int)file.length());
t=new String(b);
session.setAttribute("t",t);
String str[] = t.split(" ");
                for (int i = 0; i < str.length; i++) {
                        System.out.println(str[i]);
                }
                System.out.println(str.length);
fname=rs.getString("fname");
fsize=rs.getString("fsize");
session.setAttribute("fsize",fsize);
id=rs.getString("id");
%>

			
			<table height="300">
			 
			
			<tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>FileId:</strong></font></td>
                  <td><font color="#669999"><strong><%=id%></strong></font></td>
                </tr>
                <tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>Fname:</strong></font></td>
                  <td><font color="#669999"><strong><%=fname%></strong></font></td>
                </tr>
				<tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>Fsize:</strong></font></td>
                  <td><font color="#669999"><strong><%=fsize%></strong></font></td>
                </tr>
                  <tr> 
            <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>File:</strong></font></td>
            <td><textarea  name="b" cols="75"  rows="5" ><%=t%></textarea></td>
			<td><a href="download.jsp?<%=id%>"><font color="#669999" ><strong>download</strong></font></a></td>
            </tr>
				 <%		  
}
%>
				
                
			
			
			</table>
			<%

}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
				
			</form>

				
			</td>
						
			</tr>
			
			<tr>
			
			<td>
			
			<form name="form4"  action="searchstring.jsp" method="post">
			<table  height="100">
				
				<tr>
		<td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>Enter_string:</strong></font></td>
                  <td><input type="text" name="searchstring"></td>
				 
		</tr>
		<tr> <td><input type="submit" value="Search" class="sub6"></td> <td><input type="reset" value="Clear" class="sub5"></td></tr>
		
		</table>
		</form>
			
			
			
			</td>
			
			
			
			</tr>
			
			
			<tr>
			
			<td>
			
			<form name="form1" method="post" action="filedownload1.jsp">
			   <%

try
{
String t1=null;
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data1","root","");
PreparedStatement ps=con.prepareStatement("select b1,fsize1 from d1 where id='"+id+"' ");
ResultSet rs = ps.executeQuery();
while(rs.next())
{
Blob file = rs.getBlob("b1");
byte [] b= file.getBytes(1,(int)file.length());
t1=new String(b);
session.setAttribute("t1",t1);
//fname=rs.getString("fname");
fsize1=rs.getString("fsize1");
session.setAttribute("fsize1",fsize1);
//id=rs.getString("id");
%>

			
			<table height="300">
			 
			
			
				
                  <tr> 
            <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>1:</strong></font></td>
            <td><textarea  name="b" cols="75"  rows="5" ><%=t1%></textarea></td>
			
            </tr>
				 <%		  
}
%>
				
                
			
			
			</table>
			<%

}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
				
			</form>
			
			
			
			
			</td>
			
			
			</tr>
			
		
		
		<tr>
			
			<td>
			
			<form name="form2" method="post" action="filedownload1.jsp">
			   <%

try
{
String t2=null;
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data2","root","");
PreparedStatement ps=con.prepareStatement("select b2,fsize2 from d2 where id='"+id+"' ");
ResultSet rs = ps.executeQuery();
while(rs.next())
{
Blob file = rs.getBlob("b2");
byte [] b= file.getBytes(1,(int)file.length());
t2=new String(b);
session.setAttribute("t2",t2);
//fname=rs.getString("fname");
fsize2=rs.getString("fsize2");
session.setAttribute("fsize2",fsize2);
//id=rs.getString("id");
%>

			
			<table height="300">
			 
			
			
				
                  <tr> 
            <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>2:</strong></font></td>
            <td><textarea  name="b" cols="75"  rows="5" ><%=t2%></textarea></td>
			
            </tr>
				 <%		  
}
%>
				
                
			
			
			</table>
			<%

}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
				
			</form>
			
			
			
			
			</td>
			
			
			</tr>
		
		
			
			
			<tr>
			
			<td>
			
			<form name="form3" method="post" action="filedownload1.jsp">
			   <%

try
{
String t3=null;
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data3","root","");
PreparedStatement ps=con.prepareStatement("select b3,fsize3 from d3 where id='"+id+"' ");
ResultSet rs = ps.executeQuery();
while(rs.next())
{
Blob file = rs.getBlob("b3");
byte [] b= file.getBytes(1,(int)file.length());
t3=new String(b);
session.setAttribute("t3",t3);
//fname=rs.getString("fname");
fsize3=rs.getString("fsize3");
session.setAttribute("fsize3",fsize3);
//id=rs.getString("id");
%>

			
			<table height="300">
			 
			
			
				
                  <tr> 
            <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>3:</strong></font></td>
            <td><textarea  name="b" cols="75"  rows="5" ><%=t3%></textarea></td>
			
            </tr>
				 <%		  
}
%>
				
                
			
			
			</table>
			<%

}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
				
			</form>
			
			
			
			
			</td>
			
			
			</tr>

			
			
			
			
			</table>
		

</div>
<div id="footer">
<%@ include file="footer.jsp"%>
	
</div>
<!-- end #footer -->
</body>
</html>
