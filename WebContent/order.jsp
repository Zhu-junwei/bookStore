<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="main.jsp" %>

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
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
               		<tr>
                		<td colspan="5">订单编号：<s:property value="order.oid"/></td>
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
                    </s:iterator><hr>
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
            <div class="col-md-2 col-md-offset-10">
                <h4>商品总额：<span class="text-success">￥<s:property value="order.total"/></span></h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-1 col-md-offset-10">
                <a href="Order_payOrder?oid=<s:property value="order.oid"/>" class="btn btn-success">确认支付</a>
            </div>
        </div>
    </div>

</body>
</html>
