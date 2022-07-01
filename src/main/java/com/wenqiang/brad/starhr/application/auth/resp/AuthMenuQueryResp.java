package com.wenqiang.brad.starhr.application.auth.resp;

import com.wenqiang.brad.starhr.domain.auth_menu_agg.entity.AuthMenuEntity;
import lombok.Data;

import java.util.List;

/**
 * Author: Brad WenQiang
 * Data: 2022-06-25 12:09
 */
@Data
public class AuthMenuQueryResp {
   private List<AuthMenuEntity> authMenuEntityList;
}
