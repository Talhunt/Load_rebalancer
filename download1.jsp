<%@ page import="java.sql.*, javax.sql.*,  java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<html>
<head>
<title>Chennai Sunday</title>
<script language="JavaScript">

</script>
</head>

<body>		
<%

		Blob b = (Blob)session.getAttribute("resumeBlob");
		if(b != null)
		{
			String fileName = "file.txt";
			byte[] ba = b.getBytes(1, (int)b.length());
			response.setContentType("text");
			response.setHeader("Content-Disposition","attachment; fileName=\""+fileName+"\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
			//session.removeAttribute("document1");
		}
		else
		{
			//response.sendRedirect("cost_recharge2.jsp");
			System.out.println("null");
		}
%>

</body>
</html>