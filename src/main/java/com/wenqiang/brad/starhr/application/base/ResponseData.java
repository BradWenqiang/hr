package com.wenqiang.brad.starhr.application.base;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResponseData {
    /**
     * 返回的code
     */
    private int code;

    /**
     * 错误信息
     */
    private String message;

    /**
     * 返回的数据
     */
    private Object data;

}
