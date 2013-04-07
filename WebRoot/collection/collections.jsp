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
		<script type="text/javascript" src="dwr/interface/mycol.js"></script>
		<script type="text/javascript">
		function testArray1(){
			var len=dwr.util.getValue("arrayLen");
			var result ="" ;
			mycol.getArray(len,function(data){
				alert("数组长度 = "+ data.length);
				for(var i=0; i<data.length ; i++){
					result += data[i] + ","; 
				}
				dwr.util.setValue("arrayResult",result);
			}) ; 
		}
		function testArray2(){
			var result ="" ;
			mycol.getArray2(3,3,function(data){
				alert("数组长度 = 3*3");
				for(var i=0; i<data.length ; i++){
					for(var j=0;j<data[i].length;j++){
						result += data[i][j] + "    "; 
					}
					result += '::::::'; 
				}
				dwr.util.setValue("arrayResult2",result);
			}) ; 
		}
		function testList(){
			var size=dwr.util.getValue("listSize");
			var result ="" ;
			mycol.getList(size,function(data){
				for(var l=0; l<data.length;l++){
					result += data[l] + "     ";
				}
				dwr.util.setValue("listResult",result);
			});
		}
		function testMap(){
			var size=dwr.util.getValue("mapSize");
			var result="";
			mycol.getMap(size,function(data){
				for(var p in data){
					alert("key="+p+",value="+data[p])  ;
				}
			});
			dwr.util.setValue("mapResult",result);
		
		}
	</script>
	</head>

	<body>
		<h2>测试一维数组</h2>
		<div>
			Input length of Array :<input type="text" id="arrayLen" />
			<input type="submit" value="Test" onclick="testArray1()">
		<br /><br />Array Result :<span id="arrayResult"></span>
		</div>
		<hr />
		
		<h2>测试二维数组</h2>
		<div>
			<input type="submit" value="Test" onclick="testArray2()">
		<br /><br />Array Result :<span id="arrayResult2"></span>
		</div>
		<hr />
		
		<h2>测试List</h2>
		<div>
			Input length of List :<input type="text" id="listSize" />
			<input type="submit" value="Test" onclick="testList()">
		<br /><br />Array Result :<span id="listResult"></span>
		</div>
		<hr />
		<h2>测试Map</h2>
		<div>
			Input length of Map  :<input type="text" id="mapSize" />
			<input type="submit" value="Test" onclick="testMap()">
		<br /><br />Array Result :<span id="mapResult"></span>
		</div>
		<hr />
		
	</body>
</html>
