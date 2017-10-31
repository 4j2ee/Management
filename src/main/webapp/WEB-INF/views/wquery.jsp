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
<script>
$(document).ready(function(){
	$("#b1").click(function(){
		var k=$("#input1").val();
		$.ajax({url:"./stquery",
			type:"get",
			data:{sk:k},
			success:function(result){
				$("#t1 tbody").empty();
				if(result[0]==null){
					$("#t1 tbody").append("<tr><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td></tr>")
				}
				else
					{
					for(var r in result)
					$("#t1 tbody").append("<tr><td>"+r+"</td><td>"+result[r].name+"</td><td>"+result[r].barcode+"</td><td>"+result[r].houseId+"</td><td>"+result[r].number+"</td></tr>");
					}
		}});
	});
	
	$("#b2").click(function(){
		var k=$("#input2").val();
		$.ajax({url:"./spquery",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
				$("#t2 tbody").empty();
				if(result[0]==null){
					$("#t2 tbody").append("<tr><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td></tr>")
				}
				else
					{
					for(var r in result)
					$("#t2 tbody").append("<tr><td>"+r+"</td><td>"+result[r].id+"</td><td>"+result[r].name+"</td><td>"+result[r].spare+"</td></tr>");
					}
		}});
	});
	
	$("#b3").click(function(){
		var k=$("#input3").val();
		$.ajax({url:"./imquery",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
				$("#t3 tbody").empty();
				if(result[0]==null){
					$("#t3 tbody").append("<tr><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td></tr>")
				}
				else
					{
					for(var r in result)
					$("#t3 tbody").append("<tr><td>"+r+"</td><td>"+result[r].id+"</td><td>"+result[r].barcode+"</td><td>"+result[r].name+"</td><td>"+result[r].houseId+"</td><td>"+result[r].proDate+"</td><td>"+result[r].number+"</td><td>"+result[r].dateTime+"</td><td>"+result[r].operatorId+"</td><td>"+result[r].other+"</td></tr>");
					}
		}});
	});
	
	$("#b4").click(function(){
		var k=$("#input4").val();
		$.ajax({url:"./ogquery",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
				$("#t4 tbody").empty();
				if(result[0]==null){
					$("#t4 tbody").append("<tr><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td></tr>")
				}
				else
					{
					for(var r in result)
					$("#t4 tbody").append("<tr><td>"+r+"</td><td>"+result[r].id+"</td><td>"+result[r].barcode+"</td><td>"+result[r].name+"</td><td>"+result[r].houseId+"</td><td>"+result[r].proDate+"</td><td>"+result[r].number+"</td><td>"+result[r].dateTime+"</td><td>"+result[r].operatorId+"</td><td>"+result[r].other+"</td></tr>");
					}
		}});
	});
	$("form").submit(function(event){
	    event.preventDefault();
	  });
});
</script>
<title>查询</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<jsp:include page="head.jsp" flush="true"/>
			<div class="col-md-12 column">
			<div class="tabbable" id="tabs-147286">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-1" data-toggle="tab">库存查询</a>
					</li>
					<li>
						 <a href="#panel-2" data-toggle="tab">可存查询</a>
					</li>
					<li>
						 <a href="#panel-3" data-toggle="tab">入库记录查询</a>
					</li>
					<li>
						 <a href="#panel-4" data-toggle="tab">出库记录查询</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-1">
					<br/>
					<form role="form" class="form-inline" >	
					<div class="form-group">
						<input type="text" class="form-control" id="input1" placeholder="条形码或商品名"/>
					</div>
					<button class="btn btn-default" id="b1">搜索</button>
					</form>
					<br/>
						<table class="table table-hover" id="t1">
						<thead>
							<tr>
								<th>
									序号
								</th>
								<th>
									商品名
								</th>
								<th>
									条形码
								</th>
								<th>
									所在仓
								</th>
								<th>
									库存量
								</th>
							</tr>
						</thead>
						<tbody>							
						</tbody>
					</table>
					</div>
					<div class="tab-pane" id="panel-2">
					<br/>
					<form role="form" class="form-inline">
					<div class="form-group">
						<input type="text" class="form-control" id="input2" placeholder="仓库名"/>
					</div>
					<button type="submit" class="btn btn-default" id="b2">搜索</button>
					</form>
					<br/>
						<table class="table table-hover" id="t2">
						<thead>
							<tr>
								<th>
									序号
								</th>
								<th>
									仓库号
								</th>
								<th>
									仓库名称
								</th>
								<th>
									可存量
								</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					</div>
					<div class="tab-pane" id="panel-3">
					<br/>
					<form role="form" class="form-inline">
					<div class="form-group">
						<input type="text" class="form-control" id="input3" placeholder="入库单"/>
					</div>
					<button type="submit" class="btn btn-default" id="b3">搜索</button>
					</form>
					<br/>
					<table class="table table-hover" id="t3">
						<thead>
							<tr><th>
									序号
								</th>
								<th>
									单号
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
									生产日期
								</th>
								<th>
									数量
								</th>
								<th>
									时间
								</th>
								<th>
									操作员
								</th>
								<th>
									备注
								</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					</div>
					<div class="tab-pane" id="panel-4">
					<br/>
					<form role="form" class="form-inline">
					<div class="form-group">
						<input type="text" class="form-control" id="input4" placeholder="出库单"/>
					</div>
					<button type="submit" class="btn btn-default" id="b4">搜索</button>
					</form>
					<br/>
					<table class="table table-hover" id="t4">
						<thead>
							<tr><th>
									序号
								</th>
								<th>
									单号
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
									生产日期
								</th>
								<th>
									数量
								</th>
								<th>
									时间
								</th>
								<th>
									操作员
								</th>
								<th>
									备注
								</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					</div>
				</div>
			</div>
			<div class="col-md-12 column">
		<br/><br/><br/><br/><br/><br/><br/>
		</div>
	</div>
	<jsp:include page="foot.jsp" flush="true"/>
	</div>	
</div>
</body>
</html>