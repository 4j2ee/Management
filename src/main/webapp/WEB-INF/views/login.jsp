<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- validation -->
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script>
$().ready(function(){
	var vld=$("form").validate({
		 rules:{
		    	user:"required",
		    	pwd:{required: true,},
		    	},
		 messages:{
			 user:"请输入用户账号",
			 pwd:"请输入密码",
		 }
		});
});
</script>
<title>登录</title>
</head>
<body>
<div class="container" style="padding:0px;">
	<div class="row clearfix" id='hd'>
		<div class="col-md-12 column">
		<div class="jumbotron">
				<h2 align="center">
					蚁穴库存管理系统
				</h2>
			</div>
		<div class="col-md-4 column">
		</div>
		<div class="col-md-4 column" id="form">
		<br/><br/><br/>
		<h3 align="center">登录</h3>
		<p style="color:red;">${sessionScope.stat}</p>
			<form role="form" action="login" method="post">
				<div class="form-group">
					 <label>账号</label><input type="text" class="form-control" id="exampleInputEmail1" name="user" />
				</div>
				<div class="form-group">
					 <label>密码</label><input type="password" class="form-control" id="exampleInputPassword1" name="pwd" />
				</div>
				<button type="submit" class="btn btn-default">登录</button>
				<button type="reset" class="btn btn-default">重置</button>
			</form>
			<br/><br/><br/>
		</div>
		<div class="col-md-4 column">
		</div>
		<div class="col-md-12 column">
		<br/><br/><br/><br/><br/><br/><br/>
		<jsp:include page="foot.jsp" flush="true"/>
		</div>
	</div>
	</div>	
</div>
</body>
</html>