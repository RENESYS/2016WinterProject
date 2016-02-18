import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;



public class LocationParse {

	public static void main(String[] args) throws IOException {		
		try {
			BufferedReader bus = new BufferedReader(new FileReader("buslineID.txt"));
			JSONParser parser;
			JSONObject jo;
			JSONArray jarr;
			String ID;
			
			DBManager man = new DBManager();
			man.chooseDB("use sample");
			
			//read bus route ID & send request message to TOPIS
			while( (ID = bus.readLine()) != null){
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
			    	int size = jarr.size();
			    	System.out.println(size);
			    	
			    	JSONObject resObj;
		    		String stopID, gpsX, gpsY, stopName, route;

		    		//extract location data from each objects of every list & insert into DB
			    	for(int i = 0; i < size; i++){
			    		resObj = (JSONObject)jarr.get(i);
			    		stopID = (String)resObj.get("stationNo");
			    		gpsX = (String)resObj.get("gpsX");
			    		gpsY = (String)resObj.get("gpsY");
			    		route = (String)resObj.get("busRouteNm");
			    		stopName = (String)resObj.get("stationNm");
			    		System.out.println(route + " : " + stopName);
			    		man.insertLocation(gpsX, gpsY, stopID);
			    	}    	
			    }
			    wr.close();
			    rd.close();
			}
			bus.close();
		} catch (Exception ignored) {	}
	}
	
}
