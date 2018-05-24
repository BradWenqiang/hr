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

import manage.model.Train;
import manage.model.Wage;	
import manage.service.WageService;
import manage.util.PageInfo;
import manage.base.BaseController;	
import java.util.*;	
	
@Controller	
@RequestMapping("/")	
public class WageController extends BaseController<Wage,WageService<Wage>> {	
		
	@Autowired	
	private WageService wageService;	
		
	/*	
	 * @author 	
	 * @description	
	 * @date	
	*/	
	@RequestMapping(value = "wage", produces = "text/html;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public String find(HttpServletRequest request) {
		String pageSize = request.getParameter("pageSize");
		String currentPage = request.getParameter("currentPage");
		PageInfo page = getPage(pageSize, currentPage);
		@SuppressWarnings("unchecked")
		List<Wage> wageList = (List<Wage>) wageService.selectAll(page);
		validate(page);
		HashMap result = new HashMap();
		result.put("arrayList", wageList );
		result.put("pageInfo", page);
		String returnInfo = JSONObject.toJSONString(result);
		return returnInfo;

	}
	@RequestMapping(value = "wage", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String add(Wage wage) throws Exception {
		String res = wageService.validate(wage, INSERT);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}
	@RequestMapping(value = "wageSelect", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String selectByPrimaryKey(@RequestBody String account) {
		Wage wage =(Wage) wageService.selectByPrimaryKey(account);
		String json = JSONObject.toJSONString(wage);
		return json;
	}
	
	@RequestMapping(value = "wage", produces = "text/html;charset=UTF-8", method = RequestMethod.PUT)
	@ResponseBody
	public String update(Wage wage) throws Exception {
		String res =  wageService.validate(wage, UPDATE);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}
	
	@RequestMapping(value = "wage", produces = "text/html;charset=UTF-8", method = RequestMethod.DELETE)
	@ResponseBody
	public String delete(@RequestBody String number) throws Exception {
		String account = number;
		wageService.deleteByPrimaryKey(account);
		return "删除成功";

	}
	
		
		
		
		
}	
