<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="db.DBContact" import="manage.RouteResManager"
	import="java.sql.*"%>
<%@page errorPage = "error.jsp" %>
<%
	RouteResManager rsm = new RouteResManager();
	String route = request.getParameter("routeNo");
	String mon = request.getParameter("mon");
	String hour = request.getParameter("hour");
	route = rsm.checkInput(route);
	rsm.setStopList(route);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bus Congestion Analyze</title>
<!-- Bootstrap core CSS -->
<link href="../dist/css/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="starter-template.css" rel="stylesheet">
</head>


<body>
	<div class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Bus Statistics v0.9</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">Valuable Stops 500</a></li>
					<li class="active"><a href="#">Bus Congestion Analyze</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div>

	<div class="container">
	<h3><%=mon%>월 <%=hour%>시 <%=route%>번 버스 차내 혼잡도입니다.</h3>
	<div id="map" style="width: 100%; height: 650px;"></div>

	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=2afaac55291764d588161ae97c7844e3"></script>
	<script>
		//create Map
		var mapContainer = document.getElementById('map'), mapOption = {
			center : new daum.maps.LatLng(37.56564, 126.977021),
			level : 7
		};
		var map = new daum.maps.Map(mapContainer, mapOption);
	</script>
	<%
	String formerX = null, formerY = null;
	while(rsm.isStopLeft()){
		rsm.setResultSet(route, mon, hour);
		String stop = rsm.getStop();
		String x = rsm.getGpsx();
		String y = rsm.getGpsy();
		int pass = rsm.calcCongestion();
		String color = rsm.setColor();
		if(formerX != null && formerY != null){
		%>
		<script>
			var linePath = [
			    new daum.maps.LatLng(<%=formerY%>, <%=formerX%>),
			    new daum.maps.LatLng(<%=y%>, <%=x%>)
			];
			
			var polyline = new daum.maps.Polyline({
			    path: linePath, strokeWeight: 3, strokeColor: '<%=color%>', 
			    strokeOpacity: 0.8, strokeStyle: 'solid'
			});
			
			polyline.setMap(map);  
		</script>
		<%
		}
		formerX = x;
		formerY = y;
	}
	%>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../dist/js/bootstrap.min.js"></script>
</body>
</html>