package manage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import manage.base.BaseMapper;
import manage.model.Departments;
import manage.model.User;
import manage.util.PageInfo;

public interface DepartmentsMapper extends BaseMapper<Departments> {
	public List<Departments> selectAllListPage(@Param("page") PageInfo page, @Param("number")String number, @Param("name")String name);
}