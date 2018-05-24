package manage.service;	
	

import java.util.List;

import manage.base.BaseService;
import manage.model.User;
import manage.model.UserPo;
import manage.util.PageInfo;
	
public interface UserService<T> extends BaseService<T> {	
		
	//public String insertAdd(User record);
	public String validate(User user,String method) throws Exception;
	//public List<UserPo> selectAll( PageInfo page);
	List<?> selectAll(PageInfo page, String depNumber,String userNum,String userName);
	
	void deleteList(String[] deleteList);
	
}	
/*public interface UserService {	
	User h(String a);
	
}	*/
