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
	    	id:{range:[100000,999999],required:true,digits:true,},
	    	type:"required",
	    	name:"required",
			capa:{required:true,min:1,digits:true,},
	    	},
	 messages:{
		 id:{range:"编号为六位数",required:"不能空",digits:"请输入整数",},
		 type:"不能空",
		 name:"不能空",
		 capa:{required:"不能空",min:"不能为0",digits:"请输入整数"},
	 }
	});

	
	$("#b1").click(function(){
		if(vld.form()){
		var k=decodeURIComponent($("form").serialize());
		$.ajax({url:"./hsin",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
				if(result==1){
					alert(result+"个仓库已添加!");
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
<title>新增仓库</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<jsp:include page="head.jsp" flush="true"/>
	<div class="col-md-12 column">
	<div class="col-md-1 column"></div>
	<div class="col-md-11 column">
	<form id="mform">
		<table class="table table-hover table-striped" id="t2">
				<tbody>
					<tr>
						<td>
							编号
						</td>
						<td>
							<input class="form-control" type="text"  name="id"/>
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
					<tr><td></td><td align="right"><button class="btn" id="b1">提交</button></td><td><button type="reset" class="btn" id="b2">重置</button></td><td></td></tr>
				</tbody>
		</table></form>
	</div>		
	</div>
		<jsp:include page="foot.jsp" flush="true"/>
	</div>	
</div>
</body>
</html>