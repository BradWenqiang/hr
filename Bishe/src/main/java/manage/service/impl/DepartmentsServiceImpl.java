package manage.service.impl;	
	
import manage.model.Departments;
import manage.model.User;
import manage.service.DepartmentsService;
import manage.util.PageInfo;
import manage.dao.DepartmentsMapper;
import manage.dao.UserMapper;
import java.util.List;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;	
import org.springframework.stereotype.Service;	
import manage.base.BaseServiceImpl;	
	
@Service	
public class DepartmentsServiceImpl extends BaseServiceImpl<Departments, DepartmentsMapper> implements DepartmentsService<Departments> {	
	private static Logger logger = LogManager.getLogger(DepartmentsServiceImpl.class);
	@Autowired	
    private DepartmentsMapper departmentsMapper;
	@Autowired	
	private UserMapper userMapper;

	public List<Departments> selectAll(PageInfo page,String depNum,String depName) {
		List<Departments> DepartmentsList = departmentsMapper.selectAllListPage(page,depNum,depName);
		return DepartmentsList;
	}	
	//删除部门，因为有外键
	@SuppressWarnings("null")
	public String deleteByPrimary(String num ) throws Exception {
		try {
			//先查询该部门下是否有员工
			List<User> depList = userMapper.selectBydepNumber(num);
			if (depList.size()!=0) {
				//有员工就不删
				return "该部门下尚有员工，请先将员工删除或转移后再删除该部门";
			}
		} catch (Exception e) {
			logger.error("删除部门时，查询员工失败：" + e);
			throw new Exception("删除部门时，查询员工失败：" + e);
		}
		try {
			//没有员工，删除
			departmentsMapper.deleteByPrimaryKey(num);
		} catch (Exception e) {
			logger.error("删除失败：" + e);
			throw new Exception("删除失败：" + e);
		}
		 return "删除成功";
		
	}	
	
	public String validate(Departments dep,String method) throws Exception{
		
			if (!(method.equals("update"))) {
				if (departmentsMapper.selectByPrimaryKey(dep.getName()) != null) {
					return "部门编号已经存在";
				}
			}
		
		if (method == "update" || method.equals("update")) {
			try {
				departmentsMapper.updateByPrimaryKey(dep);
			} catch (Exception e) {
				logger.error("部门更新失败：" + e);
				throw new Exception("部门更新失败：" + e);
			}
			return "更新成功";
		} else {
			try {
				departmentsMapper.insert(dep);
			} catch (Exception e) {
				logger.error("部门增加失败：" + e);
				throw new Exception("部门增加失败：" + e);
			}
			return "增加成功";

		}

	}
		
		
}	
