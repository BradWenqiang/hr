package manage.service;	
	
import manage.base.BaseService;
import manage.model.Employee;	
	
	
public interface EmployeeService<T> extends BaseService<T>{

	String validate(Employee employee, String method) throws Exception;	
		
		
}	
