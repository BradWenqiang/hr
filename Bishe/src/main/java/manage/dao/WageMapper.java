package manage.dao;

import java.util.List;

import manage.base.BaseMapper;
import manage.model.Employee;
import manage.model.Wage;
import manage.util.PageInfo;

public interface WageMapper extends BaseMapper<Wage> {
    int deleteByPrimaryKey(String account);

    int insert(Wage record);

    int insertSelective(Wage record);

    Wage selectByPrimaryKey(String account);

    int updateByPrimaryKeySelective(Wage record);

    int updateByPrimaryKey(Wage record);
    
    List<Wage> selectAllListPage(PageInfo page);
}