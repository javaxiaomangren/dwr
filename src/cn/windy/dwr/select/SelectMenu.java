package cn.windy.dwr.select;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SelectMenu {
	private static Map<Integer,Org> orgs = new HashMap<Integer, Org>() ;
	private static Map<Integer,List<Person>> persons = new HashMap<Integer, List<Person>> ();
	/*初始化选择框*/
	static{
		for(int i=1; i<=10; i++){
			Org org = new Org() ;
			org.setId(i) ;
			org.setName("机构"+i) ;
			orgs.put(org.getId(),org) ;
			/*构建二级菜单*/
			List<Person> personList = new ArrayList<Person>() ;
			for(int j=1;j<=20;j++){
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
	public Collection<Org> getAllOrg(){
		return orgs.values() ;
	}
	/*获取某机构下得Person集合*/
	public  List<Person> getPerson(int orgId){
		return persons.get(orgId) ;
	}
}
