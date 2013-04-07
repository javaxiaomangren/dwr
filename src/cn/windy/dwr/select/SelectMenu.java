package cn.windy.dwr.select;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SelectMenu {
	private static Map<Integer,Org> orgs = new HashMap<Integer, Org>() ;
	private static Map<Integer,List<Person>> persons = new HashMap<Integer, List<Person>> ();
	/*��ʼ��ѡ���*/
	static{
		for(int i=1; i<=10; i++){
			Org org = new Org() ;
			org.setId(i) ;
			org.setName("����"+i) ;
			orgs.put(org.getId(),org) ;
			/*���������˵�*/
			List<Person> personList = new ArrayList<Person>() ;
			for(int j=1;j<=20;j++){
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
	public Collection<Org> getAllOrg(){
		return orgs.values() ;
	}
	/*��ȡĳ�����µ�Person����*/
	public  List<Person> getPerson(int orgId){
		return persons.get(orgId) ;
	}
}
