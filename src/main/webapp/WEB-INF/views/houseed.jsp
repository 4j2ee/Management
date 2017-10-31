<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
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
<!-- Magic suggest -->
<link href="//cdn.bootcss.com/magicsuggest/2.1.4/magicsuggest-min.css" rel="stylesheet">
<script src="//cdn.bootcss.com/magicsuggest/2.1.4/magicsuggest-min.js"></script>
<!-- validation -->
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
	$("form").submit(function(event){
	    event.preventDefault();
	  });

	var vld=$("form").validate({
		rules:{
	    	id:"required",
	    	type:"required",
	    	name:"required",
			capa:{required:true,min:1,},
	    	},
	 messages:{
		 id:"不能空",
		 type:"不能空",
		 name:"不能空",
		 capa:{required:"不能空",min:"不能为0",},
	 }
	});

	var arr=[];
	$("#search").click(function(){
		var k=$("#input1").val();
		$.ajax({url:"./hsQuery",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
				$("#t1 tbody").empty();
				if(result[0]==null){
					$(" #t1 tbody").append("<tr><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td></tr>")
					}
				else
					{
					for(var r in result){
						$("#t1 tbody").append("<tr><td>"+r+"</td><td>"+result[r].id+"</td><td>"+result[r].type+"</td><td>"+result[r].name+
								"</td><td>"+result[r].capacity+"</td><td>"+result[r].other+"</td></tr>");
						}
					}
		}});
	});
	$("#t1").delegate("tr","click",function(){
	    //$("input").val(arr[0]);
	    arr=[];
	    $(this).children().each(function(){
	    	arr.push($(this).text());
	    	});
	    $("input:eq(1)").val(arr[1]);
	    $("input:eq(2)").val(arr[2]); 
	    $("input:eq(3)").val(arr[3]);
	    $("input:eq(4)").val(arr[4]);
	    $("input:eq(5)").val(arr[5]);
	    $("input:eq(6)").val(arr[6]);
	    $("input:eq(5)").focus();
	  });
	
	$("#b1").click(function(){
		if(vld.form()){
		var k=decodeURIComponent($("form").serialize());
		$.ajax({url:"./hsup",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
			alert(result+"个仓库已更改!")
				location.reload(true);
			}
			});
		}
	});
});
</script>
<title>仓库修改</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<jsp:include page="head.jsp" flush="true"/>
	<div class="col-md-12 column">
	<div class="col-md-1 column"></div>
	<div class="col-md-11 column">
		<div class="form-inline">	
		<div class="form-group">
			<input type="text" class="form-control" id="input1" placeholder="编号或名称"/>
		</div>
		<button class="btn btn-default" id="search">搜索</button>
		</div>
		<br/>
			<table class="table table-hover" id="t1">
				<thead>
					<tr>
						<th>
							序号
						</th>
						<th>
							编号
						</th>
						<th>
							类型
						</th>
						<th>
							名称
						</th>
						<th>
						容量
						</th>
						<th>
						备注信息
						</th>
					</tr>
				</thead>
				<tbody>							
				</tbody>
			</table>
	<form id="mform">
		<table class="table table-hover table-striped" id="t2">
				<tbody>
					<tr>
						<td>
							编号
						</td>
						<td>
							<input class="form-control" type="text" readonly name="id"/>
						</td>
						<td>
							类型
						</td>
						<td>
							<input class="form-control wr" type="text"  name="type"/>
						</td>
						</tr>
						<tr>
						<td>
							名称
						</td>
						<td>
							<input class="form-control hs" type="text"  name="name"/>
						</td><td>
							容量
						</td>
						<td>
							<input class="form-control" type="number" id="nb" name="capa" >
						</td>
						</tr>
						<tr>
						<td>
							备注
						</td>
						<td>
							<input class="form-control" type="text" name="or" placeholder="其它信息">
						</td>
					</tr>
					<tr><td></td><td align="right"><button class="btn" id="b1">修改</button></td><td><button type="reset" class="btn" id="b2">重置</button></td><td></td></tr>
				</tbody>
		</table></form>
	</div>		
	</div>	
		<jsp:include page="foot.jsp" flush="true"/>
	</div>	
</div>
</body>
</html>