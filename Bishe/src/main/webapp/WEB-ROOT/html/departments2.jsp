<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/css/common.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/css/treeview.css"> --%>


<%
HttpSession s = request.getSession(); 
%>
<body class="full" id="content">
	<div id="alert"></div>
	<div id="addUserList"></div>
	<div class="row">

		<div class="col-lg-12 col-md-12 col-sm-12 ">
			<form class="form-inline" role="form">


			</form>

			<div class="table-responsive " style="margin-left: 3%;">

				<table class="table table-hover tablefont">
					<thead>
						<tr>
							<th>部门编号</th>
							<th>部门名称</th>
							<th>部门负责人</th>
							<th>部门电话</th>
							<th>操作&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info btn-sm " id="addUser">
							<span class="glyphicon glyphicon-user"></span> 新增部门
							</button></th>
						</tr>

					</thead>
					<tbody id="tbody">
						<c:forEach items="${departmentsList}" var="item">
							<tr>
								<td>${item.number}</td>
								<td>${item.name}</td>
								<td>${item.manager}</td>
								<td>${item.telephone}</td>
								<td><button type="button" class="btn btn-info btn-sm "
										id="edit">
										<span class="glyphicon glyphicon-user"></span> 编辑
									</button>
									<button type="button" class="btn btn-info btn-sm " id="delete">
										<span class="glyphicon glyphicon-user"></span> 删除
									</button></td>
							</tr>
						</c:forEach>

					</tbody>

				</table>
				<div style="bottom: 10%">
					<h3>显示第&nbsp;1&nbsp;至&nbsp;2&nbsp;项，共&nbsp;2&nbsp;项</h3>
					<ul class="pagination " style="margin-left: 30%">
						<li><a href="#">&laquo;</a></li>
						<li class="active"><a href="#">1</a></li>
						<li class="disabled"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<%-- <script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/jquery-min.js"></script>
	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/treeview.js"></script>
	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/bootstrap.min.js"></script> --%>

	<script type="text/javascript">
		
	
		//页面初始化查询
		var flag = "${departmentsList}"  
		$(selectList = function(update){
			//alert("bbbbb")
			if(update=="true"){
				flag="";
			}
			 $.ajax({
			        type : "get",  //请求方式
			        url : "${pageContext.request.contextPath}/departments",  //请求路径
			        async: false,
			        data : {  //请求参数
			        },
			        success : function(msg) {  //异步请求成功执行的回调函数
			        	if(flag==""){
			        	//document.getElementById('frame').contentWindow.location.reload(true);
			        //	$('#frame').attr('src', $('#frame').attr('src'));
			        
			        	htmlDispatcher('WEB-ROOT/html/departments.jsp');
			        		 /*   $.ajax({
			  			        type : "POST",  //请求方式
			  			        url : "${pageContext.request.contextPath}/departmentsUrl",  //请求路径
			  			        async: true,
			  			        dataType:"json",   
			  			       // contentType:"application/json;charset=utf-8",
			  			        success : function(msg) {  //异步请求成功执行的回调函数
			  			        },//ajax引擎一般用不到；状态信息；抛出的异常信息
			  			        error : function(msg) {
			  			        }
			  			    });  */
			        	}
			        },//ajax引擎一般用不到；状态信息；抛出的异常信息
			        error : function(msg) {
			        }
			    });
		})
		
		
		//增加
		$("#addUser").click(function(){
			 $("#addUserList").load("WEB-ROOT/html/addDepartments.jsp",function(){
				$("#addModel").modal({
	     	        keyboard: true
	     	    });
		
		}) 
		
		});
		
		//删除
		$("button[id='delete']").click(function(){
			 
			var account = $(this).parent().parent().children("td").eq(0).text();
			alert(account)
			if(account!=""){
				  $( "#alert" ).load( "WEB-ROOT/common/alert.jsp", function( response, status, xhr ) {
		        		$('#alert').html(response);
		        }); 
				$.ajax({
			        type : "DELETE",  //请求方式
			        url : "${pageContext.request.contextPath}/register",  //请求路径
			        data: 0000, 
			        async: true,
			        dataType:"json",   
			        //contentType:"application/json;charset=utf-8",
			        success : function(msg) {  //异步请求成功执行的回调函数
			        	
			        	/* $("#alertText").text(msg);
			        	$("#alertModel").modal({
			     	        keyboard: true
			     	    }); */
			     	   $("#alertText").text(msg);
			        	$("#alertModel").modal({
			     	        keyboard: true
			     	    });
			        	
			        },//ajax引擎一般用不到；状态信息；抛出的异常信息
			        error : function(msg) {
			        	$("#alertText").text("删除失败");
			        	$("#alertModel").modal({
			     	        keyboard: true
			     	    }); 
			        }
			    });
			}
		})
		
		
		   
		
	</script>
</body>





