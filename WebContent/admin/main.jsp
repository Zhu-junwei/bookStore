<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
	<script type="text/javascript" src="../js/jquery-2.1.3.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
   
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
                width: 170px;
                height: 250px;
            }
        }
    </style>

</head>
<body>
    <nav class="navbar navbar-default navbar-static-top">
        <!-- 顶部导航左侧标志 -->
        <div class="navbar-header">
            <a href="#"  id="navbar-brand" class="navbar-brand">后台管理</a>
        </div>
        
        <!-- 顶部导航右侧注销-->
        <ul class="nav navbar-nav navbar-right" style="margin-right:25px;">
            <li><a href="Admin_logout"><span class="glyphicon glyphicon-off"></span>&nbsp;注销</a></li>
        </ul>
        
        <div id="letf-nav">
			<ul class="nav">
				<li>
                    <div class="input-group">
                        <input type="text" name="pname" class="form-control" id="pname" required>
                        <span class="input-group-btn" id="my-search">
                            <a id="a" href="#" class="btn btn-default">
                                <span class="glyphicon glyphicon-search"></span>
                            </a>
                        </span>
                    </div>
                </li>
				<li>
					<a href="#sub1" data-toggle="collapse">分类管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
					<ul id="sub1" class="nav collapse">
						<li><a href="Admin_listAllCategory"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;查看所有分类</a></li>
						<li><a href="save_category_input.jsp"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;添加分类</a></li>
					</ul>
				</li>
				<li>
					<a href="#sub2" data-toggle="collapse">商品管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
					<ul id="sub2" class="nav collapse">
						<li><a href="Admin_listAllProductByPage?p=1"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;查看所有商品</a></li>
						<li><a href="Admin_saveProductInput"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;添加商品</a></li>
					</ul>
				</li>
				<li>
					<a href="#sub3" data-toggle="collapse">订单管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
					<ul id="sub3" class="nav collapse">
						<li><a href="Admin_listPayedOrder"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;查看已付款订单</a></li>
						<li><a href="Admin_listCompletedOrder"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;查看交易成功订单</a></li>
					</ul>
				</li>
				<li>
					<a href="#sub4" data-toggle="collapse">用户管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
					<ul id="sub4" class="nav collapse">
						<li><a href="Admin_listAllUserByPage?p=1"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;查看所有用户</a></li>
						<li><a href="Admin_saveUserInput"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;添加用户</a></li>
					</ul>
				</li>
			</ul>
		</div>
      
  </nav>

<script type="text/javascript">
	$(document).ready(function(){
	$("#a").bind("click", f);
		function f(){
			var pname = $("#pname").val();
			$("#a").attr("href","Admin_listAllProductByPageAndPname?p=1&pname="+pname);
		}
	});
</script>
</body>
</html>
