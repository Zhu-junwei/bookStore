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
			<div class="col-md-4">
				<img src="<s:property value="product.image"/>">
			</div>
			<div class="col-md-4">
				<h2>
					<s:property value="product.pname" />
					<small>￥<s:property value="product.price" />
					</small>
				</h2>
				<h4>
					<s:property value="product.author" />
					(作者)
				</h4>
				<h4>
					出版日期：
					<s:date name="product.time" format="yyyy-M"/>
				</h4>
				<br />
				<hr />
				<form method="post" action="Cart_addCartItem?pid=<s:property value="product.pid"/>">
					<form-group> <label for="cart">购买数量：</label> <input required name="count" type="number" id="cart" class="form-control" />
					<br />
					<br />
					</form-group>
					<input type="submit" id="submit"
						class="btn btn-success btn-lg pull-right" value="加入到购物车" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>
