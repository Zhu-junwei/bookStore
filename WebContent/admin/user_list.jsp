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
				<div class="panel-heading">查看所有用户</div>
				<div class="panel-body">
					<table class="table table-striped table-hover table-bordered">
						<thead>
							<tr>
								<th>用户编号</th>
								<th>用户名</th>
								<th>真实姓名</th>
								<th>邮箱</th>
								<th>电话</th>
								<th>地址</th>
								<th>邮政编码</th>
								<th>编辑</th>
								<th>删除</th>
							</tr>
						</thead>
						<tbody>							
							<s:iterator value="pageUser.list" var="x">
   							<tr>
   							<td><s:property value="#x.uid"/></td>
   							<td><s:property value="#x.username"/></td>
   							<td><s:property value="#x.realname"/></td>
   							<td><s:property value="#x.email"/></td>
   							<td><s:property value="#x.phone"/></td>
   							<td><s:property value="#x.address"/></td>
   							<td><s:property value="#x.zipcode"/></td>
   							<td><a href="Admin_updateUserInput?uid=<s:property value="#x.uid"/>">编辑</a></td>
   							<td><a href="Admin_deleteUser?uid=<s:property value="#x.uid"/>">删除</a></td>
   							<tr>
   							</s:iterator>
						</tbody>
					</table>
				</div>
				</div>
			</div><hr/>
			
			<nav>
			<ul class="pager">
				<li><a href="Admin_listAllUserByPage?p=1">首页</a>
				</li>
				<s:if test="page.currentPage > 1">
				<li><a href="Admin_listAllUserByPage?p=<s:property value="page.currentPage-1" />">上一页</a>
				</li>
				</s:if>
				
				<s:if test="page.currentPage < page.totalPage">
				<li><a href="Admin_listAllUserByPage?p=<s:property value="page.currentPage+1" />">下一页</a>
				</li>
				</s:if>
				<li><a href="Admin_listAllUserByPage?p=<s:property value="page.totalPage" />">尾页</a>
				</li>
			</ul>
		</nav>
		</div>
	
</body>
</html>
