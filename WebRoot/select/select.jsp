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
	<title>联动下拉菜单</title>
	<link rel="stylesheet" type="text/css" href="style/generic.css">
	<script type="text/javascript" src="dwr/engine.js"></script>
	<script type="text/javascript" src="dwr/util.js"></script>
	<script type="text/javascript" src="dwr/interface/selectMenu.js"></script>
	<script type="text/javascript">
	/*初始化一级选择框*/
	function init(){
		selectMenu.getAllOrg(
		  function(data){
			dwr.util.addOptions("org",data,"id","name") ;
			getPersons();
		});
	}
	function getPersons(){
		selectMenu.getPerson($("org").value,
		  function(data){
			dwr.util.removeAllOptions("person");
			dwr.util.addOptions("person",data,"id","name");
		});
	}
 </script>
 </head>
<body onload="init()">
	<h2>测试联动下拉框</h2>
	<div>
		请选择机构：<select id="org" onchange="getPersons()"></select> <br>
		请选择人员：<select id="person"></select>
	</div>
		
<h3>Dependence jar</h3>	
<pre>dwr.jar</pre>
<h3>Java Code</h3>	
<pre>
package cn.windy.dwr.select;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SelectMenu {
	private static Map&lt;Integer,Org&gt; orgs = new HashMap&lt;Integer, Org&gt;() ;
	private static Map&lt;Integer,List&lt;Person&gt;&gt; persons = new HashMap&lt;Integer, List&lt;Person&gt;&gt; ();
	/*初始化选择框*/
	static{
		for(int i=1; i&lt;=10; i++){
			Org org = new Org() ;
			org.setId(i) ;
			org.setName("机构"+i) ;
			orgs.put(org.getId(),org) ;
			/*构建二级菜单*/
			List&lt;Person&gt; personList = new ArrayList&lt;Person&gt;() ;
			for(int j=1;j&lt;=20;j++){
				Person person = new Person() ;
				person.setId(j) ;
				person.setName("机构[" +org.getId()+"]下的 成员 " + j) ;
				personList.add(person) ;
			}
			/*建立关系*/
			persons.put(org.getId(), personList) ;
		}
	}
	/*获取所有机构：一级菜单*/
	public Collection&lt;Org&gt; getAllOrg(){
		return orgs.values() ;
	}
	/*获取某机构下得Person集合*/
	public  List&lt;Person&gt; getPerson(int orgId){
		return persons.get(orgId) ;
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
       &lt;!-- 级联下拉菜单--&gt;
    &lt;create creator="new" javascript="selectMenu"&gt;
      &lt;param name="class" value="cn.windy.dwr.select.SelectMenu"/&gt;
    &lt;/create&gt;
      &lt;convert converter="bean" match="cn.windy.dwr.select.Person"/&gt;
      &lt;convert converter="bean" match="cn.windy.dwr.select.Org"/&gt;
    
  &lt;/allow&gt;
&lt;/dwr&gt;

</pre>	
<h3>js code</h3>		
<pre> 

	/*初始化一级选择框*/
	function init(){
		selectMenu.getAllOrg(
		  function(data){
			dwr.util.addOptions("org",data,"id","name") ;
			getPersons();
		});
	}
	function getPersons(){
		selectMenu.getPerson($("org").value,
		  function(data){
			dwr.util.removeAllOptions("person");
			dwr.util.addOptions("person",data,"id","name");
		});
	}
</pre>
</body>
</html>
