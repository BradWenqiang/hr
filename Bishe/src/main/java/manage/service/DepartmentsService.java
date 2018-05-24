package manage.service;	
	
import java.util.List;

import manage.base.BaseService;
import manage.model.Departments;
import manage.model.User;
import manage.util.PageInfo;	
	
	
public interface DepartmentsService<T> extends BaseService<T>{	
	
	public String deleteByPrimary(String num) throws Exception;
	
	public String validate(Departments dep,String method) throws Exception;
	
	List<?> selectAll(PageInfo page, String depNum,String depName);
}	
