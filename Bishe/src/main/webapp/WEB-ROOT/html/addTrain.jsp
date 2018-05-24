
<%
HttpSession s = request.getSession(); 
%><%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%-- <link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/css/common.css"> --%>
<body>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="addModel" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div id="addAlert">
		</div>
		<div class="modal-dialog" style="width: 60%; ">
		<!--  这下面放一个隐藏的input框-->
			<input type="hidden" id="submitType" value="POST">
			<div class="modal-content" style="background: #F5F5F5;">
				<div class="modal-header">
					<button type="button" class="close" id="addAlertSubmit"
						data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">新增培训信息</h4>
				</div>
				<!-- <form class="form-inline horizontal " role="form"> -->
				<form class="form-horizontal" role="form" id="trainForm" >
					<div class="modal-body" style="height: 60%;">
						<div class="col-lg-10 col-md-9 col-sm-9 ">

							<!-- <div class="row"> -->
							<div class="form-group " >
								<label for="name" class=" col-lg-2 control-label" style=" padding-top: 30px;">培训编号</label>
								<div class=" col-lg-4 " style=" padding-top: 25px;">
									<input type="text" class=" form-control  " name="tid"
										id="tid" placeholder="请输入培训编号">
								</div>
								<label for="name" class=" col-lg-2 control-label" style=" padding-top: 30px;">培训标题</label>
								<div class=" col-lg-4 " style=" padding-top: 25px;">
								 <input
									type="text" class="form-control  col-lg-4 " name="ttitle"
									id="ttitle" placeholder="请输入培训标题">
								</div>
								<label for="name" class=" col-lg-2 control-label" style=" padding-top: 30px;">培训人</label>
								<div class=" col-lg-4 " style=" padding-top: 25px;">
								 <input
									type="text" class="form-control  col-lg-4 " name="name"
									id="name" placeholder="请输入培训人">
								</div>
								<label for="name" class=" col-lg-2 control-label" style=" padding-top: 30px;">培训宗旨</label>
								<div class=" col-lg-4 " style=" padding-top: 25px;">
								 <input
									type="text" class="form-control  col-lg-4 " name="purpose"
									id="purpose" placeholder="请输入培训宗旨">
								</div>
								<label for="name" class=" col-lg-2 control-label" style=" padding-top: 30px;">培训时间</label>
								<div class=" col-lg-4 " style=" padding-top: 25px;">
									<input type="text" class=" form-control  " name="time"
										id="time" placeholder="请输入培训时间">
								</div>
								<label for="name" class=" col-lg-2 control-label" style=" padding-top: 30px;">培训地址</label>
								<div class=" col-lg-4 " style=" padding-top: 25px;">
									<input type="text" class=" form-control  " name="address"
										id="address" placeholder="请输入培训地点">
								</div>
								<label for="name" class=" col-lg-2 control-label" style=" padding-top: 30px;">参加人员</label>
								<div class=" col-lg-4 " style=" padding-top: 25px;">
									<input type="text" class=" form-control  " name="participants"
										id="participants" placeholder="请输入参加人员">
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
							name="submit"  style="margin-left: 15px; margin-right: 5%;">
							<span class="glyphicon glyphicon-user"></span> 确定
						</button>
						
					</div>

				</form>






			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	<%-- <script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/jquery-min.js"></script>
	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/bootstrap.min.js"></script> --%>
	<script type="text/javascript">
	
	

	$(function() {
		$('#trainForm').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				tid : {
					message : '培训编号验证失败',
					validators : {
						notEmpty : {
							message : '培训编号不能为空'
						},
						stringLength : {
							min : 3,
							max : 10,
							message : '培训编号长度必须在3到10位之间'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_]+$/,
							message : '培训编号只能包含大写、小写、数字和下划线'
						}
					}
				},
				ttitle : {
					message : '培训标题验证失败',
					validators : {
						notEmpty : {
							message : '培训标题不能为空'
						},
						stringLength : {
							max : 12,
							message : '最长12位'
						}
					}
				},
				name : {
					message : '培训人验证失败',
					validators : {
						notEmpty : {
							message : '培训人不能为空'
						},
						stringLength : {
							min : 1,
							max : 10,
							message : '培训人长度必须在1到10位之间'
						}
						
					}
				},
				purpose: {
					message : '培训宗旨验证失败',
					validators : {
						notEmpty : {
							message : '培训宗旨为空'
						},
						stringLength : {
							min : 1,
							max : 10,
							message : '培训宗旨必须在1到10位之间'
						}
						
					}
				},
				time : {
					validators : {
						date :{
							 format : 'YYYY-MM-DD',  
							message : '日期格式不对'
						}
						, notEmpty : {
							message : '培训时间不能为空'
						} 
					}
				}, 
				address : {
					message : '培训地址验证失败',
					validators : {
						notEmpty : {
							message : '培训地址不能为空'
						},
						stringLength : {
							max : 12,
							message : '最长12位'
						}
					}
				},
				participants : {
					message : '参加人员验证失败',
					validators : {
						notEmpty : {
							message : '参加人员不能为空'
						},
					}
				},
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

				 	var train = getFormData($("#trainForm"));  
					  $.ajax({
				        type : $("#submitType").val(),  //请求方式
				        url : "${pageContext.request.contextPath}/train",  //请求路径
				        data: train, 
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
				          		$("#alertText").text("操作失败");
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