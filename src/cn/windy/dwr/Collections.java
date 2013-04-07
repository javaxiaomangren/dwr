package cn.windy.dwr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * dwr ºØ∫œ≤‚ ‘
 * @author windy
 *
 */
public class Collections {
	public String  testHello(){
		return "aaa"; 
	}
	public String[] getArray(int size){
		String[] array = new String[size];
		for(int i=0 ; i<size ;i++){
			array[i] = "array" + i; 
		}
		return array ;
	}
	public String[][] getArray2(int x,int y){
		String[][] array = new String[x][y];
		for(int i=0 ; i<x ;i++){
			for(int j=0; j<y ; j++){
				array[i][j]="Array"+i+j ;
			}
		}
		return array ;
	}
	public List<String> getList(int size){
		List<String> list= new ArrayList<String>();
		for(int i=0;  i<size ; i++){
			list.add("List element " + i) ;
		}
		return list;
	}
	public Map<Integer, String> getMap(int size){
		Map<Integer,String> map = new HashMap<Integer, String>() ;
		for(int i=0; i<size ; i++){
			map.put(i, "map value" + i) ;
		}
		return map ;
	}
}
