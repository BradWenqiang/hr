package manage.service.impl;	
	
import manage.model.Departments;
import manage.model.Employee;	
import manage.service.EmployeeService;	
import manage.dao.EmployeeMapper;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;	
import org.springframework.stereotype.Service;	
import manage.base.BaseServiceImpl;
import manage.controller.EmployeeController;
import manage.controller.UserController;	
	
@Service	
public class EmployeeServiceImpl extends BaseServiceImpl<Employee, EmployeeMapper> implements EmployeeService<Employee> {	
	private static Logger logger = LogManager.getLogger(EmployeeController.class);	
	@Autowired	
    private EmployeeMapper employeeMapper;

	public String validate(Employee employee, String method) throws Exception {
		if (!(method.equals("update"))) {
			if (employeeMapper.selectByPrimaryKey(employee.getEid())!=null) {
				return "招聘编号已经存在";
			}
			 try {
				    employeeMapper.insert(employee);
			    } catch (Exception e) {
				    logger.error("招聘员工信息增加失败：" + e);
				    throw new Exception("招聘员工信息增加失败：" + e);
			    }
			       return "增加成功";
		}
	
	    if (method == "update" || method.equals("update")) {
		    try {
			   employeeMapper.updateByPrimaryKey(employee);
		    } catch (Exception e) {
			    logger.error("招聘员工信息更新失败：" + e);
			    throw new Exception("招聘员工信息更新失败：" + e);
		    }
		        return "更新成功";
	    } 
		    return "success";
	}
			
}	
