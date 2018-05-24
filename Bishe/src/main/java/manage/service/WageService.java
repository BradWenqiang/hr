package manage.service;	
	
import manage.base.BaseService;
import manage.model.Wage;	
	
	
public interface WageService<T> extends BaseService<T>{

	String validate(Wage wage, String uPDATE) throws Exception;	
		
		
}	
