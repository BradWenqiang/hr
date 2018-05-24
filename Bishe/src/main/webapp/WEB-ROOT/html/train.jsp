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
	<div id="addTrainList"></div>
	<div class="row">

		<div class="col-lg-12 col-md-12 col-sm-12 ">
		<form class="form-inline" role="form" id="selectDepVal">
				<div class="row">
					<div class="form-group inputselect col-lg-4">
					   <sec:authorize access="hasRole('ROLE_ADMIN')">
					<button type="button" class="btn btn-info btn-sm " id="addTrain"
							>
							<span class="glyphicon glyphicon-user"></span> 新增培训
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
	//增加		
	var authority = "${authority}";
		//增加
		$("#addTrain").click(function(){
			 $("#addTrainList").load("WEB-ROOT/html/addTrain.jsp",function(){
				$("#addModel").modal({
	     	        keyboard: true
	     	    });
		
		}) 
		
		});
		var pageSize = 8;
		var dataUrl = "${pageContext.request.contextPath}/train";
		selectList= function(){
			initPage("0",pageSize,dataUrl);
		};
		initPage("0", pageSize, dataUrl);
		
	
		function initPage(num, ps, url) {
			//alert(num);
			$.ajax({
				url : url,
				type : "GET",
				data : "currentPage=" + num + "&pageSize=" + ps ,
				contentType : "application/json;charset=utf-8",
				success : function(msg) {
					//alert(data.username);
					initTable(msg);
					if("[ROLE_USER]"==authority){
						// $('.editDepa').attr("disabled", true); 
						// $('.delDepa').attr("disabled", true); 
						//$("#paging").attr("style","display:none;");
					} 
					
					 var i=1;
					 var sqlData;
					 var dateR;
					 //表格用的日期格式
					 var newDate = new Date();
					 //alert($('#tableList tr:eq(1) td:eq(4)').text());
					while($('#tableList tr:eq('+ i + ') td:eq(5)').text()!=""){
	        			 sqlData = $('#tableList tr:eq('+ i + ') td:eq(5)').text();
	        			 newDate.setTime(sqlData);
	        			 dateR = getMyDate(newDate);
	        			 $('#tableList tr:eq('+ i + ') td:eq(5)').text(dateR);
	        			i++;
	        		}
					
				},
				error : function(e) {
					console.log(e)
					alert("失败");
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
										"tid",
										"ttitle",
										"name",
										"purpose",
										"time",
										"address",
										"participants",
										"<button  class='btn btn-info btn-sm editDepa'  ID='editDepa' onclick='updF(id)'><span class='glyphicon glyphicon-user'></span> 编辑</button> <button  class='btn btn-info btn-sm delDepa' ID='delDepa' onclick='delF(id)'><span class='glyphicon glyphicon-user'></span>删除</button>" ] ,
								name : [ "培训编号", "培训标题", "培训人", "培训宗旨","培训时间","培训地址","参加人员","_opt" ],
										
								tid : "tid",
								checkBox : "tid"
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
					initPage(num, pageSize, dataUrl);
				}
			});
		} 
		//编辑
				function updF(id) {
			$
					.ajax({
						type : "POST", 
						url : "${pageContext.request.contextPath}/trainSelect", 
						data : id,
						async : true,
						// dataType:"json",   
						contentType : "application/json;charset=utf-8",
						success : function(msg) {

							/* $("#alertText").text(msg);
							$("#alertModel").modal({
							     keyboard: true
							 }); */
							 $("#addTrainList").load(
										"WEB-ROOT/html/addTrain.jsp",
										function() {
											$("#addModel").modal({
												keyboard : true
											});
											var newUpdateDate = new Date();
											var train = JSON.parse(msg);
											if (train != null) {
												$("#tid").val(
														train.tid);
												$("#ttitle").val(
														train.ttitle);
												$("#name").val(
														train.name);
												$("#purpose").val(
														train.purpose);
												newUpdateDate.setTime(train.time);
							        			var changedTime = getMyDate(newUpdateDate);
												$("#time").val(
														changedTime);
												$("#address").val(
														train.address);
												$("#participants").val(
														train.participants);
												$("#tid").attr(
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
						url : "${pageContext.request.contextPath}/train", 
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





