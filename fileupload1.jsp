<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
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
			<li ><a href="#"></a></li>
				<li ><a href="index1.jsp">Home</a></li>
				<li class="current_page_item"><a href="">FileUpload</a></li>
				<li ><a href="javascript:history.go(-1)">GoBack</a></li>
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
		
	
	<!-- end #header -->
	
	<%
	String name=(String)session.getAttribute("name");
	String fname=request.getParameter("fname");
session.setAttribute("fname",fname);
String id=request.getParameter("id");
session.setAttribute("id",id);
String date=request.getParameter("date");
session.setAttribute("date",date);
String fkey=request.getParameter("fkey");
session.setAttribute("fkey",fkey);

	%>
	
		
			<table width="1000"  bgcolor="#212121">
			<th><font color="#669999">Welcome:</font><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong><%=name%></strong></font></th>
			
			<tr>
			
			<td><img src="images/file1.png" height="200" width="200" align="right"></td>
			
			
			<td>
			<form name="form" method="post" action="fileupload2.jsp" enctype="multipart/form-data">
			
			
			<table height="300">
			
			
			<tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>Id:</strong></font></td>
                  <td><input type="text" name="id" value="<%=id%>" ></td>
                </tr>
                <tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>FName:</strong></font></td>
                  <td><input type="text" name="fname" value="<%=fname%>"></td>
                </tr>
                <tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>Date:</strong></font></td>
                  <td><input type="text" name="date" value="<%=date%>"></td>
                </tr>
                
                <tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>Fkey:</strong></font></td>
                  <td><input type="text" name="fkey" value="<%=fkey%>" ></td>
                </tr>
				
				 <tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>File:</strong></font></td>
                  <td><input type="file" name="file" class="sub6"></td>
                </tr>
                
                <tr> 
                  <td><input type="submit" value="Upload" class="sub6"></td>
                  <td><input type="reset" value="Clear" class="sub4"></td>
                </tr>
			
			
			</table>
			
			
			
			</form>
			
			
			
			</td>
			
			
			
			
			
			</tr>
			
			
			</table>
		
	
</div>
</div>
<div id="footer">
<%@ include file="footer.jsp"%>
	
</div>
<!-- end #footer -->
</body>
</html>
