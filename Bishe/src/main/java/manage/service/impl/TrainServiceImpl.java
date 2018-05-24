package manage.service.impl;	
	
import manage.model.Train;	
import manage.service.TrainService;	
import manage.dao.TrainMapper;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;	
import org.springframework.stereotype.Service;	
import manage.base.BaseServiceImpl;
import manage.controller.EmployeeController;	
	
@Service	
public class TrainServiceImpl extends BaseServiceImpl<Train, TrainMapper> implements TrainService<Train> {	
	private static Logger logger = LogManager.getLogger(EmployeeController.class);	
	@Autowired	
    private TrainMapper trainMapper;	

	public String validate(Train train, String method) throws Exception {
		if (!(method.equals("update"))) {
			if (trainMapper.selectByPrimaryKey(train.getTid())!=null) {
				return "培训编号已经存在";
			}
			 try {
				 trainMapper.insert(train);
			    } catch (Exception e) {
				    logger.error("培训信息增加失败：" + e);
				    throw new Exception("培训信息增加失败：" + e);
			    }
			       return "增加成功";
		}
	
	    if (method == "update" || method.equals("update")) {
		    try {
		    	trainMapper.updateByPrimaryKey(train);
		    } catch (Exception e) {
			    logger.error("培训信息更新失败：" + e);
			    throw new Exception("培训信息更新失败：" + e);
		    }
		        return "更新成功";
	    } 
		    return "success";
	}
				
		
		
}	
