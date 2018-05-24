 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/css/common.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/css/treeview.css">


 <%
	HttpSession s = request.getSession();
%> 
<body >

	<div class="row" style="margin-left:20%">

		
			<form class="form-horizontal" role="form" id="selectUserVal">
				<div class="form-group">
					    <label for="name"  class="col-lg-1 control-label">种类</label>
					    <div class="col-lg-8">
					    <textarea class="form-control" rows="3"></textarea>
					     </div>
					</div>
			 	<div class="form-group">
					<label for="selectName1"  class="col-lg-1 control-label">标题</label> 
					<div class="col-lg-8">
					    <textarea class="form-control" rows="3"></textarea>
					     </div>
				</div>
				<div class="form-group">

					<label for="selectName2"  class="col-lg-1 control-label">作者</label> 
					<div class="col-lg-8">
					    <textarea class="form-control" rows="3"></textarea>
					     </div>
				</div>
				<div class="form-group">
					<label for="selectName3"  class="col-lg-1 control-label">内容</label> 
					 <div class="col-lg-8">
					    <textarea class="form-control" rows="12"></textarea>
					     </div>
				</div>
				
				
					 <div class="form-group">
						<label for="name"  class="col-lg-1 control-label"> 上传图片</label>
						<input class = "a" type="file" name="file1"><br/>
					</div>
				 <div class="form-group">
						<button type="button" class="btn btn-info btn-sm " id="addUser"
							style="margin-left: 15px">
							 上传
						</button>
					</div>

				</form>
		
</div>

	


	<script type="text/javascript">
	
	</script>
</body>





