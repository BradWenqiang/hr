package com.wenqiang.brad.starhr.infra.conf;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wenqiang.brad.starhr.application.base.ApiResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

@ControllerAdvice
public class ResponseBodyConfig implements ResponseBodyAdvice<Object> {
    /**
     * supports方法要返回为true才会执行beforeBodyWrite方法
     */
    @Override
    public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> aClass) {
        // 如果返回值类型是JsonResponse, 直接返回false就好了
        return !returnType.getParameterType().equals(ApiResponse.class);
    }

    @Override
    public Object beforeBodyWrite(Object data, MethodParameter returnType, MediaType mediaType, Class<? extends HttpMessageConverter<?>> aClass, ServerHttpRequest request, ServerHttpResponse response) {

        // String类型不能直接包装，需要特别处理
        if (returnType.getParameterType().equals(String.class)) {
            ObjectMapper objectMapper = new ObjectMapper();
            try {
                // 将数据包装在JsonResponse里返回
                return objectMapper.writeValueAsString(ApiResponse.builder().code("200").data(data).build());
            } catch (Exception e) {
                throw new RuntimeException("返回String类型错误");
            }
        }

        if (StringUtils.equals(returnType.getParameterType().getName(), "void") && mediaType.equals(MediaType.APPLICATION_JSON)) {
            return ApiResponse.builder().code("200").data("").build();
        }

        return ApiResponse.builder().code("200").data(data).build();
    }

}
