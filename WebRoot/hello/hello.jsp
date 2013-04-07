<%@ page language="java" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>DWR_HELLO</title>
		<link rel="stylesheet" type="text/css" href="style/generic.css">
		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="dwr/interface/Hello.js"></script>
		<script type="text/javascript">
		function update1(){
			var name=dwr.util.getValue("helloName1");
			Hello.sayHello(name,function(data){
				dwr.util.setValue("helloReply",data);
			}) ; 
		}
		function update2(){
			var name=dwr.util.getValue("helloName2");
			Hello.sayHello(name,dealWithValue) ; 
		}
		function dealWithValue(value){
			dwr.util.setValue("helloReply",value);
		}
	</script>
	</head>

	<body>
		<h2>≤‚ ‘Dwr£¨hello“ª</h2>
		<div>
			Input your name :<input type="text" id="helloName1" />
			<input type="submit" value="send" onclick="update1()">
		</div>
		<hr />
		<h2>≤‚ ‘Dwr£¨hello∂˛</h2>
		<div>
			Input your name :<input type="text" id="helloName2"/>
			<input type="submit" value="send" onclick="update2()">
		</div>
		<br /><br />Replay:<span id="helloReply"></span>
		<hr />
<h3>Dependence jar</h3>	
<pre>dwr.jar</pre>
<h3>Java Code</h3>	
<pre>
package cn.windy.dwr;
public class Hello {
	public String sayHello(String name){
		return name+"say hello" ;
	}
}
</pre>	
<h3>dwr.xml Code</h3>	
<pre>
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE dwr PUBLIC
    "-//GetAhead Limited//DTD Direct Web Remoting 2.0//EN"
    "http://getahead.org/dwr/dwr20.dtd"&gt;
&lt;dwr&gt;
  &lt;allow&gt;
    &lt;create creator="new" javascript="Hello"&gt;
      &lt;param name="class" value="cn.windy.dwr.Hello"/&gt;
    &lt;/create&gt;
  &lt;/allow&gt;
&lt;/dwr&gt;
</pre>	
<h3>js code</h3>		
<pre>
function update1(){
  var name=dwr.util.getValue("helloName");
  Hello.sayHello(name,function(data){
  dwr.util.setValue("helloReply",data);
 }) ; 
}
-----------------------------------------------------
function update2(){
	var name=dwr.util.getValue("helloName2");
	Hello.sayHello(name,dealWithValue) ; 
}
function dealWithValue(value){
	dwr.util.setValue("helloReply",value);
}
</pre>
	</body>
</html>
