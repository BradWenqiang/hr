<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="addModel" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">

		<div class="modal-dialog" style="width: 60%;">
			<div id="addAlert"></div>
			<!-- 隐藏的输入框，判断是增加还是修改 -->
			<input type="hidden" id="submitType" value="POST">
			<div class="modal-content" style="background: #F5F5F5;">
				<div class="modal-header">
					<button type="button" class="close" id="addAlertSubmit"
						data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">新增员工</h4>
				</div>
				<!-- <form class="form-inline horizontal " role="form"> -->
				<form class="form-horizontal" role="form" id="userForm">
					<div class="modal-body" style="height: 60%;">
						<div class="col-lg-10 col-md-9 col-sm-9 ">

							<!-- <div class="row"> -->
							<div class="form-group ">
								<label for="name" class=" col-lg-2 control-label"
									style="padding-top: 30px;">员工账号</label>
								<div class=" col-lg-4 " style="padding-top: 25px;">
									<input type="text" class="form-control  col-lg-4 "
										name="account" id="account" placeholder="请输入账号">
								</div>
								<label for="name" class=" col-lg-2 control-label"
									style="padding-top: 30px;">员工密码</label>
								<div class=" col-lg-4 " style="padding-top: 25px;">
									<input type="text" class="form-control  col-lg-4 "
										name="password" id="password" placeholder="请输入密码">
								</div>
								<label for="name" class=" col-lg-2 control-label"
									style="padding-top: 30px;">员工姓名</label>
								<div class=" col-lg-4 " style="padding-top: 25px;">
									<input type="text" class="form-control  col-lg-4 "
										name="username" id="username" placeholder="请输入姓名">
								</div>
								 <sec:authorize access="hasRole('ROLE_ADMIN')">
								<label for="name" class=" col-lg-2 control-label"
									style="padding-top: 30px;">员工权限</label>

								<div class=" col-lg-4 " style="padding-top: 25px;">
									<select class="form-control " name="authority" id="authority"
										style="font-size: 16px;">
										<option value="0" data-display="true">员工</option>
										<option value="1">管理员</option>
										<!-- 	id="selectWidth"  -->
									</select>
								</div>
								 </sec:authorize>
								<label for="name" class=" col-lg-2 control-label"
									style="padding-top: 30px;">所属部门</label>
								<div class=" col-lg-4 " style="padding-top: 25px;">
									<select class="form-control " name="depNumber" id="departments"
										style="font-size: 16px;">
										<!-- <option value="-"  data-display="true">员工</option>
									<option value="1">管理员</option> -->
									</select>
								</div>
							</div>


							<!-- 	</div> -->
						</div>

					</div>
					<div class="modal-footer">
						
						<!-- 	<button type="button" class="btn btn-info btn-sm " id=addSubmit
							data-dismiss="modal" style="margin-left: 15px; margin-right: 5%;">
							<span class="glyphicon glyphicon-user"></span> 新增员工
						</button> -->
						<button type="submit" class="btn btn-info btn-sm " id="addSubmit"
							name="submit" style="margin-left: 15px; margin-right: 5%;">
							<span class="glyphicon glyphicon-user"></span> 确定
						</button>
					</div>

				</form>






			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	<script type="text/javascript">
		$("#resetting").click(function() {

		});

		/* $("#addSubmit").click(function(){
			
			
		 	var user = getFormData($("#userForm"));  
			  $.ajax({
		        type : $("#submitType").val(),  //请求方式
		        url : "${pageContext.request.contextPath}/register",  //请求路径
		        data: user, 
		        async: false,
		        dataType:"json",   
		        //contentType:"application/json;charset=utf-8",
		        success : function(msg) {  //异步请求成功执行的回调函数
		        	 $( "#addAlert" ).load( "WEB-ROOT/common/alert.jsp", function( response, status, xhr ) {
		          		$('#addAlert').html(response);
		          		$("#alertText").text(msg);
			        	$("#alertModel").modal({
			     	        keyboard: true
			     	    }); 
		         	 });
		        	
		     	 //  selectList("true"); 
		        },//ajax引擎一般用不到；状态信息；抛出的异常信息
		        error : function(msg) {
		        	//alert("失败");
		        	$( "#addAlert" ).load( "WEB-ROOT/common/alert.jsp", function( response, status, xhr ) {
		          		$('#addAlert').html(response);
		          		$("#alertText").text("添加失败");
			        	$("#alertModel").modal({
			     	        keyboard: true
			     	    }); 
		         	 });
		        }
		    });
			
		}); 
		 */

		$(function() {
			$('#userForm').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					account : {
						message : '员工编号验证失败',
						validators : {
							notEmpty : {
								message : '员工编号不能为空'
							},
							stringLength : {
								min : 3,
								max : 10,
								message : '员工编号长度必须在3到10位之间'
							},
							regexp : {
								regexp : /^[a-zA-Z0-9_]+$/,
								message : '员工编号只能包含大写、小写、数字和下划线'
							}
						}
					},
					password : {
						validators : {
							notEmpty : {
								message : '员工密码不能为空'
							},
							stringLength : {
								min : 6,
								max : 18,
								message : '员工密码长度必须在6到18位之间'
							}

						}
					},
					username : {
						validators : {
							notEmpty : {
								message : '员工姓名不能为空'
							},
							stringLength : {
								min : 3,
								max : 18,
								message : '员工姓名长度必须在6到18位之间'
							}

						}
					},
					authority : {
						validators : {
							notEmpty : {
								message : '员工权限不能为空'
							}

						}
					},
					depNumber : {
						validators : {
							notEmpty : {
								message : '员工部门不能为空'
							}
						}
					}
				}

			}).on(
					'success.form.bv',
					function(e) {//点击提交之后
						// Prevent form submission
						e.preventDefault();

						// Get the form instance
						var $form = $(e.target);

						// Get the BootstrapValidator instance
						var bv = $form.data('bootstrapValidator');

						// Use Ajax to submit form data 提交至form标签中的action，result自定义

					 	var user = getFormData($("#userForm"));  
						  $.ajax({
					        type : $("#submitType").val(),  //请求方式
					        url : "${pageContext.request.contextPath}/register",  //请求路径
					        data: user, 
					        async: true,
					        dataType:"json",   
					        //contentType:"application/json;charset=utf-8",
					        success : function(msg) {  //异步请求成功执行的回调函数
					        	 $( "#addAlert" ).load( "WEB-ROOT/common/alert.jsp", function( response, status, xhr ) {
					          		$('#addAlert').html(response);
					          		$("#alertText").text(msg);
						        	$("#alertModel").modal({
						     	        keyboard: true
						     	    }); 
					         	 });
					        	
					     	 //  selectList("true"); 
					        },//ajax引擎一般用不到；状态信息；抛出的异常信息
					        error : function(msg) {
					        	//alert("失败");
					        	$( "#addAlert" ).load( "WEB-ROOT/common/alert.jsp", function( response, status, xhr ) {
					          		$('#addAlert').html(response);
					          		$("#alertText").text("添加失败");
						        	$("#alertModel").modal({
						     	        keyboard: true
						     	    }); 
					         	 });
					        }
					    });
					});
		});

	</script>


</body>