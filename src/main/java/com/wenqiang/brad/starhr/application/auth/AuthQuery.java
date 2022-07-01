package com.wenqiang.brad.starhr.application.auth;

import com.wenqiang.brad.starhr.application.auth.req.AuthMenuQueryRequest;
import com.wenqiang.brad.starhr.application.auth.resp.AuthMenuQueryResp;
import com.wenqiang.brad.starhr.domain.auth_menu_agg.entity.AuthMenuEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Author: Brad WenQiang
 * Data: 2022-06-27 00:48
 */
@Controller
@RequestMapping("/auth")
public class AuthQuery {
    @GetMapping("/menu")
    @ResponseBody
    public AuthMenuQueryResp getAuthMenu(AuthMenuQueryRequest req) {
        AuthMenuQueryResp authMenuQueryResp = new AuthMenuQueryResp();
        List<AuthMenuEntity> authMenuEntityList = new ArrayList<>();

        AuthMenuEntity authMenuEntity = new AuthMenuEntity(1,"department");
        AuthMenuEntity authMenuEntity1 = new AuthMenuEntity(2,"employee");
        AuthMenuEntity authMenuEntity2 = new AuthMenuEntity(3,"hhh");

        authMenuEntityList.add(authMenuEntity);
        authMenuEntityList.add(authMenuEntity1);
        authMenuEntityList.add(authMenuEntity2);

        authMenuQueryResp.setAuthMenuEntityList(authMenuEntityList);
        return authMenuQueryResp;
    }
}
