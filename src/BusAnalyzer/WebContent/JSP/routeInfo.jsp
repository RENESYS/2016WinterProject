<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="db.DBContact" import="other.RouteResManager" import="java.sql.*"%>
<%
	DBContact db = new DBContact();
	RouteResManager rsm = new RouteResManager();
	db.chooseDB("use sample");
	String route = request.getParameter("routeNo");
	String mon = request.getParameter("mon");
	route = rsm.checkInput(route);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<h1><%=route%></h1>
</head>
<body>

</body>
</html>