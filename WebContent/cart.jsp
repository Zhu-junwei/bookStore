<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
                width: 240px;
                height: 350px;
            }
        }
    </style>

</head>
<body>
    <div id="page-main" style="backgroud:#104d74;">
    <s:if test="#session.cart.map.size() > 0">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <tr>
                        <td>商品</td>
                        <td>价格</td>
                        <td>数量</td>
                        <td>小计</td>
                        <td>操作</td>
                    </tr>
                    <s:iterator value="#session.cart.map">
                    <tr>
                        <td><s:property value="value.product.pname"/></td>
                        <td>￥<s:property value="value.product.price"/></td>
                        <td><s:property value="value.count"/></td>
                        <td>￥<s:property value="value.subTotal"/></td>
                        <td><a href="Cart_removeCartItem?pid=<s:property value="value.product.pid"/>">删除</a></td>
                    </tr>
                    </s:iterator>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 col-md-offset-9">
                <h4>商品总额：￥<s:property value="#session.cart.total"/></h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 col-md-offset-9">
                <a href="Cart_clearCart" class="btn btn-default">清空购物车</a>
                <a href="Order_submitOrder" class="btn btn-success">提交订单</a>
            </div>
        </div>
        </s:if>
        <s:else>
        	<div class="row">
        		<div class="col-md-10 col-md-offset-1">
        			<div class="alert alert-warning" role="alert">
        				<h2 class="text-center">购物车为空~<br>请先去购物~</h2>
        			</div>
        		</div>
        	</div>
        </s:else>
    </div>
</body>
</html>
