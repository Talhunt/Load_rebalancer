<%@ page import="java.sql.*, javax.sql.*,java.java.classes.databaseconnection.*, java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<%@ page import="java.sql.*,java.io.*"  %>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>


<html>
<head>
<title></title>
<script language="JavaScript">

</script>
</head>
<body>
<%
	
	
	Blob file= null;
	
	String id1=request.getQueryString();
	String id=null;
	
	PreparedStatement ps = null;
	ResultSet rs = null;
		String sql=null;
		Connection con=null;
	 sql = "select AES_DECRYPT(file,'key') from file where id='"+id1+"'  ";
	
	try
	{
		con = databasecon.getconnection();
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		rs.next();
		file = rs.getBlob("AES_DECRYPT(file,'key')");
		session.setAttribute("resumeBlob",file);
		 response.sendRedirect("download1.jsp");
	}
	catch(Exception e)
	{
	
	out.println("Exception :"+e);
	}
	finally
	{
		if(con != null)
			con.close();
		if(ps != null)
			ps.close();
		if(rs != null)
			rs.close();
	}
	

//}
//else
//{//response.sendRedirect("cost_recharge2.jsp");
//}

	%>


</body>
</html>