<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	<div id="addDepList"></div>
	<div class="row">

		<div class="col-lg-12 col-md-12 col-sm-12 ">
		<form class="form-inline" role="form" id="selectDepVal">
				<div class="row">

					<div class="form-group inputselect col-lg-4">
						<label for="name">部门编号</label> <input type="text"
							class="form-control  " id="selectNumber" name="number"
						    placeholder="请输入名称">
					</div>
					<div class="form-group inputselect col-lg-4">
						<label for="name">部门名称</label> <input type="text"
							class=" form-control " id="selectName" name="name"
							placeholder="请输入名称">
					</div>
				
					<div class="form-group inputselect col-lg-4">
						<button type="button" class="btn btn-success btn-sm "
							id="selectByVal">
							<span class="glyphicon glyphicon-user"></span> 搜索
						</button>
						
						<button type="button" class="btn btn-success btn-sm "
							id="resetting">
							<span class="glyphicon glyphicon-user"></span> 重置
						</button>
					</div>
					<div class="form-group inputselect col-lg-4">
					   <sec:authorize access="hasRole('ROLE_ADMIN')">
					<button type="button" class="btn btn-info btn-sm " id="addDep"
							>
							<span class="glyphicon glyphicon-user"></span> 新增部门
						</button>
						 </sec:authorize>
					</div>
				</div>


			</form>
			<form class="form-inline" role="form"></form>

			<div class="table-responsive " style="margin-left: 3%;">

				<table class="table table-hover tablefont">
					<tbody id="tableList">

					</tbody>

				</table>
				<div style="bottom: 10%">
					<div id="paging" style="text-align: center; margin-left: 25%;">
					</div>

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
	var localDepNum ;
	var localDepName ;
	//重置
	$("#resetting").click(resetting=function() {
		$("#selectNumber").val("");
		$("#selectName").val("");
		 localDepNum  = null;
		 localDepName = null;
		//$("#selectAuthority").val("");
	});
	$("#selectByVal").click(
			function() {
				var LocDep = getFormData($("#selectDepVal"));
				var pagenumber = $("#paging").attr('pagenumber');
				selectList(LocDep.number,
						LocDep.name);
			});
	//增加
		
	var authority = "${authority}";
		//增加
		$("#addDep").click(function(){
			 $("#addDepList").load("WEB-ROOT/html/addDepartments.jsp",function(){
				$("#addModel").modal({
	     	        keyboard: true
	     	    });
		
		}) 
		
		});
		
		
		var pageSize = 8;
		var dataUrl = "${pageContext.request.contextPath}/departments";
		selectList= function(depNum,depName){
			localDepNum = depNum;
			localDepName = depName;
			initPage("0",pageSize,dataUrl,depNum,depName);
		};
		initPage("0", pageSize, dataUrl);
		
	
		function initPage(num, ps, url,depNum,depName) {
			//alert(num);
			$.ajax({
				url : url,
				type : "GET",
				//type:"POST",
				 data : "currentPage=" + num + "&pageSize=" + ps + "&depNum=" +depNum+ "&depName="+depName, 
				contentType : "application/json;charset=utf-8",
				success : function(msg) {
					//alert(data.username);
					initTable(msg);
					if("[ROLE_USER]"==authority){
						// var mi=1;
						 $('.editDepa').attr("disabled", true); 
						 $('.delDepa').attr("disabled", true); 
						/*  alert($('#tableList tr:eq(1) td:eq(2)').text()); */
						/*   while($('#tableList tr:eq('+ mi + ') td:eq(1)').text()!=""){
							 if($('#tableList tr:eq('+ mi + ') td:eq(1)').text()!=usrname){
									$('#tableList tr:eq('+ mi + ')').text("");
							 }else{
									$('#delUsr').attr("disabled", true); 
							 }
							 mi++;
						
						}     */
						$("#paging").attr("style","display:none;");
					} 
					
				},
				error : function(e) {
					console.log(e)
					alert("失败");
				}
			});
		}
		//初始化表格
		function initTable(data) {
			//var obj = eval("("+data+")");
			data = JSON.parse(data);
			var obj = data.arrayList;
			var page = data.pageInfo;
			//alert(page.totalPage);
			//alert(page.totalPage)
			//table
			myTable = $
					.lTable(
							'#tableList',
							{
								data : obj 
								,
								title : [
										"number",
										"name",
										"manager",
										"telephone",
										"<button  class='btn btn-info btn-sm editDepa'  ID='editDepa' onclick='updF(id)'><span class='glyphicon glyphicon-user'></span> 编辑</button> <button  class='btn btn-info btn-sm delDepa' ID='delDepa' onclick='delF(id)'><span class='glyphicon glyphicon-user'></span>删除</button>" ] ,
								name : [ "部门编号", "部门名称", "部门负责人", "部门电话","_opt" ],
										
								tid : "number",
								checkBox : "number"
							});
			
			$.lPaging('#paging',
			{
				pageNumber : page.currentPage 
				,
				
				totalPage : page.totalPage 
				,
				countSize : 8
				,
				count : page.totalResult,
				inputSearch : false
				,
				onPageChange : function(num) {
					initPage(num, pageSize, dataUrl,localDepNum,localDepName);
				}
			});
		}
		
		function updF(id) {
			
			

			$
					.ajax({
						type : "POST", 
						url : "${pageContext.request.contextPath}/departmentsSelect", 
						data : id,
						async : true,
						// dataType:"json",   
						contentType : "application/json;charset=utf-8",
						success : function(msg) {

							/* $("#alertText").text(msg);
							$("#alertModel").modal({
							     keyboard: true
							 }); */
							 $("#addDepList").load(
										"WEB-ROOT/html/addDepartments.jsp",
										function() {
											$("#addModel").modal({
												keyboard : true
											});
											var departments = JSON.parse(msg);
											if (departments != null) {
												$("#number").val(
														departments.number);
												$("#name").val(
														departments.name);
												$("#manager").val(
														departments.manager);
												$("#telephone").val(
														departments.telephone);
												$("#number").attr(
														"readOnly", true);
												$("#submitType").val("PUT")
											}
											getSelectInput();
										})
							
							/*  $("#alertText").text(msg);
							$("#alertModel").modal({
							      keyboard: true
							  }); */

						},
						error : function(msg) {
							alert("bb");
						}
					});

			}
			
			function delF(id) {
			$("#alert").load("WEB-ROOT/common/alert.jsp",
					function(response, status, xhr) {
						$('#alert').html(response);
					});
			$
					.ajax({
						type : "DELETE", 
						url : "${pageContext.request.contextPath}/departments", 
						data : id,
						async : true,
						//  dataType:"json",   
						contentType : "application/json;charset=utf-8",
						success : function(msg) { 

							/* $("#alertText").text(msg);
							$("#alertModel").modal({
							     keyboard: true
							 }); */
							$("#alertText").text(msg);
							$("#alertModel").modal({
								keyboard : true
							});

						},
						error : function(msg) {
							$("#alertText").text("删除失败");
							$("#alertModel").modal({
								keyboard : true
							});
						}
					});
			}
		
	</script>
</body>





