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
<!-- validation -->
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
	$("form").submit(function(event){
	    event.preventDefault();
	  });
	$("button").click(function(){
		if(vld.form()){
		var k1=$("#i1").val();var k2=$("#i2").val();
		$.ajax({url:"./pwdr",
			type:"post",
			dataType:"json",
			data:{ok:k1,nk:k2},
			success:function(result){
				if(result)
				alert("密码已修改，下次登录有效。");
				else
					alert("密码错误，未修改。");
				location.reload(true);
		}});
	}});
	
	var vld=$("form").validate({
		rules:{
	    	ipt:"required",
	    	ipt1:"required",
	    	ript1:{ required:true,equalTo: "#i2"},
	    	},
	 messages:{
		 ipt:"输入原密码！",
    	 ipt1:"输入新密码！",
    	 ript1:{required:"重复新密码！",equalTo: "两次输入不一致！"},

	 }
	});
});
</script>
<title>${sessionScope.user.getName()}</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<div class="jumbotron">
				<h2>
					蚁穴库存管理系统
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
			<div class="col-md-4 column"></div>
			<div class="col-md-4 column">
			<h2 align="center">密码修改</h2><br/>
			<p>
			<form role="form">
				<div class="form-group">
					 <label>原密码</label><input type="password" class="form-control" name="ipt" id="i1"/>
				</div>
				<div class="form-group">
					 <label>新密码</label><input type="password" class="form-control" name="ipt1" id="i2"/>
				</div>
				<div class="form-group">
					 <label>重复新密码</label><input type="password" class="form-control" name="ript1"  id="i3"/>
				</div>
				<button type="submit" class="btn btn-default">提交</button>
			</form></p>
			</div><div class="col-md-4 column"></div>
			<div class="col-md-12 column">
		<br/><br/><br/><br/><br/><br/><br/>
		</div>
	</div>
	<jsp:include page="foot.jsp" flush="true"/>
	</div>	
</div>
</body>
</html>