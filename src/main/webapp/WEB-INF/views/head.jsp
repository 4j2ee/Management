<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
$(document).ready(
		function(){
		var m=$(".badge").text();if(m=="0"){
			$(".msg").hide()}
		var umg='${sessionScope.user.getRole()}';
			if(umg!="管理员"){$(".umg").remove()}
		});
</script>
<div class="col-md-12 column">
		<div class="jumbotron">
				<h2 class="text-center">
					蚁穴库存管理系统
				</h2>
			</div>
			<nav class="navbar navbar-default" role="navigation" >
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span>
					 <span class="icon-bar"></span><span class="icon-bar"></span>
					 </button>
					 <a class="navbar-brand" href=".">首页</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
					<li><a href="pwchg" style="color:#CC0000;font-size:1.2em;">当前管理员：
					${sessionScope.user.getName()}
					</a>
						</li>
						<li class="umg"><a href="usermng">管理用户</a></li>
						<li class="msg">
							 <a href="mesag">通知信息<span class="badge" style="background-color:red;">${fn:length(sessionScope.msg)}</span></a>
						</li>
						<li>
							 <a href="logout">退出系统</a>
						</li>
					</ul>
				</div>
			</nav>
			</div>