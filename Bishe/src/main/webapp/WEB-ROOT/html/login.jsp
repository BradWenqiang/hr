<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%   
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;   
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<title>后台登录</title>  
</head>  
<body onload="document.loginForm.j_username.focus();">  
    <!-- 登录表单 -->  
    <form name="loginForm" action="<c:url value='/j_spring_security_check'/>" method="post">  
        <!-- 登录失败后，显示之前的登录名 -->  
        用户名：<input type='text' name='j_username' class="txtinput"  
        value='<c:if test="${not empty param.login_error}" >  
        <c:out value="${SPRING_SECURITY_LAST_USERNAME}"/></c:if>' />  
        <br />  
        密码：<input type='password' name='j_password' class="txtinput" />  
        <br />  
          
        <input type="checkbox" name="_spring_security_remember_me" />  
        &nbsp;保存登录信息  
        <input name="submit" type="submit" value="提交" />  
        <input name="reset" type="reset" value="重置" />  
          
    </form>  
    <br />  
    <!-- 显示登录失败原因 -->  
    <c:if test="${not empty param.error}">  
        <font color="red"> 登录失败<br />  
        <br />  
        原因: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />. </font>  
    </c:if>  
    
</body>  
</html> 