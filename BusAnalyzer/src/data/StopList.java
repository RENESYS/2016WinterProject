package data;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class StopList {
	JSONArray li;
	int size;
	
	public StopList(){	
		li = new JSONArray();
		size = 0;
	}
	
	public void setArray(JSONArray arr){
		li = arr;
	}
	public void setSize(int s){
		size = s;
	}
	public int getSize(){
		return size;
	}
	public JSONObject getObject(int index){
		return (JSONObject)li.get(index);
	}
}
