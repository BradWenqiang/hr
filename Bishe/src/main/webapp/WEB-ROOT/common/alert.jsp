<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 模态框（Modal） -->
		<div class="modal fade" id="alertModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		    <div class="modal-dialog" style="width:300px ; margin-top:15% ;">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" id= "alertQuit" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="myModalLabel">提示</h4>
		            </div>
		            <div class="modal-body" id="alertText" align="center">删除失败</div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-primary" id= "alertSubmit"  >确定</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div>
		</div>
		<script type="text/javascript">
		 $("#alertSubmit").click(function(){
			// alert("aaa");
			 selectList();
			 $("#alertQuit").click();
		 });
		
		
		</script>
</body>