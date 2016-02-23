package manage;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONObject;

import data.StopList;
import db.DBContact;

public class RouteResManager {
	ResultSet rs;
	DBContact db;
	SiteConnect site;
	StopList stopList;
	int index;
	int passenger;
	
	public RouteResManager(){ 
		rs = null; 
		db = new DBContact();
		db.chooseDB("use sample");
		site = new SiteConnect();
		stopList = new StopList();
		index = 0;
		passenger = 0;
	}

	public void setStopList(String routeNo){
		String ID = site.getBusID(routeNo);
		site.setStopList(ID, stopList);		
	}
	
	public boolean isStopLeft(){
		return index < stopList.getSize();
	}
	
	public void getNext() throws SQLException{
		rs.next();
	}
	public String getStop() throws SQLException{
		return rs.getString(1);
	}
	public String getRide() throws SQLException{
		return rs.getString(2);
	}
	public String getAlight() throws SQLException{
		return rs.getString(3);
	}
	public String getGpsx() throws SQLException{
		return rs.getString(4);
	}
	public String getGpsy() throws SQLException{
		return rs.getString(5);
	}
	
	//search the value from DB
	public void setResultSet(String routeNo, String mon, String hour) throws SQLException{
		JSONObject obj = stopList.getObject(index);
		String stopID = (String)obj.get("stationNo");
		if(stopID.length() == 5 && stopID.charAt(0) == '0'){
			stopID = stopID.substring(1, 5);
		}
		System.out.println(stopID);
		rs = db.selectRouteInfo(hour, mon, routeNo, stopID);
		//check SQL fail and select next stop
		if(!rs.next()){
			index++;
			this.setResultSet(routeNo, mon, hour);
		}
		else
			index++;
	}
	
	//calculate bus congestion
	public int calcCongestion() throws SQLException{
		passenger += Integer.parseInt(rs.getString(2)) - Integer.parseInt(rs.getString(3));
		if (passenger < 0)
			passenger = 0;
		System.out.println(rs.getString(1) + " : " + passenger);
		return passenger;
	}
	
	//set the line color to show congestion
	public String setColor(){
		String color = null;
		if(passenger < 2000) 	color = "#0033ff";
		else if (passenger >= 2000 && passenger < 4000) 	color = "#006600";
		else if (passenger >= 4000 && passenger < 6000) 	color = "#ffcc00";
		else if (passenger >= 6000 && passenger < 7000) 	color = "#ff6600";
		else	color = "#ff0000";
		return color;
	}
	
	//check input value for prevent SQL injection
	public String checkInput(String str){
		if(str.contains(";") || str.contains("'")){
			str = "-1";
		}
		return str;
	}
	
	
	
}
