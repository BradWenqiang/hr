package com.wenqiang.brad.starhr.infra.conf;

import com.wenqiang.brad.starhr.application.base.ApiResponse;
import com.wenqiang.brad.starhr.infra.exception.BusinessException;
import com.wenqiang.brad.starhr.infra.exception.ExceptionEnum;
import com.wenqiang.brad.starhr.infra.utils.ErrorUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * RestControllerAdvice，统一异常处理
 */
@Slf4j
@RestControllerAdvice
public class ExceptionHandlerConfig {
    /**
     * 业务异常处理
     *
     * @param e 业务异常
     * @return
     */
    @ExceptionHandler(value = BusinessException.class)
    @ResponseBody
    public ApiResponse exceptionHandler(BusinessException e) {
        return ApiResponse.error(e.getCode(), e.getErrorMsg());
    }

    /**
     * 未知异常处理
     */
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ApiResponse exceptionHandler(Exception e) {
        // 把错误信息输入到日志中
        log.error(ErrorUtil.errorInfoToString(e));
        return ApiResponse.error(ExceptionEnum.UNKNOWN.getCode(),
                ExceptionEnum.UNKNOWN.getMsg());
    }


    /**
     * 空指针异常
     */
    @ExceptionHandler(value = NullPointerException.class)
    @ResponseBody
    public ApiResponse exceptionHandler(NullPointerException e) {
        log.error(ErrorUtil.errorInfoToString(e));
        return ApiResponse.error(ExceptionEnum.INTERNAL_SERVER_ERROR.getCode(),
                ExceptionEnum.INTERNAL_SERVER_ERROR.getMsg());
    }
}
