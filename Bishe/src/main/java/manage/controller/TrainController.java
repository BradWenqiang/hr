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

import javax.servlet.http.HttpServletRequest;

import manage.model.Departments;
import manage.model.Employee;
import manage.model.Train;
import manage.service.DepartmentsService;
import manage.service.EmployeeService;
import manage.service.TrainService;
import manage.util.PageInfo;
import manage.base.BaseController;	
import java.util.*;	
	
@Controller	
@RequestMapping("/")	
public class TrainController extends BaseController<Train, TrainService<Train>> {	
		
	@Autowired	
	private TrainService trainService;	
		
	/*	
	 * @author 	
	 * @description	
	 * @date	
	*/
	@RequestMapping(value = "train", produces = "text/html;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public String find(HttpServletRequest request) {
		String pageSize = request.getParameter("pageSize");
		String currentPage = request.getParameter("currentPage");
		PageInfo page = getPage(pageSize, currentPage);
		@SuppressWarnings("unchecked")
		List<Train> trainList = (List<Train>) trainService.selectAll(page);
		validate(page);
		HashMap result = new HashMap();
		result.put("arrayList", trainList );
		result.put("pageInfo", page);
		String returnInfo = JSONObject.toJSONString(result);
		return returnInfo;

	}
	@RequestMapping(value = "train", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String add(Train train) throws Exception {
		String res = trainService.validate(train, INSERT);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}
	@RequestMapping(value = "trainSelect", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String selectByPrimaryKey(@RequestBody String account) {
		String tid = account;
		Train train =(Train) trainService.selectByPrimaryKey(tid);
		String json = JSONObject.toJSONString(train);
		return json;
	}
	
	@RequestMapping(value = "train", produces = "text/html;charset=UTF-8", method = RequestMethod.PUT)
	@ResponseBody
	public String update(Train train) throws Exception {
		String res =  trainService.validate(train, UPDATE);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}
	
	@RequestMapping(value = "train", produces = "text/html;charset=UTF-8", method = RequestMethod.DELETE)
	@ResponseBody
	public String delete(@RequestBody String number) throws Exception {
		String tid = number;
		trainService.deleteByPrimaryKey(tid);
		return "删除成功";

	}
	
		
		
}	
