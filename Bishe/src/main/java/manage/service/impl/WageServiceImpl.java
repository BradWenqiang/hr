package manage.service.impl;	
	

import manage.model.Wage;	
import manage.service.WageService;
import manage.dao.WageMapper;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;	
import org.springframework.stereotype.Service;	
import manage.base.BaseServiceImpl;
import manage.controller.WageController;	
	
@Service	
public class WageServiceImpl extends BaseServiceImpl<Wage, WageMapper> implements WageService<Wage> {	
		
	@Autowired	
    private WageMapper wageMapper;	
	private static Logger logger = LogManager.getLogger(WageController.class);	
	public String validate(Wage wage, String method) throws Exception {
		if (!(method.equals("update"))) {
			if (wageMapper.selectByPrimaryKey(wage.getAccount())!=null) {
				return "招聘编号已经存在";
			}
			 try {
				 wageMapper.insert(wage);
			    } catch (Exception e) {
				    logger.error("招聘员工信息增加失败：" + e);
				    throw new Exception("招聘员工信息增加失败：" + e);
			    }
			       return "增加成功";
		}
	
	    if (method == "update" || method.equals("update")) {
		    try {
		    	wageMapper.updateByPrimaryKey(wage);
		    } catch (Exception e) {
			    logger.error("招聘员工信息更新失败：" + e);
			    throw new Exception("招聘员工信息更新失败：" + e);
		    }
		        return "更新成功";
	    } 
		    return "success";
	}	
		
		
}	
