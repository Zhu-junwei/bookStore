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
			<div class="col-sm-4 col-sm-offset-2">
				<h1>修改个人信息：</h1>
				<hr />
			</div>
		</div>

		<form class="form-horizontal" method="post" action="User_updateInfo">
			<input type="hidden" name="user.uid" value="<s:property value="#session.user.uid"/>"/>
			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-5">
					<input required name="user.username" type="text" class="form-control" id="username"
						value="<s:property value="#session.user.username"/>"> <span class="text-danger"><s:property
							value="errorInfo.usernameError" />
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="realname" class="col-sm-2 control-label">真实姓名</label>
				<div class="col-sm-5">
					<input name="user.realname" type="text" class="form-control" id="realname"
						value="<s:property value="#session.user.realname"/>">
				</div>
			</div>

			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-5">
					<input required name="user.email" type="email" class="form-control" id="email"
						value="<s:property value="#session.user.email"/>"> <span id="emailError"
						class="text-danger"></span>
				</div>
			</div>

			<div class="form-group">
				<label for="phone" class="col-sm-2 control-label">手机</label>
				<div class="col-sm-5">
					<input required name="user.phone" type="text" class="form-control" id="phone"
						value="<s:property value="#session.user.phone"/>"> <span id="phoneError"
						class="text-danger"></span>
				</div>
			</div>

			<div class="form-group">
				<label for="address" class="col-sm-2 control-label">地址</label>
				<div class="col-sm-5">
					<input name="user.address" type="text" class="form-control" id="address"
						value="<s:property value="#session.user.address"/>">
				</div>
			</div>

			<div class="form-group">
				<label for="zipcode" class="col-sm-2 control-label">邮编</label>
				<div class="col-sm-5">
					<input name="user.zipcode" type="text" class="form-control" id="zipcode"
						value="<s:property value="#session.user.zipcode"/>"> <span id="zipcodeError"
						class="text-danger"></span>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-6">
					<button type="submit" class="btn btn-success btn-block">更新</button>
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
				
			});
	</script>
</body>
</html>
