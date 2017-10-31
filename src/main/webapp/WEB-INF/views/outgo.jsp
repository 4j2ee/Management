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
	
	var sp=[{"number":0,"houseId":null}];
	var wr=$('.wr').magicSuggest({
		placeholder:"商品条形码",
		name:"bcd",
		allowFreeEntries:false,
		method:"get",
		queryParam: 'sk',
        data:"./stquery",
        displayField:"barcode",
        maxSelection: 1,
        maxSelectionRenderer:function(){return "一次只能出库一种商品"},
        valueField:'barcode',
        renderer: function(data){
        	return data.barcode;
        },
		selectionRenderer: function(data){
    	return data.barcode;
    },
    resultAsString: true
	});
	var hs=$('.hs').magicSuggest({
		placeholder:"仓库编号",
		name:'hid',
		queryParam: 'sk',
        data:function(){return sp;},
        allowFreeEntries:false,
        displayField:"houseId",
        maxSelection:1,
        maxSelectionRenderer:function(){return "只能选一个仓库"},
        valueField: 'houseId',
        renderer: function(data){
        	return data.houseId;
        },
		selectionRenderer: function(data){
    	return  data.houseId;
    },
    resultAsString: true
	});
	$(wr).on('selectionchange', function(e,m){
		var k=this.getValue().toString();
		$.ajax({url:"./stquery",
			type:"get",
			dataType:"json",
			data:{sk:k},
			success:function(result){
					sp=result;
			$("#nb").attr("placeholder","库存量："+sp[0].number);
		}});
		
		});
	var vld=$("form").validate({
	 rules:{
	    	id:"required",
	    	date:{required: true,date:true},
			nbr:{required:true,min:1,max:function(){return Number(sp[0].number);},},
	    	},
	 messages:{
		 id:"不能空",
		 date:"日期格式不对",
		 nbr:{required:"不能空",min:"不能为0",max:"超出库存量",},
	 }
	});
	
	$("#b1").click(function(){
		var n=$("#nb").val();
		if(vld.form()){
			if(hs.getValue()==""){
				alert("请选择仓库！");
				return;
			}
			else if(wr.getValue()==""){
				alert("请选择条形码！");
				return;
			}
			else{
				var k=decodeURIComponent($("form").serialize());
				$.ajax({url:"./outin",
					type:"post",
					dataType:"json",
					data:{sk:k},
					success:function(result){
						if(result==1){
							alert(result+"种商品已出库!")
							location.reload(true);
							}
						else
							alert("信息有误，查证后重试！");
					}
					}); 
			}
		}
	});
});
</script>
<title>出库</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<jsp:include page="head.jsp" flush="true"/>
	<div class="col-md-12 column">
	<div class="col-md-1 column"></div>
	<div class="col-md-10 column"><form>
		<table class="table table-hover table-striped">
				<tbody>
					<tr>
						<td>
							批次号
						</td>
						<td>
							<input class="form-control" type="text" placeholder="批次号用于生成单号" name="id"/>
						</td>
						<td>
							条形码
						</td>
						<td>
							<input class="form-control wr" type="text"/>
						</td>
						</tr>
						<tr>
						<td>
							仓库号
						</td>
						<td>
							<input class="form-control hs" type="text"/>
						</td>
						<td>
							生产日期
						</td>
						<td>
							<input class="form-control" type="date" name="date"/>
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
							<input class="form-control" type="text" name="or" placeholder="过期\报损出库及其它特殊情况">
						</td>
					</tr>
					<tr><td></td><td align="right"><button class="btn" id="b1">提交</button></td><td><button type="reset" class="btn" >重置</button></td><td></td></tr>
				</tbody>
		</table></form>
	</div>
	<div class="col-md-1 column"></div>		
	</div>	
		<jsp:include page="foot.jsp" flush="true"/>
	</div>	
</div>
</body>
</html>