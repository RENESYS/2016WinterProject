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
		<h1>�뼱�� ȥ�⵵ �ȳ�</h1>
		<form name="population" action="routeInfo.jsp" method="get">
			�뼱��ȣ �Է� : <input type="text" name="routeNo"> 
			<select name="mon">
				<option disabled>�˻��� ���� �����ϼ���(7�� ����)</option>
				<option value="201507">7��</option>
				<option value="201508">8��</option>
				<option value="201509">9��</option>
				<option value="201510">10��</option>
				<option value="201511">11��</option>
				<option value="201512">12��</option>
			</select> 
			<select name="hour">
				<option disabled>�˻��� �ð��븦 �����ϼ���</option>
				<option value="0">00��</option>
				<option value="1">01��</option>
				<option value="2">02��</option>
				<option value="3">03��</option>
				<option value="4">04��</option>
				<option value="5">05��</option>
				<option value="6">06��</option>
				<option value="7">07��</option>
				<option value="8">08��</option>
				<option value="9">09��</option>
				<option value="10">10��</option>
				<option value="11">11��</option>
				<option value="12">12��</option>
				<option value="13">13��</option>
				<option value="14">14��</option>
				<option value="15">15��</option>
				<option value="16">16��</option>
				<option value="17">17��</option>
				<option value="18">18��</option>
				<option value="19">19��</option>
				<option value="20">20��</option>
				<option value="21">21��</option>
				<option value="22">22��</option>
				<option value="23">23��</option>
			</select>
			<select name="bound">
				<option disabled>�˻��� �ð��븦 �����ϼ���</option>
				<option value="down">����</option>
				<option value="up">����</option>
			</select>
			<button type="submit" onclick="wait()">�˻�</button>
		</form>
		<br><br><br>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../dist/js/bootstrap.min.js"></script>
</body>
</html>
