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
	var sp=0;
	$("#nb").on('focus', function(e,m){
		var k=$(".wr").val().toString();
		$.ajax({url:"./stquery",
			type:"get",
			dataType:"json",
			data:{sk:k},
			success:function(result){
				sp=Number(result[0].number)+Number(arr[6]);
			$("#nb").attr("placeholder","修改最大值	："+sp);
		}});
		});

	var vld=$("form").validate({
		rules:{
	    	id:"required",
	    	date:{required: true,date:true},
	    	hid:"required",
			bcd:"required",
			nbr:{required:true,min:1,max:function(){return Number(sp);},},
	    	},
	    	ignore:"#b2",
	 messages:{
		 id:"不能空",
		 date:"日期格式不对",
		 hid:"不能空",
		 bcd:"不能空",
		 nbr:{required:"不能空",min:"不能为0",max:"超出容量",},
	 }
	});

	var arr=[];
	$("#search").click(function(){
		var k=$("#input1").val();
		$.ajax({url:"./ogquery",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
				$("#t1 tbody").empty();
				if(result[0]==null){
					$("#t1 tbody").append("<tr><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td></tr>")
				}
				else
					{
					for(var r in result){
					$("#t1 tbody").append("<tr><td>"+r+"</td><td>"+result[r].id+"</td><td>"+result[r].barcode+"</td><td>"+result[r].name+"</td><td>"+result[r].houseId+"</td><td>"+result[r].proDate+"</td><td>"+result[r].number+"</td><td>"+result[r].dateTime+"</td><td>"+result[r].operatorId+"</td><td>"+result[r].other+"</td></tr>");
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
	    $("input:eq(3)").val(arr[4]);
	    $("input:eq(4)").val(arr[5]);
	    $("input:eq(5)").val(arr[6]);
	    $("input:eq(6)").val(arr[9]);
	    $("input:eq(5)").focus();
	  });
	
	$("#b1").click(function(){
		if(vld.form()){
		var k=decodeURIComponent($("form").serialize());
		$.ajax({url:"./outup",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
			alert(result+"条订单已更改!")
				location.reload(true);
			}
			});
		}
	});
	$("#b2").click(function(){
		if(vld.form()&&(confirm("确定删除订单？"))){
		var k=$("form").serialize();
		$.ajax({url:"./outdel",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
			alert(result+"条订单已删除!")
				location.reload(true);
			}
			});
		}
	});
});
</script>
<title>出库修改</title>
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
			<input type="text" class="form-control" id="input1" placeholder="单号或商品名"/>
		</div>
		<button class="btn btn-default" id="search">搜索</button>
		</div>
		<br/>
			<table class="table table-hover" id="t1">
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
	<form id="mform">
		<table class="table table-hover table-striped" id="t2">
				<tbody>
					<tr>
						<td>
							单号
						</td>
						<td>
							<input class="form-control" type="text" readonly name="id"/>
						</td>
						<td>
							条形码
						</td>
						<td>
							<input class="form-control wr" type="text" readonly name="bcd"/>
						</td>
						</tr>
						<tr>
						<td>
							仓库号
						</td>
						<td>
							<input class="form-control hs" type="text" readonly name="hid"/>
						</td>
						<td>
							生产日期
						</td>
						<td>
							<input class="form-control" type="date" name="date" readonly />
						</td>
						</tr>
						<tr>
						<td>
							数量
						</td>
						<td>
							<input class="form-control" type="number" id="nb" name="nbr" placeholder="">
						</td>
						<td>
							备注
						</td>
						<td>
							<input class="form-control" type="text" name="or" placeholder="退货入库及其它特殊情况">
						</td>
					</tr>
					<tr><td></td><td align="right"><button class="btn" id="b1">修改</button></td><td><button  class="btn" id="b2">删除</button></td><td></td></tr>
				</tbody>
		</table></form>
	</div>		
	</div>	
		<jsp:include page="foot.jsp" flush="true"/>
	</div>	
</div>
</body>
</html>