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
<body class="full">
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
							class="form-control  " id="selectName" name ="username" placeholder="请输入名称">
					</div>
					<div class="form-group inputselect col-lg-4">
						<label for="name">员工编号</label> <input type="text"
							class=" form-control " id="selectNumber" name ="account" placeholder="请输入名称">
					</div>
					<!-- <div class="form-group inputselect col-lg-4">
						<label for="name">员工权限</label> <input type="text"
							class="form-control" id="selectAuthority" placeholder="请输入名称">
					</div> -->
					<div class="form-group inputselect col-lg-4">
						<button type="button" class="btn btn-success btn-sm " id="selectByVal">
							<span class="glyphicon glyphicon-user"></span> 搜索
						</button>
						<button type="button" class="btn btn-success btn-sm " id="resettingUser">
							<span class="glyphicon glyphicon-user"></span> 重置
						</button>
						<button type="button" class="btn btn-info btn-sm " id="addUser"
							style="margin-left: 15px">
							<span class="glyphicon glyphicon-user"></span> 新增员工
						</button>
					</div>
				</div>


			</form>

			<div class="table-responsive " style="margin-left: 3%;">

				<table class="table table-hover tablefont">
					<thead>
						<tr>
							<th>姓名</th>
							<th>员工编号</th>
							<th>密码</th>
							<th>权限</th>
							<th>所属部门</th>
							<th>操作</th>
						</tr>

					</thead>
					<tbody id="tbody">
						<c:forEach items="${list}" var="item">
							<tr>
								<td>${item.username}</td>
								<td>${item.account}</td>
								<td>${item.password}</td>
								<td>${item.authority}</td>
								<td>${item.departments.name}</td>
								<td><button type="button" class="btn btn-info btn-sm " 
										id="edit">
										<span class="glyphicon glyphicon-user"></span> 编辑
									</button>
									<button type="button" class="btn btn-info btn-sm " id="delete">
										<span class="glyphicon glyphicon-user"></span> 删除
									</button></td>
							</tr>
						</c:forEach>

					</tbody>

				</table>
				<div style="bottom: 10%">
					<h3 id="pagetext">显示第&nbsp;${pageEntity.currentResult}&nbsp;至&nbsp;${pageEntity.localResult}&nbsp;项，共&nbsp;${pageEntity.totalResult}&nbsp;项</h3>


				</div>
				<div id="paging" style="text-align: center; margin-right: 10%;"
					pagination="pagination_new" pagenumber="${pageEntity.currentPage}"
					totalpage="${pageEntity.lastPage}" paginationMaxLength="8"
					onlyOnePageIsShow="true"></div>
			</div>
		</div>

	</div>
<%-- 	<script
		src="<%=request.getContextPath() %>/WEB-ROOT/bootstrap/js/treeview.js"></script>
	<script src="<%=request.getContextPath() %>/WEB-ROOT/js/pagination.js"></script> --%>


	<script type="text/javascript">
	
$("#resettingUser").click(function(){
	$("#selectNumber").val("");
	$("#selectName").val("");
	//$("#selectAuthority").val("");
	});

