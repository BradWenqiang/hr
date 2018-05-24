<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
href="<%=request.getContextPath() %>/WEB-ROOT/css/common.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
	<form class="form-inline" role="form">
	 <div class="row"> 
		  <div class="form-group inputselect col-lg-4">
		    <label for="name">员工姓名</label>
		    <input type="text" class=" form-control "  id="name" placeholder="请输入名称">
		  </div>
		  <div class="form-group inputselect col-lg-4" >
		    <label for="name">员工号码</label>
		    <input type="text" class="form-control  " id="name" placeholder="请输入名称">
		  </div>
	  </div>
	   <div class="form-group inputselect">
	    <label for="name">名称</label>
	    <input type="text" class="form-control" id="name" placeholder="请输入名称">
	  </div>
	<button type="button" class="btn btn-info btn-sm inputselect " style="margin-left: 45px">
    <span class="glyphicon glyphicon-user"></span> 搜索
	</button>
	<button type="button" class="btn btn-info btn-sm inputselect" style="margin-left: 15px">
    <span class="glyphicon glyphicon-user"></span> 查询
	</button>
	
	</form>
	
	<div class="table-responsive " style="margin-left: 3% ;">
  <table class="table table-hover tablefont" >
    <thead>
      <tr>
        <th >产品</th>
        <th >付款日期</th>
        <th>状态</th>
        <th>状态</th>
        <th>状态</th></tr>
        
    </thead>
    <tbody>
      <tr>
        <td>产品1</td>
        <td>23/11/2013</td>
        <td>23/11/2013</td>
        <td>产品1</td>
        <td><a> <span class="glyphicon glyphicon-user"></span> 查询</a>
        <a><span class="glyphicon glyphicon-user"></span>删除</a></td></tr>
      <tr>
        <td>产品1</td>
        <td>23/11/2013</td>
        <td>待发货</td></tr>
      <tr>
        <td>产品1</td>
        <td>23/11/2013</td>
        <td>待发货</td></tr>
      <tr>
        <td>产品1</td>
        <td>23/11/2013</td>
        <td>待发货</td></tr>
      <tr>
        <td>产品1</td>
        <td>23/11/2013</td>
        <td>待发货</td></tr>
      <tr>
        <td>产品1</td>
        <td>23/11/2013</td>
        <td>待发货</td></tr>
      <tr>
        <td>产品2</td>
        <td>10/11/2013</td>
        <td>发货中</td></tr>
      <tr>
        <td>产品3</td>
        <td>20/10/2013</td>
        <td>待确认</td></tr>
         <tr>
        <td>产品3</td>
        <td>20/10/2013</td>
        <td>待确认</td></tr>
      <tr>
        <td>产品4</td>
        <td>20/10/2013</td>
        <td>已退货</td></tr>
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
	
	
	<script src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/jquery-min.js"></script>
<script src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/bootstrap.min.js"></script>
</body>





