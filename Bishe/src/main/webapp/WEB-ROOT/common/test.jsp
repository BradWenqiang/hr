<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <!-- Bootstrap -->
 <link href="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
 <link href="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" media="screen">
 <title>JS框架学习</title>
 
 </head>
 <body onload="loadUserDatas()">
 <div class="container">
 <table class="table" id="table">
  <caption><h2>练习一</h2></caption>
  <caption>
    <button type="button" class="btn btn-info" id="user_add" data-toggle="modal"
  data-target="#myModal" onclick="optionUserData(this);">新增</button>
    <button type="button" class="btn btn-info" id="user_delete" onclick="optionUserData(this);">删除</button>
    <button type="button" class="btn btn-info" id="user_edit" data-toggle="modal"
  data-target="#myModal" onclick="optionUserData(this);">编辑</button>
    <button type="button" class="btn btn-info" id="user_find" onclick="optionUserData(this);">查询</button>
    <input type="text" id="s_code" placeholder="按工号查询" style="width: 80px;">
    <input type="text" id="s_userName" placeholder="按姓名查询" style="width: 80px;">
    <input type="text" id="s_all" placeholder="全文搜索" style="width: 80px;">
  </caption>
  <thead>
   <tr>
    <th>序号</th>
    <th>工号</th>
    <th>姓名</th>
    <th>性别</th>
    <th>密码</th>
    <th>年龄</th>
    <th>出生日期</th>
   </tr>
  </thead>
  <tbody id="tbody">
  </tbody>
 </table>
 
 <!-- 模态框（Modal） -->
 <div class="modal hide" id="myModal" role="dialog" >
  <div class="modal-dialog">
   <div class="modal-content">
    <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> 
      ×
    </button>
    <h4 class="modal-title" id="myModalLabel">
      新增用户
    </h4>
    </div>
    <div class="modal-body" id="modal-body">
    <label for="name">工号:</label>
     <input type="text" class="form-control" id="m_code" placeholder="请输入工号">
     <label for="name">姓名:</label>
     <input type="text" class="form-control" id="m_userName" placeholder="请输入姓名">
     <label for="name">性别:</label>
     <input type="text" class="form-control" id="m_sex" placeholder="请输入性别">
     <label for="name">密码:</label>
     <input type="text" class="form-control" id="m_passWord" placeholder="请输入密码">
     <label for="name">年龄:</label>
     <input type="text" class="form-control" id="m_age" placeholder="请输入年龄">
     <label for="name">出生日期:</label>
     <input type="text" class="form-control" id="m_birthday" placeholder="请输入出生日期">
    </div>
    <div class="modal-footer">
    <button type="button" class="btn btn-default"
     data-dismiss="modal">保存
    </button>
    <button type="button" class="btn btn-primary">提交更改</button>
    </div>
   </div><!-- /.modal-content -->
 </div><!-- /.modal -->
 </div>
 <!-- 这里需要引入相关的js，很重要，请记住 -->
 <script type="text/javascript" src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/jquery-min.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/index.js"></script>
 </body>
 </html>
