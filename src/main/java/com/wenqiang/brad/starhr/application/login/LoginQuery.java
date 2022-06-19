package com.wenqiang.brad.starhr.application.login;

import com.wenqiang.brad.starhr.application.login.req.LoginRequest;
import com.wenqiang.brad.starhr.infra.exception.BusinessException;
import com.wenqiang.brad.starhr.infra.exception.ExceptionEnum;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginQuery {

    @GetMapping("login")
    @ResponseBody
    public String login(LoginRequest req) {
        if (req.getUsername().equals("aaaaa") && req.getPassword().equals("bbbbb")) {
            return "登录成功";
        }
        throw new BusinessException(ExceptionEnum.LOGIN_PASSWORD_ERROR);
    }

}
