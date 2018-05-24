package manage.dao;

import java.util.List;

import manage.base.BaseMapper;
import manage.model.Pay;
import manage.util.PageInfo;

public interface PayMapper extends BaseMapper<Pay> {
    int deleteByPrimaryKey(String account);

    int insert(Pay record);

    int insertSelective(Pay record);

    Pay selectByPrimaryKey(String account);

    int updateByPrimaryKeySelective(Pay record);

    int updateByPrimaryKey(Pay record);
    
    List<Pay> selectAllListPage(PageInfo page);
}