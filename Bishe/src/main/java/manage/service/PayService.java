package manage.service;	
	
import manage.base.BaseService;
import manage.model.Pay;	
	
	
public interface PayService<T> extends BaseService<T>{

	String validate(Pay pay, String method) throws Exception;	
		
		
}	
