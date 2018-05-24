package manage.service;	
	
import manage.base.BaseService;
import manage.model.Train;	
	
	
public interface TrainService<T> extends BaseService<T>{

	String validate(Train train, String method) throws Exception;	
		
		
}	
