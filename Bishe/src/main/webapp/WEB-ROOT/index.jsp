
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>云从人力资源管理系统</title>

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/css/common.css">
</head>




<body>
<sec:authentication property="principal.authorities" scope="session" var="authority"/>
<sec:authentication property="principal.username" scope="session" var="username"/>
	<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token }" />

	<div class="container full">
		<div class="row">
			<div class="col-lg-2  col-sm-12 a">

				<nav class="navbar navbar-default" role="navigation">
					<div class="container-fluid">

						<!-- 						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target="#accordion">
								<span class="sr-only">切换导航1111111111111111</span> <span class="icon-bar"></span>
								<span class="icon-bar"></span> <span class="icon-bar"></span>
							</button>
							</div>
 -->					
 						<div class="hid"style="width:100% ; height:15%; margin-bottom: 1px; text-align: center;" >
						<img class="img-responsive hid" style=" margin-bottom: 1px; margin:0 auto" 
							src="<%=request.getContextPath() %>/WEB-ROOT/img/logow.png">
						</div>
						<div class="panel-group midfont" id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading " style="padding-left: 35%">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion "
											href="#collapseFive"
												 class="midfont" > 系统管理 </a>
												<!--  onclick="closeOther('collapseFive')" -->
									</h4>
								</div>
								<div id="collapseFive" class="panel-collapse collapse" >
									<div class="panel-body">
										<ul class="list-group">
											<a href="javascript:void(0)"
												onclick="htmlDispatcher('WEB-ROOT/html/user.jsp',' 首页/ 系统管理/ 员工账号','员工账号')"
												class="list-group-item leftlist" id="userCount">员工账号</a>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" style="padding-left: 35%">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseOne"
												 class="midfont"> 部门管理 </a>
											<!-- 	 onclick="closeOther('collapseOne')" -->
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse ">
									<div class="panel-body">
										<ul class="list-group leftlist">

											<a href=" javascript:void(0)"
												onclick="htmlDispatcher('WEB-ROOT/html/departments.jsp',' 首页/ 部门管理/ 部门信息','部门信息')"
												class="list-group-item leftlist" id="departmentsIndex">部门查询</a>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" style="padding-left: 35%">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseTwo"
												 class="midfont"> 员工管理 </a>
												<!--  onclick="closeOther('collapseTwo')" -->
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse">
									<div class="panel-body">
										<ul class="list-group">
										<a href=" javascript:void(0)"
												onclick="htmlDispatcher('WEB-ROOT/html/userInfo.jsp',' 首页/ 员工管理/ 员工信息','员工信息')"
												class="list-group-item leftlist" id="departmentsIndex">员工信息</a>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" style="padding-left: 35%">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseThree"
												 class="midfont"> 薪资管理</a>
												<!--  onclick="closeOther('collapseThree')" -->
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse">
									<div class="panel-body">
										<ul class="list-group">
										<a href=" javascript:void(0)"
												onclick="htmlDispatcher('WEB-ROOT/html/wage.jsp',' 首页/ 薪资管理/ 员工薪资','员工薪资')"
												class="list-group-item leftlist" id="departmentsIndex">员工薪资</a>
										<a href=" javascript:void(0)"
												onclick="htmlDispatcher('WEB-ROOT/html/pay.jsp',' 首页/ 薪资管理/ 薪资发放','薪资发放')"
												class="list-group-item leftlist" id="departmentsIndex">薪资发放</a>
										</ul>
									</div>
								</div>
							</div>
							 <sec:authorize access="hasRole('ROLE_ADMIN')">
								<div class="panel panel-default ">
									<div class="panel-heading" style="padding-left: 35%">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapseFour"
													 class="midfont"> 招聘管理 </a>
										</h4>
									</div>
									<div id="collapseFour" class="panel-collapse collapse">
										<div class="panel-body">
											<ul class="list-group">
												<a href=" javascript:void(0)"
													onclick="htmlDispatcher('WEB-ROOT/html/employ.jsp',' 首页/ 招聘管理/ 应聘信息','应聘信息')"
													class="list-group-item leftlist" id="departmentsIndex">应聘信息</a>
											</ul>
										</div>
									</div>
						
							</div>
							<div class="panel panel-default ">
								<div class="panel-heading" style="padding-left: 35%">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseSix"
												 class="midfont"> 培训管理 </a>
									</h4>
								</div>
								<div id="collapseSix" class="panel-collapse collapse">
									<div class="panel-body">
										<ul class="list-group">
											<a href=" javascript:void(0)"
												onclick="htmlDispatcher('WEB-ROOT/html/train.jsp',' 首页/ 培训管理 / 培训计划','培训计划')"
												class="list-group-item leftlist" id="departmentsIndex">培训计划</a>
										</ul>
									</div>
								</div>
							</div>
						</sec:authorize>
						</div>
					</div>
				</nav>
			</div>
			<div class="col-lg-10 col-sm-12 ">

				<div class="row hid" id="tap"  style="margin-left: 2px">

					<div
						class="alert alert-success alert-dismissable col-lg-2 alertclose " style="height: 5%; width:10%; text-align:center;padding-bottom: 2% ;" >
						
						<button type="button"  class="close" data-dismiss="alert"
							aria-hidden="true"> &times;</button>
							<a href="javascript:void(0);" onclick="htmlDispatcher('WEB-ROOT/html/user.jsp',' 首页/ 系统管理 / 员工账号')">首页</a>
					</div>
					
					
					
				</div>



				<div style="margin-top: 3px">
					<ol class="breadcrumb hid">
						<li class="active" id="breadLi">首页</li>
					</ol>
				</div>
				<%--  <iframe src="<%=request.getContextPath() %>/WEB-ROOT/common/head2.jsp" width="100%" scrolling="yes" height="100%"></iframe> --%>
				<div id="frame"></div>


			</div>
		</div>

	</div>
	<%-- <header>  
	        <iframe src="<%=request.getContextPath() %>/WEB-ROOT/common/head.jsp" width="100%" scrolling="no" height="300px"></iframe>  
	</header>
	
