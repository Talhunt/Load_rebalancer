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
		<script type="text/javascript">
function validation()
{

name=document.form.name.value;
if(name=="")
{
alert("enter name");
document.form.name.focus();
return false;
}



if(!isNaN(name))
{
alert("enter name:");
document.form.name.focus();
return false;
}

age=document.form.age.value;
if(age=="")
{
alert("enter age");
document.form.age.focus();
return false;
}


if(isNaN(age))
{
alert("enter proper age:");
document.form.age.focus();
return false;
}

gender=document.form.gender.value;
if(document.form.gender[0].checked==false&&document.form.gender[1].checked==false)
{
alert("select gender");
return false;
}


email=document.form.email.value;
if(email=="")
{
alert("enter email:");
document.form.email.focus();
return false;
}

var x=email.indexOf("@");
var y=email.indexOf(".");
if((x<1)||(y<x+2)||(y+2>=x.length))
{
alert("enter username@domain:");
document.form.email.focus();
return false;
}

password=document.form.password.value;
if(password=="")
{
alert("enter password:");
document.form.password.focus();
return false;
}

mobile=document.form.mobile.value;
if(mobile=="")
{
alert("enter mobile number");
document.form.mobile.focus();
return false;
}

if(isNaN(mobile))
{
alert("enter number:");
document.form.mobile.focus();
return false;
}


}


</script>
</head>
<body>
	<div id="menu-wrapper">
		<div id="menu">
			<ul>
			<li ><a href="#"></a></li>
			<li ><a href="#"></a></li>
			<li ><a href="#"></a></li>
			<li ><a href="#"></a></li>
			<li ><a href="#"></a></li>
			<li ><a href="index1.jsp">Home</a></li>
				<li class="current_page_item"><a href="">Registration</a></li>
				<li ><a href="javascript:history.go(-1)">GoBack</a></li>
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
	</div>
	<!-- end #header -->
	
		
			<table width="1000"  bgcolor="#212121">
			
			<tr>
			
			<td><img src="images/file.png" height="200" width="200" align="right"></td>
			
			
			<td>
			<form name="form" method="post" action="userinsert.jsp" onsubmit="return validation()">
			<%
			
			int n=0,s=0;
			Connection con=null;
			ResultSet rs=null;
			Statement st=null;
			String sql="select max(userid) from user";
			try
			{
			con=databasecon.getconnection();
			st=con.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next())
			{
			if(rs.getInt(1)==0)
			n=111213;
			else
			n=rs.getInt(1)+1;
			session.setAttribute("userid",n);
			}
			%>
			
			<table height="300">
			 <tr> 
                  <td colspan="2" align="center"><font size="2"><b> 
                    <%
                                                       String message=request.getParameter("message");
                                                       if(message!=null && message.equalsIgnoreCase("success"))
                                                       {
                                                               out.println("<font color='#00FF66'><blink>Registered Successfully !</blink></font>");
                                                       }
                                               %>
                    </b></font></td>
                </tr>
			
			<tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>Id:</strong></font></td>
                  <td><input type="text" name="userid" value="<%=n%>" ></td>
                </tr>
                <tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>Name:</strong></font></td>
                  <td><input type="text" name="name"></td>
                </tr>
                <tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>Age:</strong></font></td>
                  <td><input type="text" name="age"></td>
                </tr>
                <tr> 
                  <td><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>Gender:</strong></font></td>
                  <td><input type="radio"  name="gender" value="male"> <font color="#FFFFFF"><strong>Male</strong></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <input type="radio" name="gender" value="female"> <font color="#FFFFFF"><strong>Female</strong></font></td>
                </tr>
                <tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>Email:</strong></font></td>
                  <td><input type="text" name="email" ></td>
                </tr>
                <tr> 
                  <td ><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong>Password:</strong></font></td>
                  <td><input type="password" name="password"></td>
                </tr>
                <tr> 
                  <td><input type="submit" value="Register" class="sub6"></td>
                  <td><input type="reset" value="Clear" class="sub4"></td>
                </tr>
			
			
			</table>
			
			  <%
}
catch(Exception e)
	{
		System.out.println(e);
	}
	  finally
	{
		con.close();
		st.close();
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
