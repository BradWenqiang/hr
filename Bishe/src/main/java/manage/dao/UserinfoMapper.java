package manage.dao;

import java.util.List;

import manage.base.BaseMapper;
import manage.model.UserPo;
import manage.model.Userinfo;
import manage.util.PageInfo;

public interface UserinfoMapper extends BaseMapper<Userinfo> {
    int deleteByPrimaryKey(String usernumber);

    int insert(Userinfo record);

    int insertSelective(Userinfo record);

    Userinfo selectByPrimaryKey(String usernumber);

    int updateByPrimaryKeySelective(Userinfo record);

    int updateByPrimaryKey(Userinfo record);
    
    List<Userinfo> selectAllListPage(PageInfo page);
}