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
</style>
<script>
$(document).ready(function(){
	$("form").submit(function(event){
	    event.preventDefault();
	  });
	
var vld=$("form").validate({
	 rules:{
	    	name:"required",
	    	bar:{required: true,},
	    	bra:"required",
			dat:{required:true,min:7,},
	    	},
	 messages:{
		 	name:"不能空",
	    	bar:{required: true,},
	    	bra:"required",
			dat:{required:"不能为空",min:"保质期太短不能入库",},
	 }
	});
	
	$("#b1").click(function(){
		if(vld.form()){
			var k=decodeURIComponent($("form").serialize());
			$.ajax({url:"./warein",
				type:"post",
				dataType:"json",
				data:{sk:k},
				success:function(result){
					if(result==1){
						alert(result+"种商品已添加!")
						location.reload(true);
						}
					else
						alert("信息有误，查证后重试！");
				}
				}); 
			}
	});
});
</script>
<title>商品新增</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<jsp:include page="head.jsp" flush="true"/>
	<div class="col-md-12 column">
	<div class="col-md-1 column"></div>
	<div class="col-md-10 column">
	<div class="tab-content">
			<br/><form>
				<table class="table table-hover" id="t1">
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
						<input class="form-control hs" type="text" name="bar"/>
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