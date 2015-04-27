<%@ page import="java.util.Date.*,java.text.DateFormat.*,java.text.ParseException.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.java.classes.databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>	 

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

String id=(String)session.getAttribute("id");
String fname=(String)session.getAttribute("fname");
String date=(String)session.getAttribute("date");
String fkey=(String)session.getAttribute("fkey");


String f=request.getParameter("file");


String a=request.getRealPath("/")+"\\file\\";
String fname1=a+f;


		  
		  FileInputStream fis=null;
		  FileOutputStream fout=null,fout1=null,fout2=null;
          File file = new File(fname1);
		 
		 
		  double bytes=file.length();
		  double kb=bytes/1024;
		  String kbs=Double.toString(kb);
		  session.setAttribute("kbs",kbs);
		  
		  byte[] bFile = new byte[(int) file.length()];
 
            //convert file into array of bytes
	     fis = new FileInputStream(file);
		  fout = new FileOutputStream(request.getRealPath("/")+"\\temp\\file1.txt");
		 fout1 = new FileOutputStream(request.getRealPath("/")+"\\temp\\file2.txt");
		 fout2 = new FileOutputStream(request.getRealPath("/")+"\\temp\\file3.txt");
		
		int z=fis.available();
		int z1=z/3;
		int z2=z1+z1;
		
	    fis.read(bFile);
	    fis.close();
     
	     for (int i = 0; i <z1; i++) 
	        {
				  fout.write(bFile[i]);
				 

        
			}
			try{
Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://mysql10658-env-6212918.ec.fasthit.net.au/data1","root","4ZuYIsz8Mb");

String l = request.getRealPath("/")+"\\temp\\file1.txt";
String sql=null;
File image=new File(l);

PreparedStatement psmt1=con.prepareStatement("insert into d1(id,fname,date,b1,fkey) values(?,?,?,?,?)");

psmt1.setString(1,id);
psmt1.setString(2,fname);
psmt1.setString(3,date);
fis=new FileInputStream(image);
psmt1.setBinaryStream(4, (InputStream)fis, (int)(image.length()));
psmt1.setString(5,fkey);
psmt1.executeUpdate();

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

			
			for (int i = z1; i <z2; i++) 
	        {
	            fout1.write(bFile[i]);
	         
            }
		  			
	
	
	try{
Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://mysql10658-env-6212918.ec.fasthit.net.au/data2","root","4ZuYIsz8Mb");

String l = request.getRealPath("/")+"\\temp\\file2.txt";
String sql=null;
File image=new File(l);

PreparedStatement psmt1=con.prepareStatement("insert into d2(id,fname,date,b2,fkey) values(?,?,?,?,?)");

psmt1.setString(1,id);
psmt1.setString(2,fname);
psmt1.setString(3,date);
fis=new FileInputStream(image);
psmt1.setBinaryStream(4, (InputStream)fis, (int)(image.length()));
psmt1.setString(5,fkey);
psmt1.executeUpdate();

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

	
      
			 for (int i = z2; i <z; i++) 
			{
	        fout2.write(bFile[i]);
            }

try{
Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://mysql10658-env-6212918.ec.fasthit.net.au/data3","root","4ZuYIsz8Mb");

String l = request.getRealPath("/")+"\\temp\\file3.txt";
String sql=null;
File image=new File(l);

PreparedStatement psmt1=con.prepareStatement("insert into d3(id,fname,date,b3,fkey) values(?,?,?,?,?)");

psmt1.setString(1,id);
psmt1.setString(2,fname);
psmt1.setString(3,date);
fis=new FileInputStream(image);
psmt1.setBinaryStream(4, (InputStream)fis, (int)(image.length()));
psmt1.setString(5,fkey);
psmt1.executeUpdate();

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}





		
	response.sendRedirect("fileupload.jsp?message=success");
%>
</body>
</html>
