<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="db.DBContact" import="manage.StopResManager" import="java.sql.*"%>
<%
	StopResManager rsm = new StopResManager();
	String hour = request.getParameter("hour");
	String mon = request.getParameter("mon");
	String type = request.getParameter("type");
	rsm.setResultSet(hour, mon, type);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3><%=mon%>�� <%=hour%>�� <%=type%> �������Դϴ�.</h3>

	<div id="map" style="width: 100%; height: 650px;"></div>

	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=2afaac55291764d588161ae97c7844e3"></script>
	<script>
	//create Map
		var mapContainer = document.getElementById('map'), 
		mapOption = {
			center : new daum.maps.LatLng(37.56564, 126.977021),
			level : 7
		};
		var map = new daum.maps.Map(mapContainer, mapOption);
	</script>

	<%
		while (rsm.isLimit()) {
			rsm.getNext();
			String stop = rsm.getStop();
			String ride = rsm.getRide();
			String alight = rsm.getAlight();
			String x = rsm.getGpsx();
			String y = rsm.getGpsy();
			String imgsrc  = rsm.getImageURL();
			%>
			<script>
			//set image
				var imageSrc = '<%=imgsrc%>',    
				imageSize = new daum.maps.Size(16, 16),
				imageOption = {
					offset : new daum.maps.Point(8, 8)
				};
				//set location and attach on the map
				var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption)
					, markerPosition = new daum.maps.LatLng(<%=y%>,<%=x%>);
		
				var marker = new daum.maps.Marker({
					title : '<%=stop%> -- ���� : <%=ride%>, ���� : <%=alight%>',
					position : markerPosition,
					image : markerImage
				});
		
				marker.setMap(map);
			</script>
			<%
		}
	%>
</body>
</html>