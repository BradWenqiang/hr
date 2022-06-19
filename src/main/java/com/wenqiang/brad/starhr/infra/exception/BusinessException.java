package com.wenqiang.brad.starhr.infra.exception;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BusinessException extends RuntimeException {

    private ExceptionEnum exceptionEnum;
    private String code;
    private String errorMsg;


    public BusinessException(ExceptionEnum exceptionEnum) {
        super("{code:" + exceptionEnum.getCode() + ",errorMsg:" + exceptionEnum.getMsg() + "}");
        this.exceptionEnum = exceptionEnum;
        this.code = exceptionEnum.getCode();
        this.errorMsg = exceptionEnum.getMsg();
    }

    public BusinessException(String code, String errorMsg) {
        super("{code:" + code + ",errorMsg:" + errorMsg + "}");
        this.code = code;
        this.errorMsg = errorMsg;
    }

    public BusinessException(String code, String errorMsg, Object... args) {
        super("{code:" + code + ",errorMsg:" + String.format(errorMsg, args) + "}");
        this.code = code;
        this.errorMsg = String.format(errorMsg, args);
    }

    public ExceptionEnum getExceptionEnum() {
        return exceptionEnum;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}
