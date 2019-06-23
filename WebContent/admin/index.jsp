<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<script type="text/javascript" src="../js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>

</head>

<body>

	<div class="container">
	<div class="row" style="margin-top:130px;">
	<div class="col-md-4 col-md-offset-4">
		<form action="Admin_login" method="post" class="form-signin">
			<h2 class="form-signin-heading">请登录</h2>
			
			<label class="sr-only">用户名：</label> 
			<input	type="text" name="admin.username" value="admin"  class="form-control" placeholder="Username" required autofocus> 
			
			<label class="sr-only">密码：</label> 
			<input type="password"  name="admin.password" value="admin" class="form-control" placeholder="Password" required>
			
			<button class="btn btn-lg btn-primary btn-block" type="submit" >登录</button>
			
		</form>
	</div>
	</div>
	</div>
</body>
</html>
