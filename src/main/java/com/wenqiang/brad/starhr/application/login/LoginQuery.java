package com.wenqiang.brad.starhr.application.login;

import com.wenqiang.brad.starhr.application.login.req.LoginRequest;
import com.wenqiang.brad.starhr.application.login.resp.LoginResp;
import com.wenqiang.brad.starhr.infra.exception.BusinessException;
import com.wenqiang.brad.starhr.infra.exception.ExceptionEnum;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginQuery {

    @GetMapping("login")
    @ResponseBody
    public LoginResp login(LoginRequest req) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        if (req.getUsername().equals("admin") && req.getPassword().equals("admin")) {
            LoginResp loginResp = new LoginResp();
            loginResp.setNickname("超级管理员");
            loginResp.setUserNo("asdf");
            return loginResp;
        }
        throw new BusinessException(ExceptionEnum.LOGIN_PASSWORD_ERROR);
    }

}
