package manage;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import data.StopList;

public class SiteConnect {
	JSONParser parser;
	JSONObject jo;
	JSONArray jarr;
	int size;
	
	public SiteConnect(){  }
	
	//get bus route ID from TOPIS
	public String getBusID(String routeNo){
		String ID = null;
		try{
			String data = URLEncoder.encode("strSrch", "UTF-8") + "=" + URLEncoder.encode(routeNo, "UTF-8");
		    URL url = new URL("http://m.bus.go.kr/mBus/bus/getBusRouteList.bms");
		    
		    URLConnection conn = url.openConnection();
		    conn.setDoOutput(true);
		    OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		    wr.write(data);
		    wr.flush();
		    
		    BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		    String line = rd.readLine();
	    	//parse resultList from response JSON file
	    	parser = new JSONParser();
	    	jo = (JSONObject)(parser.parse(line));
	    	jarr = (JSONArray)jo.get("resultList");
	    	JSONObject resObj = (JSONObject)jarr.get(0);
	    	ID = (String)resObj.get("busRouteId");

		}catch(Exception e){	}
		return ID;
	}
	
	//get bus route list from TOPIS
	public void setStopList(String ID, StopList li){
		try{
			String data = URLEncoder.encode("busRouteId", "UTF-8") + "=" + URLEncoder.encode(ID, "UTF-8");
		    URL url = new URL("http://m.bus.go.kr/mBus/bus/getRouteAndPos.bms");
		    URLConnection conn = url.openConnection();

		    conn.setDoOutput(true);
		    OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		    wr.write(data);
		    wr.flush();
		    
		    BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		    String line;
		    while ((line = rd.readLine()) != null) {
		    	//parse resultList from response JSON file
		    	parser = new JSONParser();
		    	jo = (JSONObject)(parser.parse(line));
		    	jarr = (JSONArray)jo.get("resultList");
		    	li.setArray(jarr);
		    	li.setSize(jarr.size());
		    	
		    	//System.out.println(li.getSize());
		    }
		}catch(Exception e){	}
	}
}
