package manage.controller;	
	
import org.springframework.beans.factory.annotation.Autowired;	
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;	
import org.springframework.web.bind.annotation.RequestMethod;	
import org.springframework.web.bind.annotation.RequestParam;	
import org.springframework.web.bind.annotation.ResponseBody;	
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import manage.model.Departments;
import manage.model.Employee;
import manage.model.Userinfo;
import manage.service.EmployeeService;
import manage.service.UserinfoService;
import manage.util.PageInfo;
import manage.base.BaseController;	
import java.util.*;	
	
@Controller	
@RequestMapping("/")	
public class EmployeeController extends BaseController {	
		
	@Autowired	
	private EmployeeService employeeService;
	
	
	@RequestMapping(value = "employee", produces = "text/html;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public String find(HttpServletRequest request) {
		String pageSize = request.getParameter("pageSize");
		String currentPage = request.getParameter("currentPage");
		PageInfo page = getPage(pageSize, currentPage);
		@SuppressWarnings("unchecked")
		List<Employee> employeeList = (List<Employee>) employeeService.selectAll(page);
		validate(page);
		HashMap result = new HashMap();
		result.put("arrayList", employeeList );
		result.put("pageInfo", page);
		String returnInfo = JSONObject.toJSONString(result);
		return returnInfo;

	}
	@RequestMapping(value = "employee", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String add(Employee employee) throws Exception {
		String res = employeeService.validate(employee, INSERT);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}
	@RequestMapping(value = "employeeSelect", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String selectByPrimaryKey(@RequestBody String account) {
		String eid = account;
		Employee employee =(Employee) employeeService.selectByPrimaryKey(eid);
		String json = JSONObject.toJSONString(employee);
		return json;
	}
	
	@RequestMapping(value = "employee", produces = "text/html;charset=UTF-8", method = RequestMethod.PUT)
	@ResponseBody
	public String update(Employee employee) throws Exception {
		String res =  employeeService.validate(employee, UPDATE);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}
	
	@RequestMapping(value = "employee", produces = "text/html;charset=UTF-8", method = RequestMethod.DELETE)
	@ResponseBody
	public String delete(@RequestBody String number) throws Exception {
		String eid = number;
		employeeService.deleteByPrimaryKey(eid);
		return "删除成功";

	}
	
		
		
		
}	
