package manage.dao;

import java.util.List;

import manage.base.BaseMapper;
import manage.model.Employee;
import manage.model.Userinfo;
import manage.util.PageInfo;

public interface EmployeeMapper extends BaseMapper<Employee>{
    int deleteByPrimaryKey(String eid);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(String eid);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
    
    List<Employee> selectAllListPage(PageInfo page);
}