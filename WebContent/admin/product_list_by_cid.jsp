<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="main.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


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
		width: 170px;
		height: 250px;
	}
}
</style>

</head>
<body>
	<div id="page-main" style="backgroud:#104d74;">
		<div class="row">
			<s:iterator value="page.list" var="x">
				<div class="col-md-3" style="height:390px">
					<a href="Admin_listOneProductByPid?pid=<s:property value="#x.pid"/>"><img src="../<s:property value="#x.image"/>">
					</a>
					<h4>
						<a href="Admin_listOneProductByPid?pid=<s:property value="#x.pid"/>"><s:property value="#x.pname" />
						</a>&nbsp;&nbsp;<small>￥<s:property value="#x.price" />
						</small>
					</h4>
					<a href="Admin_updateProductInput?pid=<s:property value="#x.pid"/>" class="text-danger">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="Admin_deleteProduct?pid=<s:property value="#x.pid"/>" class="text-danger">删除</a>
				</div>
			</s:iterator>
		</div><hr/>
		<nav>
			<ul class="pager">
				<li><a href="Admin_listAllProductByPageAndCid?p=1&cid=<s:property value="cid"/>">首页</a>
				</li>
				<s:if test="page.currentPage > 1">
				<li><a href="Admin_listAllProductByPageAndCid?p=<s:property value="page.currentPage-1"/>&cid=<s:property value="cid"/>">上一页</a>
				</li>
				</s:if>
				
				<s:if test="page.currentPage < page.totalPage">
				<li><a href="Admin_listAllProductByPageAndCid?p=<s:property value="page.currentPage+1"/>&cid=<s:property value="cid"/>">下一页</a>
				</li>
				</s:if>
				<li><a href="Admin_listAllProductByPageAndCid?p=<s:property value="page.totalPage"/>&cid=<s:property value="cid"/>">尾页</a>
				</li>
			</ul>
		</nav>
	</div>
</body>
</html>
