package com.wenqiang.brad.starhr.infra.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.omg.CORBA.UNKNOWN;

@AllArgsConstructor
@Getter
public enum ExceptionEnum {

    // 400
    BAD_REQUEST("400", "请求数据格式不正确!"),
    UNAUTHORIZED("401", "登录凭证过期!"),
    FORBIDDEN("403", "没有访问权限!"),
    NOT_FOUND("404", "请求的资源找不到!"),

    // 500
    INTERNAL_SERVER_ERROR("500", "服务器打瞌睡啦....，请稍后再试"),
    SERVICE_UNAVAILABLE("503", "服务器正忙，请稍后再试!"),


    // 未知异常
    UNKNOWN("10000", "未知异常!"),

    // 自定义
    IS_NOT_NULL("10001", "%s不能为空"),

    LOGIN_PASSWORD_ERROR("10100", "账号密码错误");


    public String code;
    public String msg;

}
