<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link href="resources/css/comm.css" type="text/css" rel="stylesheet"/>
    <!-- 引入 Bootstrap -->
<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){

});
</script>
<title>通知</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<div class="jumbotron">
				<h2>
					蚁穴仓库管理系统
				</h2>
			</div>
		<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span>
					 <span class="icon-bar"></span><span class="icon-bar"></span>
					 </button>
					 <a class="navbar-brand" href=".">首页</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
					<li><a style="color:#CC0000;font-size:1.2em;">当前管理员：
					${sessionScope.user.getName()}
					</a>
						</li>
						<li>
							 <a href="logout">退出系统</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
			<div class="col-md-12 column">
			<table class="table table-hover">
						<thead>
							<tr><th>
									序号
								</th>
								<th>
									条形码
								</th>
								<th>
									商品名称
								</th>
								<th>
									所在仓
								</th>
								<th>
								距过期天数
								</th>
								<th>
									数量
								</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<c:if test="${msg==null || fn:length(msg) == 0}">   
						</c:if>  
						<c:forEach items="${msg}" var="item" varStatus="status">  
						  <tr >
						  	<td>${msg.indexOf(item)}</td>  
						    <td class="center"><span class="center">${item.getBarcode()}</span></td>  
						    <td>${item.getName()}</td><td>${item.getHouseId()}</td>
						    <td>${item.getDateTime()}</td>  
						    <td>${item.getNumber()}</td>  
						  </tr>  
						</c:forEach> 
					</table>
			<div class="col-md-12 column">
		<br/><br/><br/><br/><br/><br/><br/>
		</div>
	</div>
	<jsp:include page="foot.jsp" flush="true"/>
	</div>	
</div>
</body>
</html>