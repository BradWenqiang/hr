package manage.service.impl;	
	
import manage.model.Userinfo;	
import manage.service.UserinfoService;	
import manage.dao.UserinfoMapper;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;	
import org.springframework.stereotype.Service;	
import manage.base.BaseServiceImpl;	
	
@Service("UserinfoServiceImpl")	
public class UserinfoServiceImpl extends BaseServiceImpl<Userinfo, UserinfoMapper> implements UserinfoService<Userinfo> {	
	
	private static Logger logger = LogManager.getLogger(UserinfoServiceImpl.class);
	@Autowired	
    private UserinfoMapper userinfoMapper;

	public String insert(Userinfo user){
		if (userinfoMapper.selectByPrimaryKey(user.getUsernumber()) != null) {
			return "部门编号已经存在";
		}		
		userinfoMapper.insert(user);
		return "新增成功";
		
	}
	
	public String updateByPrimaryKey(Userinfo user){
		userinfoMapper.updateByPrimaryKey(user);
		return "更新成功";
	}
		
		
}	
