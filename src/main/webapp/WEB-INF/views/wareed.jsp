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
	$("#search").click(function(){
		var k=$("#input1").val();
		$.ajax({url:"./wareQuery",
			type:"post",
			data:{sk:k},
			success:function(result){
				$("#t1 tbody").empty();
				if(result[0]==null){
					$("#t1 tbody").append("<tr><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td></tr>")
				}
				else
					{
					for(var r in result)
					$("#t1 tbody").append("<tr><td>"+r+"</td><td>"+result[r].name+"</td><td>"+result[r].barcode+"</td><td>"+result[r].brand+
							"</td><td>"+result[r].unspsc+"</td><td>"+result[r].spec+"</td><td>"+result[r].life+"</td><td>"+result[r].other+"</td></tr>");
					}
		}});
	});
	
var vld=$("#mform").validate({
	 rules:{
	    	name:"required",
	    	bar:{required: true,},
	    	bra:"required",
			dat:{required:true,min:7,digits:true,},
	    	},
	 messages:{
		 	name:"不能空",
	    	bar:{required: true,},
	    	bra:"required",
			dat:{required:"不能为空",min:"保质期太短或不是整数",digits:"天数为整数",},
	 }
	});
	
	$("#b1").click(function(){
		if(vld.form()){
			var k=decodeURIComponent($("form").serialize());
			$.ajax({url:"./wareup",
				type:"post",
				dataType:"json",
				data:{sk:k},
				success:function(result){
				alert(result+"种商品已修改!")
					location.reload(true);
				}
				}); 
			}
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
	    $("input:eq(5)").val(arr[6]);
	    $("input:eq(7)").val(arr[5]);
	  });
});
</script>
<title>商品修改</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<jsp:include page="head.jsp" flush="true"/>
	<div class="col-md-12 column">
	<div class="col-md-1 column"></div>
	<div class="col-md-10 column">
	<div class="tab-content">
			<br/>
			<form role="form" class="form-inline" >	
			<div class="form-group">
				<input type="text" class="form-control" id="input1" placeholder="条形码或商品名"/>
			</div>
			<button class="btn btn-default" id="search">搜索</button>
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
							品牌
						</th>
						<th>
						分类码
						</th>
						<th>
						规格
						</th>
						<th>
						保质期（天）
						</th>
						<th>
						备注信息
						</th>
					</tr>
				</thead>
				<tbody>							
				</tbody>
			</table>
		</div><div class="tab-content">
			<form id="mform">
				<table class="table table-hover" >
				<tbody>	
				<tr>
					<td>
						商品名
					</td>
					<td>
						<input class="form-control hs" type="text" name="name"/>
					</td>
					<td>
						条形码
					</td>
					<td>
						<input class="form-control hs" type="text" name="bar" readonly />
					</td>
					</tr>
					<tr>
					<td>
						品牌
					</td>
					<td>
						<input class="form-control hs" type="text" name="bra"/>
					</td>
					<td>
					分类码
					</td>
					<td>
						<input class="form-control hs" type="text" name="upc"/>
					</td>
					</tr>
					<tr>
					<td>
					保质期（天）
					</td>
					<td>
						<input class="form-control hs" type="text" name="dat"/>
					</td>
					<td>
					备注信息
					</td>
					<td>
						<input class="form-control hs" type="text" name="or"/>
					</td>
					</tr>
					<tr><td>
					规格
					</td>
					<td>
						<input class="form-control hs" type="text" name="sp"/>
					</td>
					<td></td><td></td>
					</tr>
					<tr><td></td>
					<td align="right"><button class="btn" id="b1">提交</button></td><td><button type="reset" class="btn">重置</button></td>
					<td></td></tr>					
				</tbody>
			</table></form>
		</div>
	</div>
	<div class="col-md-1 column"></div>		
	</div>	
		<jsp:include page="foot.jsp" flush="true"/>
	</div>	
</div>
</body>
</html>