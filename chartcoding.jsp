 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
 
 
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.axis.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import="org.jfree.chart.labels.*" %>
<%@ page  import="org.jfree.chart.plot.*" %>
<%@ page  import="org.jfree.chart.renderer.category.*" %>
<%@ page  import="org.jfree.chart.urls.*" %>
<%@ page  import="org.jfree.data.category.*" %>
<%@ page  import="org.jfree.data.general.*" %>

<%
String fsize=(String)session.getAttribute("fsize");
String fsize1=(String)session.getAttribute("fsize1");
String fsize2=(String)session.getAttribute("fsize2");
String fsize3=(String)session.getAttribute("fsize3");
double val = Double.parseDouble(fsize);
double val1 = Double.parseDouble(fsize1);
double val2 = Double.parseDouble(fsize2);
double val3 = Double.parseDouble(fsize3);
  final double[][] data = new double[][]{
 {val},
 {val1, val2, val3}
 };

 final CategoryDataset dataset = 
   DatasetUtilities.createCategoryDataset("", "Splitted", data);

 JFreeChart chart = null;
 BarRenderer renderer3D = null;
 CategoryPlot plot = null;


 final CategoryAxis3D categoryAxis = new CategoryAxis3D("Files");
 final ValueAxis valueAxis = new NumberAxis3D("Size");
 renderer3D = new BarRenderer3D();

 plot = new CategoryPlot(dataset, categoryAxis, valueAxis, renderer3D);
 plot.setOrientation(PlotOrientation.VERTICAL);
 chart = new JFreeChart("File_Comparison", JFreeChart.DEFAULT_TITLE_FONT, 
  plot, true);

 chart.setBackgroundPaint(new Color(249, 231, 236));

  try {
 final ChartRenderingInfo info = new ChartRenderingInfo
 (new StandardEntityCollection());

 final File file1 = new File("C:/Users/mannava/Desktop/praveen pdf/WebApplication3/web/images/3dbarchart.png");
 ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
 response.sendRedirect("chartview.jsp");
  } catch (Exception e) {
 out.println(e);
 }
%>


</html> 