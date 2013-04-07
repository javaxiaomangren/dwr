<%@ page language="java" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<link rel="stylesheet" type="text/css" href="style/generic.css">
  </head>
  
  <body>
  		<h1>Demo01</h1>
		<a href="hello/hello.jsp">hello world(dynamic text)</a>
		<span>A very simple documented example that updates a page with some text. </span>
  		<h1>Demo02</h1>
		<a href="collection/collections.jsp">Test Collections</a>
		<span>Test Collections : Array[], Array[][], List , Map  </span>
  		<h1>Demo03</h1>
		<a href="select/select.jsp">级联下拉菜单</a>
  </body>
</html>
