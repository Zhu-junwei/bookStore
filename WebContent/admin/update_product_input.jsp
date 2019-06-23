<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="main.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

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
            
            img{
                width: 20px;
                height: 20px;
            }
        }
    </style>
<sx:head/>
</head>
<body>
	<div id="page-main" style="backgroud:#104d74;">
			<h2 class="text-info">更新商品</h2><hr>
			
			<form action="Admin_updateProduct" method="post" enctype="multipart/form-data">
			<input type="hidden" name="product.pid" value="<s:property value="product.pid"/>"/>
			<input type="hidden" name="product.image" value="<s:property value="product.image"/>"/>
			<div class="form-group row">
				<label for="password" class="col-sm-2 control-label">商品名：</label>
				<div class="col-sm-5">
					<input required name="product.pname" type="text" class="form-control" value="<s:property value="product.pname"/>">
				</div>
			</div>
			<div class="form-group row">
				<label for="password" class="col-sm-2 control-label">作者：</label>
				<div class="col-sm-5">
					<input required name="product.author" type="text" class="form-control" value="<s:property value="product.author"/>">
				</div>
			</div>
			<div class="form-group row">
				<label for="password" class="col-sm-2 control-label">价格：</label>
				<div class="col-sm-5">
					<input required name="product.price" type="number" class="form-control" value="<s:property value="product.price"/>">
				</div>
			</div>
			<div class="form-group row">
				<label for="password" class="col-sm-2 control-label">出版日期：</label>
				<div class="col-sm-5">
					<%-- <input name="product.time" type="text" class="form-control" value="<s:property value="product.time"/>"> --%>
					<sx:datetimepicker name="product.time" displayFormat="yyyy-MM-dd" />
				</div>
			</div>
			<div class="form-group row">
				<label for="password" class="col-sm-2 control-label">商品图片：</label>
				<div class="col-sm-5">
					<input name="upload" type="file">
				</div>
			</div>
			<div class="form-group row">
				<label for="password" class="col-sm-2 control-label">所属分类：</label>
				<div class="col-sm-5">
					<select name="category.cid">
						<s:iterator value="categories" var="x">
						<option value="<s:property value="#x.cid"/>" <s:if test="#x.cid == product.category.cid">selected</s:if>><s:property value="#x.cname"/></option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="col-sm-7">
			<button type="submit" class="btn btn-success btn-block btn-lg">提交</button>
			</div>
		</form>
	</div>
</body>
</html>
