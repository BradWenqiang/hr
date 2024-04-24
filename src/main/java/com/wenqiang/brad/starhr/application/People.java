package com.wenqiang.brad.starhr.application;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 首页控制器
 * @author pan_junbiao
 **/
@Controller
public class People
{
    /**
     * 首页
     */
    @RequestMapping("/people")
    public String index(HttpServletRequest request)
    {
        //将用户信息保存到Request对象中
        request.setAttribute("name","pan_junbiao的博客");
        request.setAttribute("blog","https://blog.csdn.net/pan_junbiao");
        request.setAttribute("remark","您好，欢迎访问 pan_junbiao的博客");

        //返回首页
        return "page/people";
    }

    @RequestMapping("/peopleDetail")
    public String zixunDetail(HttpServletRequest request)
    {
        //将用户信息保存到Request对象中
        request.setAttribute("name","pan_junbiao的博客");
        request.setAttribute("blog","https://blog.csdn.net/pan_junbiao");
        request.setAttribute("remark","您好，欢迎访问 pan_junbiao的博客");

        //返回首页
        return "page/people/people_detail";
    }
}