<button class="btn btn-info">BUTTON</button>
	
	 --%>

	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/jquery-min.js"></script>
	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/js/common.js"></script>
	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/treeview.js"></script>
	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/js/pagination.js"></script>
	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/lTable.js"></script>
	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/bootstrapValidator.js"></script>
		

	<div id="moon"></div>

	<script>
	
	/*  function load(url, data){
	     //alert($(url).attr("href"));
	     $.ajaxSetup({cache: false });
	     $("#frame").load($(url).attr("href")+ " #content ", data, function(result){
	         //alert(result);
	         //将被加载页的JavaScript加载到本页执行
	         $result = $(result); 
	         $result.find("script").appendTo('#frame');
	     });

	 } */
	 
	 
	 
	 
	 
	 
	
	 $( "#frame" ).load( "WEB-ROOT/html/user.jsp", function( response, status, xhr ) {
			$('#frame').html(response);
			});  
	 
	   //var urlFlag = "${url}";
	  /* 	if(urlFlag==""){
			  $( "#frame" ).load( "WEB-ROOT/html/user2.jsp", function( response, status, xhr ) {
					$('#frame').html(response);
					});  
		 } else{
			  $( "#frame" ).load( urlFlag, function( response, status, xhr ) {
					$('#frame').html(response);
					});   */
			/*   var panelParentId = "${panelParentId}";
			  var panelChildrenId = "${panelChildrenId}"; */
			  //alert(panelParentId);
			  //alert(panelChildrenId);
			  
			  
			/*   $("#collapseOne").attr("class","panel-collapse collapse ");
	        	$("#collapseTwo").attr("class","panel-collapse collapse ");
	        	$("#collapseThree").attr("class","panel-collapse collapse ");
	        	$("#collapseFour").attr("class","panel-collapse collapse ");
	        	$("#collapseFive").attr("class","panel-collapse collapse ");
	        	$('#'+panelParentId+'').attr("class","panel-collapse collapse in");
	        	$( '#'+panelChildrenId+'').addClass('active'); */
		//}  
		//"WEB-ROOT/html/user.jsp"
			/*   $( "#frame" ).load( "WEB-ROOT/html/user.jsp", function( response, status, xhr ) {
					$('#frame').html(response);
					});  
	  */
	  //,panelParentId,panelChildrenId
	  var userFalg = true;
	  var depFalg = true;
	  var infoFalg = true;
	  var employFalg = true;
	  var wageFalg = true;
	  var payFalg = true;
	  var trainFalg = true;
	  //判断标签栏跳转到哪个页面
	 dispatcherSelect =  function (tab){
		 if (tab=="员工账号"){
			 htmlDispatcher('WEB-ROOT/html/user.jsp',' 首页/ 系统管理/ 员工账号');
		 }
		 if (tab=="部门信息"){
			 htmlDispatcher('WEB-ROOT/html/departments.jsp',' 首页/ 部门管理/ 部门信息');
		 }
		 if (tab=="员工信息"){
			 htmlDispatcher('WEB-ROOT/html/userInfo.jsp',' 首页/ 员工管理/ 员工信息');
		 }
		 if (tab=="员工薪资"){
			 htmlDispatcher('WEB-ROOT/html/wage.jsp',' 首页/ 薪资管理/ 员工薪资');
		 }
		 if (tab=="薪资发放"){
			 htmlDispatcher('WEB-ROOT/html/pay.jsp',' 首页/ 薪资管理/ 薪资发放');
		 }
		 if (tab=="应聘信息"){
			 htmlDispatcher('WEB-ROOT/html/employ.jsp',' 首页/ 招聘管理/ 应聘信息');
		 }
		 if (tab=="培训计划"){
			 htmlDispatcher('WEB-ROOT/html/train.jsp',' 首页/ 培训管理/ 培训计划');
		 }
	 }
	    htmlDispatcher=function(url,breadVal,tab){
	    	//加载页面
		   $( "#frame" ).load( url, function( response, status, xhr ) {
		 				$('#frame').html(response);
		 				});
		   
		   $( "#breadLi" ).text(breadVal); 
		  //判断标签是否为空，为空不创建新标签
		   if(tab!=null){
			   tabFactory = "'"+tab +"'";
			   if (tab=="员工账号"){
				   if(userFalg){
					   var boarddiv = '<div class="alert alert-success alert-dismissable col-lg-2 alertclose " style="height: 5%; width:10%; text-align:center;padding-bottom: 2% ;"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> '+ '<a href="javascript:void(0);" onclick="dispatcherSelect('+tabFactory+')">'+tab+'</a>    </div>';
					   $("#tap").append(boarddiv); 
					   userFalg=false;
				   }
			   }
			   if (tab=="部门信息"){
				   if(depFalg){
					   var boarddiv = '<div class="alert alert-success alert-dismissable col-lg-2 alertclose " style="height: 5%; width:10%; text-align:center;padding-bottom: 2% ;"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> '+ '<a href="javascript:void(0);" onclick="dispatcherSelect('+tabFactory+')">'+tab+'</a>    </div>';
					   $("#tap").append(boarddiv); 
					   depFalg=false;
				   }
			   }
			   if (tab=="员工信息"){
				   if(infoFalg){
					   var boarddiv = '<div class="alert alert-success alert-dismissable col-lg-2 alertclose " style="height: 5%; width:10%; text-align:center;padding-bottom: 2% ;"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> '+ '<a href="javascript:void(0);" onclick="dispatcherSelect('+tabFactory+')">'+tab+'</a>    </div>';
					   $("#tap").append(boarddiv); 
					   infoFalg=false;
				   }
			   }
			   if (tab=="员工薪资"){
				   if(wageFalg){
					   var boarddiv = '<div class="alert alert-success alert-dismissable col-lg-2 alertclose " style="height: 5%; width:10%; text-align:center;padding-bottom: 2% ;"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> '+ '<a href="javascript:void(0);" onclick="dispatcherSelect('+tabFactory+')">'+tab+'</a>    </div>';
					   $("#tap").append(boarddiv); 
					   wageFalg=false;
				   }
			   }
			   if (tab=="薪资发放"){
				   if(payFalg){
					   var boarddiv = '<div class="alert alert-success alert-dismissable col-lg-2 alertclose " style="height: 5%; width:10%; text-align:center;padding-bottom: 2% ;"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> '+ '<a href="javascript:void(0);" onclick="dispatcherSelect('+tabFactory+')">'+tab+'</a>    </div>';
					   $("#tap").append(boarddiv); 
					   payFalg=false;
				   }
			   }
			   if (tab=="应聘信息"){
				   if(employFalg){
					   var boarddiv = '<div class="alert alert-success alert-dismissable col-lg-2 alertclose " style="height: 5%; width:10%; text-align:center;padding-bottom: 2% ;"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> '+ '<a href="javascript:void(0);" onclick="dispatcherSelect('+tabFactory+')">'+tab+'</a>    </div>';
					   $("#tap").append(boarddiv); 
					   employFalg=false;
				   }
			   }
			   if (tab=="培训计划"){
				   if(trainFalg){
					   var boarddiv = '<div class="alert alert-success alert-dismissable col-lg-2 alertclose " style="height: 5%; width:10%; text-align:center;padding-bottom: 2% ;"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> '+ '<a href="javascript:void(0);" onclick="dispatcherSelect('+tabFactory+')">'+tab+'</a>    </div>';
					   $("#tap").append(boarddiv); 
					   trainFalg=false;
				   }
			   }
			 
		   }
		   
		   
		   
		  /*  $.ajax({
		        type : "GET",  //请求方式
		        url : "${pageContext.request.contextPath}/breadCrumb",  //请求路径
		        data: "breadCrumb="+breadVal +"&url="+url+"&panelParentId="+panelParentId +"&panelChildrenId="+panelChildrenId ,
		        async: false,
		        contentType:"application/json;charset=utf-8",
		        success : function(msg) {  //异步请求成功执行的回调函数
		        	urlFlag=null;
		        	  if(urlFlag==null){
		        		window.location.reload();
		        	}  
		        	
		        	$( "#frame" ).load( urlFlag, function( response, status, xhr ) {
		 				$('#frame').html(response);
		 				});
		        	
		        }
		    });  */
		    
		   
		   //"WEB-ROOT/common/head2.jsp"
		   
		}; 
		
		/*  htmlDispatcher=function(url){

        	$( "#frame" ).load( url, function( response, status, xhr ) {
 				$('#frame').html(response);
 				});
        	
		} */
	 /* 	closeOther = function(show){
				//alert(show);
			    $("#collapseOne").attr("class","panel-collapse collapse ");
	        	$("#collapseTwo").attr("class","panel-collapse collapse ");
	        	$("#collapseThree").attr("class","panel-collapse collapse ");
	        	$("#collapseFour").attr("class","panel-collapse collapse ");
	        	$("#collapseFive").attr("class","panel-collapse collapse ");
	        	$('#'+show+'').attr("class","panel-collapse collapse in");
		}  */
 	/*  $("#frame").append('<iframe id="iframe" name="iframe" style="border:0px;width:100%;height:80%;" />');
window.open("WEB-ROOT/common/head2.jsp",'iframe');  */
	
</script>
</body>
</html>
