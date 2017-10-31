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
<!-- validation -->
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
	$("form").submit(function(event){
	    event.preventDefault();
	  });
	
	$("#b1").click(function(){
		var k=$("#input1").val();
		$.ajax({url:"./usrquery",
			type:"post",
			data:{sk:k},
			success:function(result){
				$("#t1 tbody").empty();
				if(result[0]==null){
					$("#t1 tbody").append("<tr><td>没有记录</td><td>没有记录</td><td>没有记录</td></tr>")
				}
				else
					{
					for(var r in result)
					$("#t1 tbody").append("<tr><td>"+r+"</td><td>"+result[r].id+"</td><td>"+result[r].name+"</td><td>"+result[r].role+"</td></tr>");
					}
		}});
	});
	
	$("#b2").click(function(){
		if(vld.form()){
			var k=decodeURIComponent($("#subform").serialize());
		$.ajax({url:"./usradd",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
				if(result=='1')
				alert("用户添加成功！");
				else
					alert("添加失败，检查信息后重试！");
				location.reload(true);
		}});}
	});
	
	$("#b3").click(function(){
		var k=$("#input3").val();
		$.ajax({url:"./usrquery",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
				$("#t3 tbody").empty();
				if(result[0]==null){
					$("#t3 tbody").append("<tr><td>没有记录</td><td>没有记录</td><td>没有记录</td><td>没有记录</td></tr>")
				}
				else
					{
					for(var r in result)
					$("#t3 tbody").append("<tr><td>"+r+"</td><td>"+result[r].id+"</td><td>"+result[r].name+"</td><td>"+result[r].role+"</td></tr>");
					}
		}});
	});
	
	$("#t3").delegate("tr","click",function(){
	    //$("input").val(arr[0]);
	    arr=[];
	    $(this).children().each(function(){
	    	arr.push($(this).text());
	    	});
	    $("input:eq(5)").val(arr[1]);
	    $("input:eq(6)").val(arr[2]); 
	    $("select:eq(1)").val(arr[3]);
	  });
	$("#esub").click(function(){
		if(evld.form()){
			var k=decodeURIComponent($("#edform").serialize());
		$.ajax({url:"./usred",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
				if(result=='1')
				alert("修改成功！");
				else
					alert("修改失败，检查信息后重试！");
				location.reload(true);
		}});}
	});
	
	$("#del").click(function(){
		if(evld.form()&&confirm("确定删除用户？")){
			var k=decodeURIComponent($("#edform").serialize());
		$.ajax({url:"./usrdel",
			type:"post",
			dataType:"json",
			data:{sk:k},
			success:function(result){
				if(result=='1')
				alert("删除成功！");
				else
					alert("删除失败，检查信息后重试！");
				location.reload(true);
		}});}
	});
	var vld=$("#subform").validate({
		rules:{
	    	nid:{range:[100000,999999],required:true,digits:true,},
	    	npwd:"required",
	    	nname:"required",
			nrole:{required:true},
	    	},
	 messages:{
		 nid:{range:"账号为六位数",required:"不能空",digits:"请输入整数",},
		 npwd:"不能空",
		 nname:"不能空",
		 nrole:{required:"不能空"},
	 }
	});
	var evld=$("#edform").validate({
		rules:{
	    	nid:{range:[100000,999999],required:true,digits:true,},
	    	nname:"required",
			nrole:{required:true},
	    	},
	 messages:{
		 nid:{range:"账号为六位数",required:"不能空",digits:"请输入整数",},
		 nname:"不能空",
		 nrole:{required:"不能空"},
	 }
	});
});
</script>
<title>用户管理</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<jsp:include page="head.jsp" flush="true"/>
			<div class="col-md-12 column">
			<div class="tabbable" id="tabs-147286">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-1" data-toggle="tab">查询用户</a>
					</li>
					<li>
						 <a href="#panel-2" data-toggle="tab">添加用户</a>
					</li>
					<li>
						 <a href="#panel-3" data-toggle="tab">修改用户信息</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-1">
					<br/>
					<form role="form" class="form-inline" >	
					<div class="form-group">
						<input type="text" class="form-control" id="input1" placeholder="用户名或账号"/>
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
									账号
								</th>
								<th>
									用户名
								</th>
								<th>
									用户类型
								</th>
							</tr>
						</thead>
						<tbody>							
						</tbody>
					</table>
					</div>
					<div class="tab-pane" id="panel-2">
					<br/>
					<form class="form-inline" id="subform">
					<table class="table table-hover table-striped"><tr>
					<td align="right">
					 <label>账号</label></td><td>
					 <input type="text" class="form-control" name="nid" />
					</td><td align="right">
					 <label>用户名</label></td><td>
					 <input type="text" class="form-control" name="nname" />
					</td></tr><tr><td align="right">
					 <label>密码</label></td><td>
					 <input type="password" class="form-control" name="npwd" />
					</td><td align="right">
					 <label>用户类型</label></td><td>
					 <select  class="form-control" name="nrole" >
					 <option value="普通用户">普通用户</option>
					 <option value="管理员">管理员</option>
					 </select>
					</td></tr><tr><td></td><td align="right">
					<button type="submit" class="btn btn-default" id="b2">提交</button></td><td>
					<button type="reset" class="btn btn-default">重置</button></td></tr>
					</table>
					</form>
					</div>
					<div class="tab-pane" id="panel-3">
					<br/>
					<form role="form" class="form-inline">
					<div class="form-group">
						<input type="text" class="form-control" id="input3" placeholder="用户名或账号"/>
					</div>
					<button type="submit" class="btn btn-default" id="b3">搜索</button>
					</form>
					<br/>
					<table class="table table-hover" id="t3">
						<thead>
							<tr>
								<th>
									序号
								</th>
								<th>
									账号
								</th>
								<th>
									用户名
								</th>
								<th>
									用户类型
								</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<form class="form-inline" id="edform">
					<table class="table table-hover table-striped" id="et"><tr>
					<td align="right">
					 <label>账号</label></td><td>
					 <input type="text" class="form-control" name="nid" readonly />
					</td><td align="right">
					 <label>用户名</label></td><td>
					 <input type="text" class="form-control" name="nname" />
					</td></tr><tr><td align="right">
					 <label>密码</label></td><td>
					 <input type="password" class="form-control" name="npwd" />
					</td><td align="right">
					 <label>用户类型</label></td><td>
					 <select  class="form-control" name="nrole" >
					 <option value="普通用户">普通用户</option>
					 <option value="管理员">管理员</option>
					 </select>
					</td></tr><tr><td></td><td align="right">
					<button type="submit" class="btn btn-default" id="esub">提交</button></td><td>
					<button type="reset" class="btn btn-default">重置</button><span>&nbsp;&nbsp;</span>
					<button class="btn btn-default" id="del">删除</button></td></tr>
					</table>
					</form>
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