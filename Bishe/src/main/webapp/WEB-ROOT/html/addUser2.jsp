<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/css/common.css">
<body>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="addModel" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div id="addAlert">
		</div>
		<div class="modal-dialog" style="width: 60%; ">
		<!-- 隐藏的输入框，判断是增加还是修改 -->
		<input type="hidden" id="submitType"  value="POST" >
			<div class="modal-content" style="background: #F5F5F5;">
				<div class="modal-header">
					<button type="button" class="close" id="addAlertSubmit"
						data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">新增员工</h4>
				</div>
				<!-- <form class="form-inline horizontal " role="form"> -->
				<form class="form-horizontal" role="form" id="userForm" >
					<div class="modal-body" style="height: 60%;">
						<div class="col-lg-10 col-md-9 col-sm-9 ">

							<!-- <div class="row"> -->
							<div class="form-group " >
								<label for="name" class=" col-lg-2 control-label" style=" padding-top: 30px;">员工账号</label>
								<div class=" col-lg-4 " style=" padding-top: 25px;">
								 <input
									type="text" class="form-control  col-lg-4 " name="account"
									id="account" placeholder="请输入账号">
								</div>
								<label for="name" class=" col-lg-2 control-label" style=" padding-top: 30px;">员工密码</label>
								<div class=" col-lg-4 " style=" padding-top: 25px;">
								 <input
									type="text" class="form-control  col-lg-4 " name="password"
									id="password" placeholder="请输入密码">
								</div>
								<label for="name" class=" col-lg-2 control-label" style=" padding-top: 30px;">员工姓名</label>
								<div class=" col-lg-4 " style=" padding-top: 25px;">
								 <input
									type="text" class="form-control  col-lg-4 " name="username"
									id="username" placeholder="请输入姓名">
								</div>
								<label for="name" class=" col-lg-2 control-label" style=" padding-top: 30px;">员工权限</label>
								
								<div class=" col-lg-4 " style=" padding-top: 25px;">
								 <select class="form-control " name="authority"
									id="authority" style="font-size: 16px;">
									<option value="0"  data-display="true">员工</option>
									<option value="1">管理员</option>
								<!-- 	id="selectWidth"  -->
								</select>
								</div>
								<label for="name" class=" col-lg-2 control-label" style=" padding-top: 30px;">所属部门</label>
								<div class=" col-lg-4 " style=" padding-top: 25px;">
								 <select class="form-control " name="depNumber"
									id="departments" style="font-size: 16px;">
									<!-- <option value="-"  data-display="true">员工</option>
									<option value="1">管理员</option> -->
								</select>
								</div>
							</div>
							
							
							<!-- 	</div> -->
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success btn-sm " id="resetting">
							<span class="glyphicon glyphicon-user"></span> 重置
						</button>
					<!-- 	<button type="button" class="btn btn-info btn-sm " id=addSubmit
							data-dismiss="modal" style="margin-left: 15px; margin-right: 5%;">
							<span class="glyphicon glyphicon-user"></span> 新增员工
						</button> -->
						<button type="button" class="btn btn-info btn-sm " id="addSubmit"
							 style="margin-left: 15px; margin-right: 5%;">
							<span class="glyphicon glyphicon-user"></span> 确定
						</button>
					</div>

				</form>






			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/jquery-min.js"></script>
	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	$("#resetting").click(function(){
		
	});
		
	$("#addSubmit").click(function(){
		/* var getFormData=function(form){ 
			var o={}; 
			$.each(form.serializeArray(),function(index){ 
			if(o[this['name']]){ 
			o[this['name']] = o[this['name']]+","+this['value']; 
			}else{ 
			o[this['name']] = this['value']; 
			} 
			}); 
			return o; 
			}  */
		
		 $( "#addAlert" ).load( "WEB-ROOT/common/alert.jsp", function( response, status, xhr ) {
     		$('#addAlert').html(response);
    	 });
	 	var user = getFormData($("#userForm"));  
		  $.ajax({
	        type : $("#submitType").val(),  //请求方式
	        url : "${pageContext.request.contextPath}/register",  //请求路径
	        data: user, 
	        async: true,
	        dataType:"json",   
	        //contentType:"application/json;charset=utf-8",
	        success : function(msg) {  //异步请求成功执行的回调函数
	        	$("#alertText").text(msg);
	        	$("#alertModel").modal({
	     	        keyboard: true
	     	    }); 
	     	 //  selectList("true"); 
	        },//ajax引擎一般用不到；状态信息；抛出的异常信息
	        error : function(msg) {
	        	//alert("失败");
	        	$("#alertText").text("添加失败");
	        	$("#alertModel").modal({
	     	        keyboard: true
	     	    });  
	        }
	    });
		
	}); 
	
	
	
	</script>


</body>