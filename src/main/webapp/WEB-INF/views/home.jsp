<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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
<style>
.list>h3{
color:#33CC66;
}
a:hover{text-decoration:none}
</style>
<script>
$(document).ready(
	function(){
	$(".btn-link").click(function(){
		$(".list").hide();$("#srch").empty();
		var id=$(this).attr("id")-1;
		$(".list:eq("+id+")").show();
		});
	
	$("#search").click(function(){
		var sk=$("#ink").val().trim();
		var app=$("#srch");app.empty();
		map.forEach(function(i){
			if(i[0].match(new RegExp(sk))!=null){
				$(".list").hide();
				app.append("<div class='col-md-4 column'><a href='"+i[1]+"'><div class='well'><h3>"+i[0]+"</h3></div></a></div>");
			}
		});
	});
	var m=$(".badge").text();if(m=="0"){$(".msg").hide()}
	$("form").submit(function(event){
	    event.preventDefault();
	  });
	var umg='${sessionScope.user.getRole()}';
	if(umg!="管理员"){$(".umg").remove()}
});
var map=[];
function ld(){
	$(".col-md-4").each(function(){
	var k=$(this).children().children().children("h3").text();
	var v=$(this).children("a").attr("href");
	var dic=[k,v];
	map.push(dic);
});}
</script>
<title>欢迎</title>
</head>
<body onload="ld()">
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<div class="jumbotron">
				<h2>
					蚁穴库存管理系统
					<small>让你的管理高效又简单</small>
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
					<form class="navbar-form navbar-left" >
						<div class="form-group">
							<input type="text" class="form-control" placeholder="搜索操作" id="ink"/>
						</div> <button  class="btn btn-default" id="search">搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
					<li><a href="pwchg"style="color:#CC0000;font-size:1.2em;">当前管理员：
					${sessionScope.user.getName()}
					</a>
						</li><li class="umg"><a href="usermng">管理用户</a></li>
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
		<div class="col-md-2 column" >
		<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						全部功能
					</h3>
				</div>
				<div class="panel-body">
					<span class="btn btn-link" id="1">出入库管理</span>
				</div>
				<div class="panel-footer">
					<span class="btn btn-link" id="2">仓库信息管理</span>
				</div>
				<div class="panel-body">
					<span class="btn btn-link" id="3">商品信息管理</span>
				</div>
				<div class="panel-footer">
					<span class="btn btn-link" id="4">报表管理</span>
				</div>
			</div>
		</div>
		<div class="col-md-10 column">
		<div class="list">
		<h3>入库\出库</h3>
		<div class="row clearfix">
				<div class="col-md-4 column">
				<a href="income">
				<div class="well">
				<h3>商品入库</h3>
				<p>采购入库、退货入库</p>
				</div>
				</a>
				</div>
				<div class="col-md-4 column">
				<a href="outgo">
				<div class="well">
				<h3>商品出库</h3>
				<p>配送出库、报损出库</p>
				</div></a>
				</div>
				<div class="col-md-4 column">
				<a href="wquery">
				<div class="well">
				<h3>库存查询</h3>
				<p>商品库存量、仓库闲仓量</p>
				</div>
				</a>
				</div>
				<div class="col-md-4 column">
				<a href="inedit">
				<div class="well">
				<h3>入库单修改</h3>
				<p>修改入库单信息</p>
				</div></a>
				</div>
				<div class="col-md-4 column">
				<a href="outedit">
				<div class="well">
				<h3>出库单修改</h3>
				<p>修改出库单信息</p>
				</div></a>
				</div>
			</div>
		</div>
		
		<div class="list">
		<h3>仓库信息</h3>
		<div class="row clearfix">
				<div class="col-md-4 column"><a href="house">
				<div class="well">
				<h3>仓库信息查询</h3>
				<p>查询仓库编号、名称、类型等信息</p>
				</div></a>
				</div>
				<div class="col-md-4 column"><a href="houseadd">
				<div class="well">
				<h3>仓库新增</h3>
				<p>添加新的仓库</p>
				</div></a>
				</div>
				<div class="col-md-4 column"><a href="houseed">
				<div class="well">
				<h3>仓库信息修改</h3>
				<p>修改仓库名称、类型等信息</p>
				</div></a>
				</div>
			</div>
		</div>
		
		<div class="list">
		<h3>商品信息</h3>
		<div class="row clearfix">
				<div class="col-md-4 column">
				<a href="wareq">
				<div class="well">
				<h3>商品信息查询</h3>
				<p>查询商品的基本信息</p>
				</div></a>
				</div>
				<div class="col-md-4 column"><a href="wareadd">
				<div class="well">
				<h3>商品新增</h3>
				<p>添加新的商品信息</p>
				</div></a>
				</div>
				<div class="col-md-4 column"><a href="wareed">
				<div class="well">
				<h3>商品信息修改</h3>
				<p>修改商品基本信息</p>
				</div></a>
				</div>
			</div>
		</div>
		
		<div class="list">
		<h3>报表</h3>
		<div class="row clearfix">
				<div class="col-md-4 column"><a href="inreport">
				<div class="well">
				<h3>入库报表</h3>
				<p>入库信息统计报表</p>
				</div></a>
				</div>
				<div class="col-md-4 column"><a href="outreport">
				<div class="well">
				<h3>出库报表</h3>
				<p>出库统计报表</p>
				</div></a>
				</div>
				<div class="col-md-4 column"><a href="otreport">
				<div class="well">
				<h3>特殊报表</h3>
				<p>报损、过期、退货的特殊情况报表</p>
				</div></a>
				</div>
			</div>
		</div>
		<div id="srch">
		</div>
		</div><jsp:include page="foot.jsp" flush="true"/>
	</div><div style="height:80px;"></div>
	
</div>
</body>
</html>