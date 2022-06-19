package com.wenqiang.brad.starhr.application.base;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApiResponse {
    /**
     * 返回的code
     */
    private String code;

    /**
     * 错误信息
     */
    private String message;

    /**
     * 返回的数据
     */
    private Object data;

    public static ApiResponse error(String code,String message){
        return ApiResponse.builder().code(code).message(message).build();
    }

}
