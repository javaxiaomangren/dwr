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
	<title>���������˵�</title>
	<link rel="stylesheet" type="text/css" href="style/generic.css">
	<script type="text/javascript" src="dwr/engine.js"></script>
	<script type="text/javascript" src="dwr/util.js"></script>
	<script type="text/javascript" src="dwr/interface/selectMenu.js"></script>
	<script type="text/javascript">
	/*��ʼ��һ��ѡ���*/
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
	<h2>��������������</h2>
	<div>
		��ѡ�������<select id="org" onchange="getPersons()"></select> <br>
		��ѡ����Ա��<select id="person"></select>
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
	/*��ʼ��ѡ���*/
	static{
		for(int i=1; i&lt;=10; i++){
			Org org = new Org() ;
			org.setId(i) ;
			org.setName("����"+i) ;
			orgs.put(org.getId(),org) ;
			/*���������˵�*/
			List&lt;Person&gt; personList = new ArrayList&lt;Person&gt;() ;
			for(int j=1;j&lt;=20;j++){
				Person person = new Person() ;
				person.setId(j) ;
				person.setName("����[" +org.getId()+"]�µ� ��Ա " + j) ;
				personList.add(person) ;
			}
			/*������ϵ*/
			persons.put(org.getId(), personList) ;
		}
	}
	/*��ȡ���л�����һ���˵�*/
	public Collection&lt;Org&gt; getAllOrg(){
		return orgs.values() ;
	}
	/*��ȡĳ�����µ�Person����*/
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
       &lt;!-- ���������˵�--&gt;
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

	/*��ʼ��һ��ѡ���*/
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
