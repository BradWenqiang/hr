package com.wenqiang.brad.starhr.application.exception;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class BaseException extends Exception {
    private int code;
    private String message;
}
