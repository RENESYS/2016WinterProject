<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>���� �ִ� ������ ������ 500</h1>
	<form name="population" action="stopInfo.jsp" method="get">
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
		<select name="mon">
			<option disabled>�˻��� ���� �����ϼ���</option>
			<option value="201501">1��</option>
			<option value="201502">2��</option>
			<option value="201503">3��</option>
			<option value="201504">4��</option>
			<option value="201505">5��</option>
			<option value="201506">6��</option>
			<option value="201507">7��</option>
			<option value="201508">8��</option>
			<option value="201509">9��</option>
			<option value="201510">10��</option>
			<option value="201511">11��</option>
			<option value="201512">12��</option>
		</select> 
		<select name="type">
			<option disabled>�˻��� ���� �����ϼ���</option>
			<option value="Ride">����</option>
			<option value="Alight">����</option>
		</select>
		<button type="submit">�˻�</button>
	</form>
	<br><br><br>
	<h1>�뼱�� ȥ�⵵ �ȳ�</h1>
	<form name="population" action="routeInfo.jsp" method="get">
		�뼱��ȣ �Է� : 
		<input type="text" name="routeNo">
		<select name="mon">
			<option disabled>�˻��� ���� �����ϼ���</option>
			<option value="201501">1��</option>
			<option value="201502">2��</option>
			<option value="201503">3��</option>
			<option value="201504">4��</option>
			<option value="201505">5��</option>
			<option value="201506">6��</option>
			<option value="201507">7��</option>
			<option value="201508">8��</option>
			<option value="201509">9��</option>
			<option value="201510">10��</option>
			<option value="201511">11��</option>
			<option value="201512">12��</option>
		</select> 
		<button type="submit">�˻�</button>
	</form>
	<br><br><br>
</body>
</html>
