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

</head>
<body>
	<div id="page-main" style="backgroud:#104d74;">
		<div class="row">
			<div class="col-md-12">
				<div class="panel-heading">编辑分类</div>

				<div class="panel-body">
					<form action="Admin_updateCategory?category.cid=<s:property value="category.cid"/>" method="post">
						<table class="table table-striped table-hover table-bordered">
							<thead>
								<tr>
									<th class="text-center">分类名</th>
									<th class="text-center">编辑</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" name="category.cname"
										class="form-control"  value="<s:property value="category.cname"/>"/>
									</td>
									<td><button type="submit"
											class="btn btn-success btn-block">提交</button>
									</td>
								<tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
