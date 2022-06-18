package com.wenqiang.brad.starhr.application.login;

import com.wenqiang.brad.starhr.application.login.req.LoginRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginQuery {

    @GetMapping("login")
    @ResponseBody
    public String login(LoginRequest req) throws Exception {
        if (req.getUsername().equals("aaaaa") && req.getPassword().equals("bbbbb")){
            return "登录成功";
        }
        return "账号密码错误";
    }

}
