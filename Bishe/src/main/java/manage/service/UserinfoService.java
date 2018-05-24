package manage.service;	
	
import java.util.List;

import manage.base.BaseService;
import manage.model.Userinfo;
import manage.util.PageInfo;	
	
	
public interface UserinfoService<T> extends BaseService<T>{	
		
	List<?> selectAll(PageInfo page);
}	
