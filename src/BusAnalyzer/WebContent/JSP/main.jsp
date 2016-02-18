<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>월별 최대 승하차 정류소 500</h1>
	<form name="population" action="stopInfo.jsp" method="get">
		<select name="hour">
			<option disabled>검색할 시간대를 선택하세요</option>
			<option value="0">00시</option>
			<option value="1">01시</option>
			<option value="2">02시</option>
			<option value="3">03시</option>
			<option value="4">04시</option>
			<option value="5">05시</option>
			<option value="6">06시</option>
			<option value="7">07시</option>
			<option value="8">08시</option>
			<option value="9">09시</option>
			<option value="10">10시</option>
			<option value="11">11시</option>
			<option value="12">12시</option>
			<option value="13">13시</option>
			<option value="14">14시</option>
			<option value="15">15시</option>
			<option value="16">16시</option>
			<option value="17">17시</option>
			<option value="18">18시</option>
			<option value="19">19시</option>
			<option value="20">20시</option>
			<option value="21">21시</option>
			<option value="22">22시</option>
			<option value="23">23시</option>
		</select> 
		<select name="mon">
			<option disabled>검색할 달을 선택하세요</option>
			<option value="201501">1월</option>
			<option value="201502">2월</option>
			<option value="201503">3월</option>
			<option value="201504">4월</option>
			<option value="201505">5월</option>
			<option value="201506">6월</option>
			<option value="201507">7월</option>
			<option value="201508">8월</option>
			<option value="201509">9월</option>
			<option value="201510">10월</option>
			<option value="201511">11월</option>
			<option value="201512">12월</option>
		</select> 
		<select name="type">
			<option disabled>검색할 달을 선택하세요</option>
			<option value="Ride">승차</option>
			<option value="Alight">하차</option>
		</select>
		<button type="submit">검색</button>
	</form>
	<br><br><br>
	<h1>노선별 혼잡도 안내</h1>
	<form name="population" action="routeInfo.jsp" method="get">
		노선번호 입력 : 
		<input type="text" name="routeNo">
		<select name="mon">
			<option disabled>검색할 달을 선택하세요</option>
			<option value="201501">1월</option>
			<option value="201502">2월</option>
			<option value="201503">3월</option>
			<option value="201504">4월</option>
			<option value="201505">5월</option>
			<option value="201506">6월</option>
			<option value="201507">7월</option>
			<option value="201508">8월</option>
			<option value="201509">9월</option>
			<option value="201510">10월</option>
			<option value="201511">11월</option>
			<option value="201512">12월</option>
		</select> 
		<button type="submit">검색</button>
	</form>
	<br><br><br>
</body>
</html>
