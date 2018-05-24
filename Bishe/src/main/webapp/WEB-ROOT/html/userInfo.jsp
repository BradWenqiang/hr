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
					   <sec:authorize access="hasRole('ROLE_ADMIN')">
					<button type="button" class="btn btn-info btn-sm " id="addDep"
							>
							<span class="glyphicon glyphicon-user"></span> 新增员工信息
						</button>
						 </sec:authorize>
					</div>
				</div>


			</form>
			<form class="form-inline" role="form"></form>

			<div class="table-responsive " style="margin-left: 3%; font-size:8px;" >

				<table class="table table-hover tablefont" style="font-size:12px;">
					<tbody id="tableList" >

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
	
		
	var authority = "${authority}";
	var usrname = "${username}";
		//增加
		$("#addDep").click(function(){
			 $("#addDepList").load("WEB-ROOT/html/addUserInfo.jsp",function(){
				$("#addModel").modal({
	     	        keyboard: true
	     	    });
		
		}) 
		
		});
		
		
		
		var pageSize = 8;
		var dataUrl = "${pageContext.request.contextPath}/userinfo";
		selectList= function(){
			initPage("0",pageSize,dataUrl);
		};
		initPage("0", pageSize, dataUrl);
		
	
		function initPage(num, ps, url) {
			//alert(num);
			$.ajax({
				url : url,
				type : "GET",
				//type:"POST",
				 data : "currentPage=" + num + "&pageSize=" + ps ,
				contentType : "application/json;charset=utf-8",
				success : function(msg) {
					//alert(data.username);
					initTable(msg);
					if("[ROLE_USER]"==authority){
						 var mi=1;
						 while($('#tableList tr:eq('+ mi + ') td:eq(1)').text()!=""){
							 if($('#tableList tr:eq('+ mi + ') td:eq(1)').text()!=usrname){
									$('#tableList tr:eq('+ mi + ')').text("");
							 }
							 mi++;
						
						}   
						$("#paging").attr("style","display:none;");
					} 
					
					 var i=1;
					 var sqlData;
					 var dateR;
					 //表格用的日期格式
					 var newDate = new Date();
					 //alert($('#tableList tr:eq(1) td:eq(4)').text());
					while($('#tableList tr:eq('+ i + ') td:eq(10)').text()!=""){
	        			 sqlData = $('#tableList tr:eq('+ i + ') td:eq(10)').text();
	        			 newDate.setTime(sqlData);
	        			 dateR = getMyDate(newDate);
	        			 $('#tableList tr:eq('+ i + ') td:eq(10)').text(dateR);
	        			i++;
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
										"usernumber",
										"name",
										"depnumber",
										"sex",
										"nation",
										"wedding",
										"phonenumber",
										"school",
										"education",
										"worktime",
										"age",
										"<button  class='btn btn-info btn-sm editDepa'  ID='editDepa' onclick='updF(id)'><span class='glyphicon glyphicon-user'></span> 编辑</button> <button  class='btn btn-info btn-sm delDepa' ID='delDepa' onclick='delF(id)'><span class='glyphicon glyphicon-user'></span>删除</button>" ] ,
								name : [ "员工编号", "名字","部门","性别",
								         "民族","婚姻","手机号","毕业学校","学历",
								         "入职时间","年龄",
								         "_opt" ],
										
								tid : "usernumber",
								checkBox : "usernumber"
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
						url : "${pageContext.request.contextPath}/userinfoSelect", 
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
										"WEB-ROOT/html/addUserInfo.jsp",
										function() {
											$("#addModel").modal({
												keyboard : true
											});
											 var newUpdateDate = new Date();
											var userInfo = JSON.parse(msg);
											if (userInfo != null) {
												$("#usernumber").val(
														userInfo.usernumber);
												$("#name").val(
														userInfo.name);
												$("#depnumber").val(
														userInfo.depnumber);
												$("#sex").val(
														userInfo.sex);
												$("#nation").val(
														userInfo.nation);
												$("#manager").val(
														userInfo.manager);
												$("#phonenumber").val(
														userInfo.phonenumber);
												$("#wedding").val(
														userInfo.wedding);
												$("#school").val(
														userInfo.school);
												$("#education").val(
														userInfo.education);
												newUpdateDate.setTime(userInfo.worktime);
							        			var changedTime = getMyDate(newUpdateDate);
												$("#worktime").val(
														changedTime);
												$("#age").val(
														userInfo.age);
												$("#usernumber").attr(
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
						url : "${pageContext.request.contextPath}/userinfo", 
						data : id,
						async : true,
						//  dataType:"json",   
						contentType : "application/json;charset=utf-8",
						success : function(msg) { 
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





