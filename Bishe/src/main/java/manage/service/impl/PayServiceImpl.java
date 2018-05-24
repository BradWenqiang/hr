package manage.service.impl;	
	
import manage.model.Pay;
import manage.model.Wage;
import manage.service.PayService;	
import manage.dao.PayMapper;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;	
import org.springframework.stereotype.Service;	
import manage.base.BaseServiceImpl;
import manage.controller.PayController;	
@Service	
public class PayServiceImpl extends BaseServiceImpl<Pay, PayMapper> implements PayService<Pay> {	
		
	@Autowired	
    private PayMapper payMapper;	
	private static Logger logger = LogManager.getLogger(PayController.class);	
	public String validate(Pay pay, String method) throws Exception {
		if (!(method.equals("update"))) {
			if (payMapper.selectByPrimaryKey(pay.getAccount())!=null) {
				return "招聘编号已经存在";
			}
			 try {
				 payMapper.insert(pay);
			    } catch (Exception e) {
				    logger.error("招聘员工信息增加失败：" + e);
				    throw new Exception("招聘员工信息增加失败：" + e);
			    }
			       return "增加成功";
		}
	
	    if (method == "update" || method.equals("update")) {
		    try {
		    	payMapper.updateByPrimaryKey(pay);
		    } catch (Exception e) {
			    logger.error("招聘员工信息更新失败：" + e);
			    throw new Exception("招聘员工信息更新失败：" + e);
		    }
		        return "更新成功";
	    } 
		    return "success";
	}	
			
		
		
}	
