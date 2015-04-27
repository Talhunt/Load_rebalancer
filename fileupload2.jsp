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
	   String saveFile="";
//String contentType=request.getAttribute("file");
String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File(saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();

	    
%>



<%
String date=(String)session.getAttribute("date");
out.print(date);
String fkey=(String)session.getAttribute("fkey");
out.println(fkey);
String id=(String)session.getAttribute("id");
out.println(id);
String fname=(String)session.getAttribute("fname");
out.println(fname);
//int n;
//session.getAttribute("userid", n );




String fsize=null;
String fsize1=null;
String fsize2=null;
String fsize3=null;


FileInputStream fis;





PreparedStatement psmt1=null;
try
{


Connection con=databasecon.getconnection();
psmt1=con.prepareStatement("insert into file   values(?,?,?,AES_ENCRYPT(?, 'key'),?,?)");

File f = new File(saveFile);
psmt1.setString(1,id);
psmt1.setString(2,fname);
psmt1.setString(3,date);
fis = new FileInputStream(f);
psmt1.setBinaryStream(4, (InputStream)fis, (int)(f.length()));

double bytes = file.length();
		
		fsize=Double.toString(bytes);
		psmt1.setString(5,fsize);
		out.println(fsize);
		session.setAttribute("fsize",fsize);
psmt1.setString(6,fkey);


psmt1.executeUpdate();





}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

}



String f=request.getParameter("file");


String a=request.getRealPath("/")+"\\file\\";
String fname1=a+f;

String date2=(String)session.getAttribute("date");
out.print(date2);
String fkey2=(String)session.getAttribute("fkey");
out.println(fkey2);
String id2=(String)session.getAttribute("id");
out.println(id2);
String fname2=(String)session.getAttribute("fname");
out.println(fname2);

		  
		  FileInputStream fis=null;
		  FileOutputStream fout=null,fout1=null,fout2=null;
          File file = new File(saveFile);
		 
		 
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

PreparedStatement psmt1=con.prepareStatement("insert into d1(id,fname,date,b1,fsize1,fkey) values(?,?,?,?,?,?)");

psmt1.setString(1,id2);
psmt1.setString(2,fname2);
psmt1.setString(3,date2);
fis=new FileInputStream(image);
psmt1.setBinaryStream(4, (InputStream)fis, (int)(image.length()));
double bytes1 = image.length();
		
		String fsize1=Double.toString(bytes1);
		psmt1.setString(5,fsize1);
		System.out.println(fsize1);
		psmt1.setString(6,fkey2);
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

PreparedStatement psmt1=con.prepareStatement("insert into d2(id,fname,date,b2,fsize2,fkey) values(?,?,?,?,?,?)");

psmt1.setString(1,id2);
psmt1.setString(2,fname2);
psmt1.setString(3,date2);
fis=new FileInputStream(image);
psmt1.setBinaryStream(4, (InputStream)fis, (int)(image.length()));
double bytes2 = image.length();
		
		String fsize2=Double.toString(bytes2);
		psmt1.setString(5,fsize2);
		System.out.println(fsize2);
		psmt1.setString(6,fkey2);
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

PreparedStatement psmt1=con.prepareStatement("insert into d3(id,fname,date,b3,fsize3,fkey) values(?,?,?,?,?,?)");

psmt1.setString(1,id2);
psmt1.setString(2,fname2);
psmt1.setString(3,date2);
fis=new FileInputStream(image);
psmt1.setBinaryStream(4, (InputStream)fis, (int)(image.length()));
double bytes3 = image.length();
		
		String fsize3=Double.toString(bytes3);
		psmt1.setString(5,fsize3);
		System.out.println(fsize3);
		psmt1.setString(6,fkey2);
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