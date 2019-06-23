<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="main.jsp"%>
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

    <div id="page-main" style="backgroud:#104d74;">
        <div class="row">
            <div class="col-md-10">
                <table class="table table-bordered">
               		<tr>
                		<td colspan="3">订单编号：<s:property value="order.oid"/></td>
                		<td>订单状态：
                			<s:if test="order.state == 1">
                				<span><a class="text-info" href="Admin_deleverGoods?oid=<s:property value="order.oid"/>">发货</a></span>
                			</s:if>
                			<s:if test="order.state == 2">
                				<span><a class="text-info" href="Admin_informReceiveGoods?oid=<s:property value="order.oid"/>">通知收货</a></span>
                			</s:if>
                			<s:if test="order.state == 3">
                				<span class="text-info">已通知买家收货</span>
                			</s:if>
                			<s:if test="order.state == 4">
                				<span class="text-success">交易完成</span>
                			</s:if>
                		</td>
                	</tr>
                    <tr>
                        <td>商品</td>
                        <td>价格</td>
                        <td>数量</td>
                        <td>小计</td>
                    </tr>
                    <s:iterator value="order.orderItems" var="x">
                    <tr>
                        <td  class="text-info"><s:property value="#x.product.pname"/></td>
                        <td>￥<s:property value="#x.product.price"/></td>
                        <td><s:property value="#x.count"/></td>
                        <td>￥<s:property value="#x.subTotal"/></td>
                    </tr>
                    </s:iterator>
                    <tr>
                        <td>真实姓名</td>
                        <td colspan="3"><s:property value="order.realname"/></td>
                    </tr>
                    <tr>
                        <td>手机</td>
                        <td colspan="3"><s:property value="order.phone"/></td>
                    </tr>
                    <tr>
                        <td>地址</td>
                        <td colspan="3"><s:property value="order.address"/></td>
                    </tr>
                    <tr>
                        <td>邮编</td>
                        <td colspan="3"><s:property value="order.zipcode"/></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-8">
                <h4>商品总额：<span class="text-success">￥<s:property value="order.total"/></span></h4>
            </div>
        </div><br>
    </div>

</body>
</html>
