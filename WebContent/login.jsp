<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="main.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<script type="text/javascript" src="js/jquery-2.1.3.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>

	<style type="text/css">
		@media (min-width: 768px){
			#letf-nav{
				width: 230px;
				margin-top: 60px;
				position: absolute;
				height: 800px;
				background-color: #eee;
			}
			#my-search{
				margin-top: 10px;
			}
			#page-main{
				margin-left: 260px;
			}
			#navbar-brand{
				margin-left: 30px;
				font-weight: 350;
				font-size: 25px;
			}
			img{
				width: 240px;
				height: 350px;
			}
		}
	</style>

</head>
<body>

	<div id="page-main" style="backgroud:#104d74;">
		<div class="row">
			<div class="col-sm-3 col-sm-offset-2">
				<h1>用户登录：</h1><hr/>
			</div>
		</div>
		
		<form class="form-horizontal" action="User_login" method="post">

			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">用户名：</label>
				<div class="col-sm-6">
					<input name="user.username" type="text" class="form-control" id="username" placeholder="请输入用户名">
					<span><s:property value="errorInfo.usernameError"/></span>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">密码：</label>
				<div class="col-sm-6">
					<input name="user.password" type="password" class="form-control" id="password" placeholder="请输入密码">
					<span><s:property value="errorInfo.passwordError"/></span>
				</div>
			</div>

			<div class="col-sm-offset-2 col-sm-2">
				<button type="submit" class="btn btn-success btn-lg">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</button>
			</div>
		</form>
	</div>
</body>
</html>
