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
				<h1>修改密码：</h1>
				<hr />
			</div>
		</div>

		<form class="form-horizontal" method="post" action="User_changePassword">
			<input type="hidden" name="user.uid" value="<s:property value="#session.user.uid"/>"/>
			<div class="form-group">
				<label for="oldPassword" class="col-sm-2 control-label">请输入旧密码：</label>
				<div class="col-sm-5">
					<input required name="oldPassword" type="text" class="form-control" id="oldPassword">
					<span class="text-danger"><s:property value="errorInfo.passwordError" />
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="newPassword" class="col-sm-2 control-label">请输入新密码：</label>
				<div class="col-sm-5">
					<input required name="newPassword" type="text" class="form-control" id="newPassword">
					<span id="newPasswordError" class="text-danger">
					</span>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-6">
					<button type="submit" class="btn btn-success btn-block">确认修改</button>
				</div>
			</div>
		</form>
	</div>


	<script type="text/javascript">
		$(document).ready(
			function() {
				$("#newPassword").blur(function() {
					var value = $(this).val();
					if (!/^\w{6,20}$/
							.test(value)) {
						$("#newPasswordError").text("密码长度不够~");
					}else{
						$("#newPasswordError").text("");
					}
				});
			});
	</script>
</body>
</html>
