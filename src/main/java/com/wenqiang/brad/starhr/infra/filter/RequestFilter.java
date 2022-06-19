package com.wenqiang.brad.starhr.infra.filter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.ContentCachingRequestWrapper;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.TreeMap;

/**
 * Author: Brad WenQiang
 * Data: 2022-06-19 12:07
 */
@Slf4j
@Component
public class RequestFilter extends OncePerRequestFilter {

    private static ObjectMapper objectMapper = new ObjectMapper();

    /**
     * @param request
     * @param response
     * @param filterChain
     */
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        boolean isFirstRequest = !isAsyncDispatch(request);

        //包装缓存requestBody信息
        HttpServletRequest requestToUse = request;
        if (isFirstRequest && !(request instanceof ContentCachingRequestWrapper)) {
            requestToUse = new ContentCachingRequestWrapper(request);
        }


        long start = System.currentTimeMillis();

        filterChain.doFilter(requestToUse, response);

        //记录请求日志
        logRequest(requestToUse, start);

    }

    private void logRequest(HttpServletRequest requestToUse, long start) {
        logger.info(createRequestMessage(requestToUse, start));
    }


    private String createRequestMessage(HttpServletRequest request, long start){
        HashMap map = new LinkedHashMap();
        long end = System.currentTimeMillis();
        map.put("uri", request.getRequestURI());
        map.put("method", request.getMethod());
        map.put("param", request.getQueryString());
        map.put("cost", ((end - start) / 1000) + "ms" );
        try {
            return objectMapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            logger.error(e);
            return "";
        }
    }


}
