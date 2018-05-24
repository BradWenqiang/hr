<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>云从人力资源管理系统</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/WEB-ROOT/bootstrap/css/bootstrap.min.css">
</head>

<body background="<%=request.getContextPath()%>/WEB-ROOT/img/login.jpg">
	
	
	<div style="margin-left: 30%; margin-top: 15%">
		
		<%--   <form class="form-horizontal" role="form" method="post" action="<c:url value='check_action' />">  
       	<div class="modal-body" style="height: 60%;">
       	<div class="form-group " >
        <input type="text"  class=" form-control  " name="username"  placeholder="请输入账号">  </br>
        <input type="password" class=" form-control  " name="password" placeholder="请输入密码">  </br> 
        <input type="submit" value="提交"> 
        </div> 
        	</div>
    </form>  --%>
  		  <label  class="col-sm-2 control-label"></label>
	    <div  class="col-lg-3 col-sm-7">
	    <h3  style="color: #FFFFFF; " >上海自如人力资源管理系统</h3>
	    <%-- <img class="img-responsive hid"  style=" margin-left:18% ;width:250px; height:75px"
								src="<%=request.getContextPath() %>/WEB-ROOT/img/logol.png"> --%>
		</div>
		<div class="row">
		<form class="form-horizontal" method="post" role="form"
			action="<c:url value='check_action' />">
				
			<div class="form-group">
			
			<label  class="col-sm-2 control-label"></label>
			<div class="col-lg-3 col-sm-7" style="left:7%;color:White">
					${error}
				</div>
		
			</div>
			<div class="form-group">
		
				<label  class="col-sm-2 control-label">账号</label>
				<div class="col-lg-3 col-sm-7">
					<input type="text" class="form-control" name="username" id="username"
						placeholder="请输入账号">
				</div>
			</div>
			<div class="form-group">
				<label  class="col-sm-2 control-label">密码</label>
				<div class="col-lg-3 col-sm-7">
					<input type="text" class="form-control" name="password"
						placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
			<label  class="col-sm-2 control-label"></label>
				<div class="col-lg-3 col-sm-7">
					<button type="submit" class="btn btn-info btn-sm btn-block">登录</button>
				</div>
			</div>
		</form>
		</div>
	</div>




	<script
		src="<%=request.getContextPath()%>/WEB-ROOT/bootstrap/js/jquery-min.js"></script>
	<script
		src="<%=request.getContextPath()%>/WEB-ROOT/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$("#username").focus();
	</script>
		</body>
		</html>
	