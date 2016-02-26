<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bus Statistics - ERROR!</title>
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

	<div class="container" align = "center">
		<table>
    	<tr>
    		<td>
    			<div class="panel panel-danger">
			        <div class="panel-heading">
			          <h2 class="panel-title"><b>에러가 발생했습니다!</b></h2>
			        </div>
			        <div class="panel-body">
			          <div class="alert alert-warning">혹시 이런 실수를 하지 않으셨나요?</div></br>
			          <p class="text-danger">※ 잘못된 노선 번호를 입력하였습니다</p>
			          </br>
			          </br>
			          <p>다시 하려면 상단의 Home 탭이나 뒤로 가기를 누르세요.</p>
			        </div>
      			</div>
    		</td>
    	</tr>
    </table>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../dist/js/bootstrap.min.js"></script>
</body>
</html>