package manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import manage.model.Departments;
import manage.model.User;
import manage.service.DepartmentsService;
import manage.util.BiSheUtil;
import manage.util.PageInfo;
import manage.base.BaseController;
import java.util.*;

/**
* @author 曲文强
* @version 创建时间：2018.04.18
* @describe： 员工部门
*/

@Controller
@RequestMapping("/")
public class DepartmentsController extends BaseController<Departments, DepartmentsService<Departments>> {

	@Autowired
	private DepartmentsService<Departments> departmentsService;

	/*
	 * @author
	 * 
	 * @description
	 * 
	 * @date
	 */
	@RequestMapping(value = "departments", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String add(Departments departments) throws Exception {
		String res = departmentsService.validate(departments, INSERT);
		// String res = userServiceImpl.insertAdd(user);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}
	
	@RequestMapping(value = "departments", produces = "text/html;charset=UTF-8", method = RequestMethod.PUT)
	@ResponseBody
	public String update(Departments departments) throws Exception {
		String res = departmentsService.validate(departments, UPDATE);
		// String res = userServiceImpl.updateByPrimaryKeySelective(user);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}
	
	
	@RequestMapping(value = "departments", produces = "text/html;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public String find(HttpServletRequest request) {
 		 String pageSize = request.getParameter("pageSize");
		 String currentPage = request.getParameter("currentPage");
		 String depNum = request.getParameter("depNum");
		 String depName = request.getParameter("depName");
		 if (!BiSheUtil.notNull(depNum)) {
			 depNum = null;
			}
		 if (!BiSheUtil.notNull(depName)) {
			 depName = null;
			}
		  PageInfo page= getPage(pageSize, currentPage); 
		  @SuppressWarnings("unchecked")
		List<Departments> departmentsList = (List<Departments>) departmentsService.selectAll(page,depNum,depName); 
		  validate(page);
		  HashMap result = new HashMap();
			result.put("arrayList", departmentsList);
			result.put("pageInfo", page);
			String returnInfo = JSONObject.toJSONString(result);
			return returnInfo;
		
	}

	
	@RequestMapping(value = "departmentsSelect", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String selectByPrimaryKey(@RequestBody String account) {
		String depNumber = account;
		Departments departments = departmentsService.selectByPrimaryKey(depNumber);
		String json = JSONObject.toJSONString(departments);
		return json;
	}

	@RequestMapping(value = "departments", produces = "text/html;charset=UTF-8", method = RequestMethod.DELETE)
	@ResponseBody
	public String delete(@RequestBody String number) throws Exception {
		String depNumber = number;
		String info = departmentsService.deleteByPrimary(depNumber);
		return info;

	}
}
