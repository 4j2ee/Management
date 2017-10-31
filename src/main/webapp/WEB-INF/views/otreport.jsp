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
	$("button").click(function(){
		if(vld.form()){
		var k=decodeURIComponent($("form").serialize());
		$.ajax({url:"./othrpt",
			type:"post",
			data:{sk:k},
			success:function(result){
				$("tbody").empty();
				if(result[0]==null){
					$("tbody").append("<tr><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td></tr>")
				}
				else
					{
					for(var r in result)
					$("tbody").append("<tr><td>"+r+"</td><td>"+result[r].name+"</td><td>"+result[r].barcode+"</td><td>"+result[r].brand+
							"</td><td>"+result[r].number+"</td><td>"+result[r].times+"</td><td>"+result[r].rtimes+"</td></tr>");
					}
		}});}
	});
	
	var vld=$("form").validate({
		rules:{
	    	begin:{date:true,required:true,},
	    	end:{date:true,required:true,},
	    	},
	 messages:{
		 begin:{date:"日期格式不对",required:"不能空",},
		 end:{date:"日期格式不对",required:"不能空",},
	 }
	});
	//导出xls
	$("#Export").click(function(e) {
	    e.preventDefault();
	    var data_type = 'data:application/vnd.ms-excel';
	    var table_div =document.getElementById('tw');;
	    var table_html = table_div.outerHTML.replace(/ /g, '%20');
	    var a = document.createElement('a');
	    a.href = data_type + ', ' + table_html;
	    a.download = '特殊报表' + Math.floor((Math.random() * 9999999) + 1000000) + '.xls';
	    a.click();
	  });
	
});
</script>
<title>特殊报表</title>
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
				<label >从</label>
				<input type="date" class="form-control" id="input1" name="begin"/>
			</div>
			<div class="form-group">
				<label >至</label>
				<input type="date" class="form-control" id="input2" name="end"/>
			</div>
			<div class="form-group">
				<select class="form-control"  name="se">
				<option  value="1">特殊入库</option>
				<option  value="2">特殊出库</option>
				</select>
			</div>
			<button class="btn btn-default" id="b1">搜索</button>
			<button class="btn btn-default" id="Export">导出报表</button>
			</form>
			<br/>
				<div id="tw"><table class="table table-hover" id="t1">
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
						出库量
						</th>
						<th>
						出库次数
						</th>
						<th>
						特殊原因
						</th>
					</tr>
				</thead>
				<tbody>							
				</tbody>
			</table></div>
		</div>
	</div>
	<div class="col-md-1 column"></div>		
	</div>	
		<jsp:include page="foot.jsp" flush="true"/>
	</div>	
</div>
</body>
</html>