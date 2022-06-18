package com.wenqiang.brad.starhr.infra.aop;

import com.alibaba.fastjson.JSON;
import com.oracle.tools.packager.Log;
import com.wenqiang.brad.starhr.application.base.ResponseData;
import com.wenqiang.brad.starhr.application.exception.BaseException;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Slf4j
@Aspect
@Order(100)
@Component
public class ResponseAspect {
    /**
     * 切面方法
     * 封装函数返回值
     */
    @Pointcut("execution(public * com.wenqiang.brad.starhr.application..*(..))")
    public void wrapResponse() {
        Log.info("Wrap HttpResponse");
    }

    /**
     * 环切方法
     *
     * @param proceedingJoinPoint
     * @return
     */
    @Around(value = "wrapResponse()")
    public String doAround(ProceedingJoinPoint proceedingJoinPoint) {

        ResponseData re;

        try {
            //获取方法的执行结果
            Object obj = proceedingJoinPoint.proceed();
            //判断返回类型是否是ResponseData
            if (obj instanceof ResponseData) {
                return JSON.toJSONString(obj);
            }

            //构建返回对象
            re = ResponseData.builder().code(200).message("success")
                    .data(obj).build();
        } catch (Throwable th) {
            if (th instanceof BaseException) {
                //构自定义异常
                re = ResponseData.builder().code(((BaseException) th).getCode())
                        .message(th.getMessage()).build();
            } else {
                //非自定义异常
                re = ResponseData.builder().code(500)
                        .message(th.getMessage()).build();
            }
            log.error(re.getMessage());

        }
        return JSON.toJSONString(re);
    }

}
