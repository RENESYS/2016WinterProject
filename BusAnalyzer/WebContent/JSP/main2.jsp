<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Bus Statistics</title>
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
	
	<div id="loading" style="position:absolute; z-index:100000; visibility:hidden; left:37%; top:33%;">
		<img src="../img/wait2.jpg" style="width:70%; height:auto">
	</div>

	<div class="container">
		<h1>노선별 혼잡도 안내</h1>
		<form name="population" action="routeInfo.jsp" method="get">
			노선번호 입력 : <input type="text" name="routeNo"> 
			<select name="mon">
				<option disabled>검색할 달을 선택하세요(7월 이후)</option>
				<option value="201507">7월</option>
				<option value="201508">8월</option>
				<option value="201509">9월</option>
				<option value="201510">10월</option>
				<option value="201511">11월</option>
				<option value="201512">12월</option>
			</select> 
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
			<select name="bound">
				<option disabled>검색할 시간대를 선택하세요</option>
				<option value="down">하행</option>
				<option value="up">상행</option>
			</select>
			<button type="submit" onclick="wait()">검색</button>
		</form>
		<br><br><br>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../dist/js/bootstrap.min.js"></script>
</body>
</html>
