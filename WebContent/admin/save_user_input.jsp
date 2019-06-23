<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="main.jsp"%>


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
@media ( min-width : 768px) {
	#letf-nav {
		width: 230px;
		margin-top: 60px;
		position: absolute;
		height: 800px;
		background-color: #eee;
	}
	#my-search {
		margin-top: 10px;
	}
	#page-main {
		margin-left: 260px;
	}
	#navbar-brand {
		margin-left: 30px;
		font-weight: 350;
		font-size: 25px;
	}
	img {
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
				<h1>用户添加：</h1>
				<hr />
			</div>
		</div>

		<form class="form-horizontal" method="post" action="Admin_saveUser">

			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-5">
					<input required name="user.username" type="text" class="form-control" id="username"
						placeholder="Username"> <span class="text-danger"><s:property
							value="errorInfo.usernameError" />
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-5">
					<input required name="user.password" type="password" class="form-control" id="password" placeholder="Password">
					<span id="passwordError" class="text-danger"></span>
				</div>
			</div>

			<div class="form-group">
				<label for="realname" class="col-sm-2 control-label">真实姓名</label>
				<div class="col-sm-5">
					<input name="user.realname" type="text" class="form-control" id="realname"
						placeholder="Realname">
				</div>
			</div>

			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-5">
					<input required name="user.email" type="email" class="form-control" id="email"
						placeholder="Email"> <span id="emailError"
						class="text-danger"></span>
				</div>
			</div>

			<div class="form-group">
				<label for="phone" class="col-sm-2 control-label">手机</label>
				<div class="col-sm-5">
					<input required name="user.phone" type="text" class="form-control" id="phone"
						placeholder="Phone"> <span id="phoneError"
						class="text-danger"></span>
				</div>
			</div>

			<div class="form-group">
				<label for="address" class="col-sm-2 control-label">地址</label>
				<div class="col-sm-5">
					<input name="user.address" type="text" class="form-control" id="address"
						placeholder="Address">
				</div>
			</div>

			<div class="form-group">
				<label for="zipcode" class="col-sm-2 control-label">邮编</label>
				<div class="col-sm-5">
					<input name="user.zipcode" type="text" class="form-control" id="zipcode"
						placeholder="Zipcode"> <span id="zipcodeError"
						class="text-danger"></span>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success">添加</button>
				</div>
			</div>
		</form>
	</div>


	<script type="text/javascript">
		$(document).ready(
			function() {
			
				$("#email").blur(function() {
					var value = $(this).val();
					if (!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/
							.test(value)) {
						$("#emailError").text("邮箱格式错误~");
					}else{
						$("#emailError").text("");
					}
				});
				
				$("#zipcode").blur(function() {
					var value = $(this).val();
					if (!/^\d{6}$/
							.test(value)) {
						$("#zipcodeError").text("格式错误，请输入6位纯数字~");
					}else{
						$("#zipcodeError").text("");
					}
				});
				
				$("#phone").blur(function() {
					var value = $(this).val();
					if (!/^\d{11}$/
							.test(value)) {
						$("#phoneError").text("格式错误，请输入11位纯数字~");
					}else{
						$("#phoneError").text("");
					}
				});
				
				$("#password").blur(function() {
					var value = $(this).val();
					if (!/^\w{6,20}$/
							.test(value)) {
						$("#passwordError").text("密码长度不够~");
					}else{
						$("#passwordError").text("");
					}
				});
			});
	</script>
</body>
</html>
