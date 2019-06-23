<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ include file="main.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<script type="text/javascript" src="js/jquery-2.1.3.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>

</head>
<body>
	<div id="page-main" style="backgroud:#104d74;">
		<div class="row">
			<div class="col-md-12">
				<div class="panel-heading">查看订单</div>
				<div class="panel-body">
					<table class="table table-striped table-hover table-bordered">
						<thead>
							<tr>
								<th>订单编号</th>
								<th>用户名</th>
								<th>真实姓名</th>
								<th>下单时间</th>
								<th>总价</th>
								<td>详情</td>
								<th>订单状态</th>
								
							</tr>
						</thead>
						<tbody>							
							<s:iterator value="orders" var="order">
   							<tr>
   							<td><s:property value="#order.oid"/></td>
   							<td><s:property value="#order.user.username"/></td>
   							<td><s:property value="#order.realname"/></td>
   							<td><s:date name="#order.time" format="yyyy-MM-dd HH:mm:ss"/></td>
   							<td><s:property value="#order.total"/></td>
   							<td><a href="Admin_listOrderByOid?oid=<s:property value="#order.oid"/>">查看详情</a></td>
   							<td>
	   							<s:if test="#order.state == 1">
	                				<span><a class="text-info" href="Admin_deleverGoods?oid=<s:property value="#order.oid"/>">发货</a></span>
	                			</s:if>
	                			<s:if test="#order.state == 2">
	                				<span><a class="text-info" href="Admin_informReceiveGoods?oid=<s:property value="#order.oid"/>">通知收货</a></span>
	                			</s:if>
	                			<s:if test="#order.state == 3">
	                				<span class="text-info">已通知买家收货</span>
	                			</s:if>
	                			<s:if test="#order.state == 4">
	                				<span class="text-success">交易完成</span>
	                			</s:if>
	                		</td>
   							<tr>
   							</s:iterator>
						</tbody>
					</table>
				</div>
				</div>
			</div><hr/>
			
			<nav>
			<ul class="pager">
				<li><a href="Admin_listAllOrderByPage?p=1">首页</a>
				</li>
				<s:if test="page.currentPage > 1">
				<li><a href="Admin_listAllOrderByPage?p=<s:property value="page.currentPage-1" />">上一页</a>
				</li>
				</s:if>
				
				<s:if test="page.currentPage < page.totalPage">
				<li><a href="Admin_listAllOrderByPage?p=<s:property value="page.currentPage+1" />">下一页</a>
				</li>
				</s:if>
				<li><a href="Admin_listAllOrderByPage?p=<s:property value="page.totalPage" />">尾页</a>
				</li>
			</ul>
		</nav>
		</div>
	
</body>
</html>
