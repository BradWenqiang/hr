 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <%
	HttpSession s = request.getSession();
%> 
<body class="full">
<sec:authentication property="principal.authorities" scope="session" var="authority"/>
	<sec:authentication property="principal.username" scope="session" var="username"/>

	<div id="alert"></div>
	<div id="addUserList"></div>
	<div class="row">
	
		<div class="col-lg-2 col-md-3 col-sm-3   "
			style="border: 1px solid #ccc; height: 70%">
			<div id="tree"></div>
		</div>
		<div class="col-lg-10 col-md-9 col-sm-9 ">
			<form class="form-inline" role="form" id="selectUserVal">
				<div class="row">

					<div class="form-group inputselect col-lg-4">
						<label for="name">员工姓名</label> <input type="text"
							class="form-control  " id="selectName" name="username"
						    placeholder="请输入名称">
					</div>
					<div class="form-group inputselect col-lg-4">
						<label for="name">员工编号</label> <input type="text"
							class=" form-control " id="selectNumber" name="account"
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
					<button type="button" class="btn btn-info btn-sm " id="addUser"
							>
							<span class="glyphicon glyphicon-user"></span> 新增员工
						</button>
						<button type="button" class="btn btn-info btn-sm " id="deleteSelectUser"
							style="margin-left: 15px">
							<span class="glyphicon glyphicon-user"></span> 删除选中员工
						</button>
						 </sec:authorize>
					</div>
				</div>


			</form>

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
	<%-- 	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/treeview.js"></script>
	<script src="<%=request.getContextPath() %>/WEB-ROOT/js/pagination.js"></script> --%>


	<script type="text/javascript">
	var localCurrentDep;
	var localUsername;
	var localAccount;
	var departmentsList ;
	var pageSize = 8;
	var dataUrl = "${pageContext.request.contextPath}/register";
	var authority = "${authority}";
	var usrname = "${username}";
	
	//批量删除
	$("#deleteSelectUser").click(function(){
		
		var deleteList = $.getCheckboxIds() ;
		$.ajax({
			type : "DELETE", 
			url : "${pageContext.request.contextPath}/departmentsDel", 
			data : deleteList,
			async : true,
			//  dataType:"json",   
			contentType : "application/json;charset=utf-8",
			success : function(msg) { 
				$("#alert").load("WEB-ROOT/common/alert.jsp",
						function(response, status, xhr) {
							$('#alert').html(response);
							$("#alertText").text(msg);
							$("#alertModel").modal({
							     keyboard: true
							 }); 
						});
				//alert(msg);
				
				/* $("#alertText").text(msg);
				$("#alertModel").modal({
					keyboard : true
				}); */

			},
			error : function(msg) {
				//alert("xxx");
				/* $("#alertText").text("删除失败");
				$("#alertModel").modal({
					keyboard : true
				}); */
			}
		});
	});
	
	//刷新左侧树
	$(function() {
		//alert(usrname);
		$.ajax({
			type : "GET", 
			url : "${pageContext.request.contextPath}/departments", 
			async : true,
			data : "currentPage=1&pageSize=8&depNum=undefined&depName=undefined" ,
			// dataType:"json",   
			contentType : "application/json;charset=utf-8",
			success : function(msg) { 
				msg = JSON.parse(msg);
				departmentsList = msg.arrayList;
				$('#tree').treeview({
					data : getTree(departmentsList),
					enableLinks : true,
					showBorder : false,
					highlightSelected : true
				});
			},
			error : function(msg) {
				alert("bb");
			}
		});
	});
	//重置
		$("#resetting").click(resetting=function() {
			$("#selectNumber").val("");
			$("#selectName").val("");
			 localUsername = null;
			 localAccount = null;
			//$("#selectAuthority").val("");
		});

		$("#selectByVal").click(
				function() {
					var user = getFormData($("#selectUserVal"));
					var pagenumber = $("#paging").attr('pagenumber');
					selectList(localCurrentDep, user.account,
							user.username);
				});
		//增加
		$("#addUser").click(function() {
					$("#addUserList").load("WEB-ROOT/html/addUser.jsp",
							function() {
								$("#addModel").modal({
									keyboard : true
								});
								getSelectInput();
							});
						
				});


	
	//复选框
		getSelectInput = function() {
			$.each(departmentsList, function(i, item) {
				if (i == 0) {
					// $("#departments").append('<option value="11">2</option>')
					$("#departments").append(
							"<option data-display="+"'true'"+ "value="+item.number+ ">"
									+ item.name + "</option>")
				} else {
					$("#departments").append(
							"<option value="+item.number+">"
									+ item.name + "</option>")
					// $("#departments").append('<option value="11">2</option>')
				}
				});
		}

		
		


		
		
		selectList= function(currentDep,account,username){
			//alert(currentDep);
			localCurrentDep = currentDep;
			localAccount = account;
			localUsername = username;
			initPage("0",pageSize,dataUrl,currentDep,account,username);
		};
		initPage("0", pageSize, dataUrl);
		
	
		function initPage(num, ps, url,currentDep,account,username) {
			//alert(num);
			$.ajax({
				url : url,
				type : "GET",
				//type:"POST",
				 data : "currentPage=" + num + "&pageSize=" + ps
						+ "&depNum=" +currentDep+ "&userNum="+ account
						+ "&userName=" + username, 
				contentType : "application/json;charset=utf-8",
				success : function(msg) {
					//alert(data.username);
					initTable(msg);
					 if("[ROLE_USER]"==authority){
						 var mi=1;
						 while($('#tableList tr:eq('+ mi + ') td:eq(2)').text()!=""){
							 if($('#tableList tr:eq('+ mi + ') td:eq(2)').text()!=usrname){
									$('#tableList tr:eq('+ mi + ')').text("");
							 }else{
									$('#delUsr').attr("disabled", true); 
							 }
							 mi++;
						
						}   
						$("#paging").attr("style","display:none;");
					} 
					 var i=1;
					 //alert($('#tableList tr:eq(1) td:eq(4)').text());
					while($('#tableList tr:eq('+ i + ') td:eq(4)').text()!=""){
	        			if($('#tableList tr:eq('+ i + ') td:eq(4)').text()==0){
	        				$('#tableList tr:eq('+ i + ') td:eq(4)').text("员工");
	        			}
	        			if($('#tableList tr:eq('+ i + ') td:eq(4)').text()==1){
	        				$('#tableList tr:eq('+ i + ') td:eq(4)').text("管理员");
	        			}
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
										"username",
										"account",
										"password",
										"authority",
										"depName",
										"<button  class='btn btn-info btn-sm ' ID='editUsr' onclick='updF(id)'><span class='glyphicon glyphicon-user' ></span> 编辑</button> <button  ID='delUsr' class='btn btn-info btn-sm' onclick='delF(id)'><span class='glyphicon glyphicon-user' ></span>删除</button>" ] ,
								name : [ "员工姓名", "员工编号", "密码", "员工权限", "部门名称",
										"_opt" ],
								tid : "account",
								checkBox : "account"
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
					initPage(num, pageSize, dataUrl,localCurrentDep,localAccount,localUsername);
				}
			});
		}
		
		function updF(id) {
			
		

		$
				.ajax({
					type : "POST", 
					url : "${pageContext.request.contextPath}/registerSelect", 
					data : id,
					async : true,
					// dataType:"json",   
					contentType : "application/json;charset=utf-8",
					success : function(msg) {

						/* $("#alertText").text(msg);
						$("#alertModel").modal({
						     keyboard: true
						 }); */
						 $("#addUserList").load(
									"WEB-ROOT/html/addUser.jsp",
									function() {
										$("#addModel").modal({
											keyboard : true
										});
										var user = JSON.parse(msg);
										if (user != null) {
											$("#username").val(
													user.username);
											$("#account").val(
													user.account);
											$("#password").val(
													user.password);
											$("#authority").val(
													user.authority);
											$("#departments").val(
													user.depNumber);
											$("#account").attr(
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
					url : "${pageContext.request.contextPath}/register", 
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





