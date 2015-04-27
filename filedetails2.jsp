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
			<li ><a href="#"></a></li>
			<li ><a href="#"></a></li>
				<li class="current_page_item"><a href="">FILEDETAILS</a></li>
			
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
	%>
	
	
		<form name="form" action="" method="post" onsubmit="return validation()">
			<table width="1000"  bgcolor="#212121">
			<th><font color="#669999">Welcome:</font><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif"><strong><%=name%></strong></font></th>
			<tr> 
                  <td colspan="2" align="center"><font size="2"><b> 
                    <%
                                                       String message=request.getParameter("message");
                                                       if(message!=null && message.equalsIgnoreCase("success"))
                                                       {
                                                               out.println("<font color='#00FF66'><blink>String Found!</blink></font>");
                                                       }
													   
													    else if(message!=null && message.equalsIgnoreCase("failure"))
                                                       {
                                                               out.println("<font color='#00FF66'><blink>String NotFound!</blink></font>");
                                                       }
													   
                                               %>
                    </b></font></td>
                </tr>
			<tr > 
            <TH><div align="center"><font color="#669999"  size="+1"  face="Times New Roman, Times, serif">ID</font> 
              </div></TH><TH><div align="center"><font color="#669999"  size="+1" face="Times New Roman, Times, serif">FILENAME</font> 
              </div></TH>
            <TH><div align="center"><font color="#669999"  size="+1" face="Times New Roman, Times, serif">DATE</font> 
              </div></TH>
            <TH><div align="center"><font color="#669999"  size="+1" face="Times New Roman, Times, serif">FILESIZE</font> 
              </div></TH>
            <TH><div align="center"><font color="#669999"  size="+1" face="Times New Roman, Times, serif">FKEY</font> 
              </div></TH>
            <TH><div align="center"><font color="#669999"  size="+1" face="Times New Roman, Times, serif">DOWNLOAD</font> 
              </div></TH>
          </tr>
		   <%
ResultSet rs=null;
PreparedStatement ps=null;

//String id1=(String)session.getAttribute("id");

String id=null;
String fkey=null;
String fsize=null;
String date=null;
String fname=null;


try
{
Connection con=databasecon.getconnection();
ps=con.prepareStatement(" select * from file ");
rs=ps.executeQuery();
while (rs.next())
{
id=rs.getString("id"); 
session.setAttribute("id",id);
date=rs.getString("date");
fsize=rs.getString("fsize");
fkey=rs.getString("fkey");
fname=rs.getString("fname");
%>
<tr> 
            <td><div align="center"><font color="#FFFFFF"   size="+1" face="Times New Roman, Times, serif" > 
                <%=id%> </font></div></td>
            <td><div align="center"><font color="#FFFFFF"   size="+1" face="Times New Roman, Times, serif" > 
                <%=fname%> </font></div></td>

            <td><div align="center"><font color="#FFFFFF"   size="+1" face="Times New Roman, Times, serif" > 
                <%=date%> </font></div></td>
            <td><div align="center"><font  color="#FFFFFF"  size="+1" face="Times New Roman, Times, serif" > 
                <%=fsize%>bytes </font></div></td>
            <td><div align="center"><font  color="#FFFFFF"  size="+1" face="Times New Roman, Times, serif" > 
                <%=fkey%> </font></div></td>
            <td><div align="center"> 
                <a href="filedownload1.jsp?<%=id%>"><font  color="#FFFFFF"  size="+1" face="Times New Roman, Times, serif" >DOWNLOAD </font></a></div></td>
          </tr>
		   <%

}


	con.close();
		ps.close();



}




catch(Exception ex)
{

out.println("Error in connection : "+ex);

}
%>

			</table>
			</form>
		
	
</div>
<div id="footer">
<%@ include file="footer.jsp"%>
	
</div>

<!-- end #footer -->
</body>
</html>
