package com.wenqiang.brad.starhr.domain.auth_menu_agg;

import com.wenqiang.brad.starhr.domain.auth_menu_agg.entity.AuthMenuEntity;
import lombok.Data;

import java.util.List;

/**
 * Author: Brad WenQiang
 * Data: 2022-06-27 00:55
 */
@Data
public class AuthMenuAgg {
    private List<AuthMenuEntity> authMenuEntityList;

}