$("#selectByVal").click(function(){
	var user = getFormData($("#selectUserVal"));
	var pagenumber = $("#paging").attr('pagenumber');
	 selectList(true,pagenumber,currentDep,user.account,user.username);
	});
	
	
		
	 
		/* $('#tree').treeview(
				{data: getTree(),
					showBorder:false
				}
		); */
		
	/* 	function getTree() {
			var tree = [
			            {
			              text: "Parent 1",
			              icon: "glyphicon glyphicon-stop",
			              selectedIcon: "glyphicon glyphicon-stop",
			              nodes: [
			                {
			                  text: "Child 1",
			                  nodes: [
			                    {
			                      text: "Grandchild 1"
			                    },
			                    {
			                      text: "Grandchild 2"
			                    }
			                  ]
			                },
			                {
			                  text: "Child 2"
			                }
			              ]
			            },
			            {
			              text: "Parent 2"
			            },
			            {
			              text: "Parent 3"
			            },
			            {
			              text: "Parent 4"
			            },
			            {
			              text: "Parent 5"
			            }
			          ];
		    return tree;
		};
		 */
		
		 
		 function paginationClick(pagination_id){  
		        var pagenumber = $('#'+pagination_id+'').attr('pagenumber');  
		        selectList(true,pagenumber,currentDep,currentUserNum,currentDepuserName);
		    }  
		 
		//页面初始化查询
		var flag = "${list}";
		var currentDep = "${depNumber}";
		var currentUserNum = "${userNum}";
		var currentDepuserName = "${userName}";
		//var currentDepuserAutho = "${userAutho}";
		//var flag = "${list}";  
		//var pageFalg = "false";
		$(selectList = function(update,number,depNum,userNum,userName){
			if(update==true){
				flag="";
			}
    		//var localNumber = $('#paging').attr('pagenumber');  
			 $.ajax({
			        type : "get",  //请求方式
			        url : "${pageContext.request.contextPath}/register",  //请求路径
			        cache: false, 
			        data : "number="+number + "&depNum=" +depNum  +"&userNum=" +userNum +"&userName=" +userName ,
			        async: false,
			        //dataType:"json",  
			         contentType:"application/json;charset=utf-8",
			        	//请求参数
			        success : function(msg) {  //异步请求成功执行的回调函数
			        	if(flag==""){
			        	window.location.reload();
			        	}else{
			        		 var i=1
			        	/* 	 
			        		alert(localNumber);
			        		if(localNumber == null&&pageFalg=="false"){
			        			pageFalg="true";
			        			selectList("",1);
			        		}else{
			        			if(pageFalg=="false"){
			        				pageFalg="true";
			        				selectList("",localNumber);
			        			}
			        		}  */
			        	while($('table tr:eq('+ i + ') td:eq(3)').text()!=""){
			        			if($('table tr:eq('+ i + ') td:eq(3)').text()==0){
			        				$('table tr:eq('+ i + ') td:eq(3)').text("员工");
			        			}
			        			if($('table tr:eq('+ i + ') td:eq(3)').text()==1){
			        				$('table tr:eq('+ i + ') td:eq(3)').text("管理员");
			        			}
			        			i++;
			        		}
			        		//刷新分页当前的页数，如果不写此行，刷新后页面的当前页数高亮还是第一页
			        		paginationToolShow();
			        	}	
			        },//ajax引擎一般用不到；状态信息；抛出的异常信息
			        error : function(msg) {
			        }
			    });
			 //左边的部门树利用这个AJAX动态的到数据
			 $.ajax({
			        type : "GET",  //请求方式
			        url : "${pageContext.request.contextPath}/departments",  //请求路径
			        async: true,
			       // dataType:"json",   
			        contentType:"application/json;charset=utf-8",
			        success : function(msg) {  //异步请求成功执行的回调函数
			     	   	 var departmentsList = JSON.parse(msg);
			     	   	$('#tree').treeview(
			    				{data: getTree(departmentsList),
			    					enableLinks : true,
			    					showBorder:false,
			    					highlightSelected:true,
			    				}
			    		); 
			        },//ajax引擎一般用不到；状态信息；抛出的异常信息
			        error : function(msg) {
			        	alert("bb");
			        }
			    });
		})
		
		
		//增加员工
		$("#addUser").click(function(){
			 $("#addUserList").load("WEB-ROOT/html/addUser.jsp",function(){
				$("#addModel").modal({
	     	        keyboard: true
	     	    });
			}) 
			
			$.ajax({
		        type : "GET",  //请求方式
		        url : "${pageContext.request.contextPath}/departments",  //请求路径
		        async: true,
		       // dataType:"json",   
		        contentType:"application/json;charset=utf-8",
		        success : function(msg) {  //异步请求成功执行的回调函数
		        	
		     	   	 var departmentsList = JSON.parse(msg);
		     		//alert(departmentsList[0].name);
		     	 	   $.each(departmentsList,function(i,item){
		     	 		   if(i==0){
		     	 			// $("#departments").append('<option value="11">2</option>')
		     	 			   $("#departments").append("<option data-display="+"'true'"+ "value="+item.number+ ">"+ item.name+"</option>")
		     	 		   }else{
		     	 			 $("#departments").append("<option value="+item.number+">"+item.name+"</option>")
		     	 			 // $("#departments").append('<option value="11">2</option>')
		     	 		   }
		     	 		   //alert($("#departments").val());
		     			//alert(item.name);
		     		});    
		        },//ajax引擎一般用不到；状态信息；抛出的异常信息
		        error : function(msg) {
		        	alert("bb");
		        }
		    });
		
		});
		
		//删除员工
		$("button[id='delete']").click(function(){
			 
			var account = $(this).parent().parent().children("td").eq(1).text();
			if(account!=""){
				  $( "#alert" ).load( "WEB-ROOT/common/alert.jsp", function( response, status, xhr ) {
		        		$('#alert').html(response);
		        }); 
				$.ajax({
			        type : "DELETE",  //请求方式
			        url : "${pageContext.request.contextPath}/register",  //请求路径
			        data: account, 
			        async: true,
			      //  dataType:"json",   
			        contentType:"application/json;charset=utf-8",
			        success : function(msg) {  //异步请求成功执行的回调函数
			        	
			        	/* $("#alertText").text(msg);
			        	$("#alertModel").modal({
			     	        keyboard: true
			     	    }); */
			     	   $("#alertText").text(msg);
			        	$("#alertModel").modal({
			     	        keyboard: true
			     	    });
			        	
			        },//ajax引擎一般用不到；状态信息；抛出的异常信息
			        error : function(msg) {
			        	$("#alertText").text("删除失败");
			        	$("#alertModel").modal({
			     	        keyboard: true
			     	    }); 
			        }
			    });
			}
		})
		
		 getSelectInput =function(){
					 $.ajax({
					        type : "GET",  //请求方式
					        url : "${pageContext.request.contextPath}/departments",  //请求路径
					        async: false,
					       // dataType:"json",   
					        contentType:"application/json;charset=utf-8",
					        success : function(msg) {  //异步请求成功执行的回调函数
					     	   	 var departmentsList = JSON.parse(msg);
					     		//alert(departmentsList[0].name);
					     		//alert("123213");
					     		//alert(departmentsList);
					     	 	   $.each(departmentsList,function(i,item){
					     	 		   if(i==0){
					     	 			  $("#departments").append("<option data-display="+"'true'"+ "value="+item.number+ ">"+ item.name+"</option>")
					     	 		   }else{
					     	 			 $("#departments").append("<option value="+item.number+">"+item.name+"</option>")
					     	 		   }
					     		});    
					        },//ajax引擎一般用不到；状态信息；抛出的异常信息
					        error : function(msg) {
					        	alert("bb");
					        }
					    });
				 }
		
		 //编辑员工
		$("button[id='edit']").click(function(){
			 
			var account = $(this).parent().parent().children("td").eq(1).text();
			if(account!=""){
				 $("#addUserList").load("WEB-ROOT/html/addUser.jsp",function(){
						$("#addModel").modal({
			     	        keyboard: true
			     	    });
					}) 
				
				$.ajax({
			        type : "POST",  //请求方式
			        url : "${pageContext.request.contextPath}/registerSelect",  //请求路径
			        data: account, 
			        async: true,
			       // dataType:"json",   
			        contentType:"application/json;charset=utf-8",
			        success : function(msg) {  //异步请求成功执行的回调函数
			        	
			        	/* $("#alertText").text(msg);
			        	$("#alertModel").modal({
			     	        keyboard: true
			     	    }); */
			     	   var user = JSON.parse(msg);
			     	    if(user!=null){
			     	    	getSelectInput();
			     	    	$("#username").val(user.username);
			     	    	$("#account").val(user.account);
			     	    	$("#password").val(user.password);
			     	    	$("#authority").val(user.authority);
			     	    	$("#departments").val(user.depNumber);
			     			$("#account").attr("readOnly",true);
			     	    	$("#submitType").val("PUT")
			     	    }
			     	  /*  $("#alertText").text(msg);
			        	$("#alertModel").modal({
			     	        keyboard: true
			     	    }); */
			        	
			        },//ajax引擎一般用不到；状态信息；抛出的异常信息
			        error : function(msg) {
			        	alert("bb");
			        }
			    });
				
				
			}
		}) 
		
	</script>
</body>





