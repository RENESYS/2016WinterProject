<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="db.DBContact" import="java.sql.*"%>
<%
	DBContact db = new DBContact();
	Connection con = db.getConnection();
	//String str = db.func();
	db.chooseDB("use sample");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>HELLO</h1>
	<div id="map" style="width: 100%; height: 650px;"></div>

	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=2afaac55291764d588161ae97c7844e3"></script>
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new daum.maps.LatLng(37.56564, 126.977021), // ������ �߽���ǥ
			level : 7
		};
		var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
	</script>

	<%
		int cnt = 1;
		ResultSet res;
		String sql = "select StopName, sum(Ride8), sum(Alight8), gpsX, gpsY from bus where UseMon=201510 group by StopName order by sum(Alight8) desc";
		res = db.select(sql);

		while (cnt < 500) {
			res.next();
			String stop = res.getString(1);
			String ride = res.getString(2);
			String alight = res.getString(3);
			String x = res.getString(4);
			String y = res.getString(5);
			String imgsrc;
			
			if(cnt <= 100){
				imgsrc="http://localhost:8080/BusAnalyzer2/img/red.png";
			}else if(cnt > 100 && cnt <= 300){
				imgsrc="http://localhost:8080/BusAnalyzer2/img/yellow.png";
			}else
				imgsrc="http://localhost:8080/BusAnalyzer2/img/green.png";
			%>
			<script>
				var imageSrc = '<%=imgsrc%>', // ��Ŀ�̹����� �ּ��Դϴ�    
				imageSize = new daum.maps.Size(16, 16), // ��Ŀ�̹����� ũ���Դϴ�
				imageOption = {
					offset : new daum.maps.Point(8, 8)
				}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
		
				// ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
				var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
						imageOption), markerPosition = new daum.maps.LatLng(<%=y%>,<%=x%>); // ��Ŀ�� ǥ�õ� ��ġ�Դϴ�
		
				// ��Ŀ�� �����մϴ�
				var marker = new daum.maps.Marker({
					title : '<%=stop%>',
					position : markerPosition,
					image : markerImage
				});
		
				// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
				marker.setMap(map);
			</script>
			<%
			cnt++;
		}
	%>
</body>
</html>
