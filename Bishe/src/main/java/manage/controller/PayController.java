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
import manage.model.Pay;
import manage.model.Wage;
import manage.service.PayService;
import manage.util.PageInfo;
import manage.base.BaseController;	
import java.util.*;	
	
@Controller	
@RequestMapping("/")	
public class PayController extends BaseController {	
		
	@Autowired	
	private PayService payService;	
		
	/*	
	 * @author 	
	 * @description	
	 * @date	
	*/	
	@RequestMapping(value = "pay", produces = "text/html;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public String find(HttpServletRequest request) {
		String pageSize = request.getParameter("pageSize");
		String currentPage = request.getParameter("currentPage");
		PageInfo page = getPage(pageSize, currentPage);
		@SuppressWarnings("unchecked")
		List<Pay> payList = (List<Pay>) payService.selectAll(page);
		validate(page);
		HashMap result = new HashMap();
		result.put("arrayList", payList);
		result.put("pageInfo", page);
		String returnInfo = JSONObject.toJSONString(result);
		return returnInfo;

	}
	@RequestMapping(value = "pay", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String add(Pay pay) throws Exception {
		String res = payService.validate(pay, INSERT);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}
	@RequestMapping(value = "paySelect", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String selectByPrimaryKey(@RequestBody String account) {
		Pay pay =(Pay) payService.selectByPrimaryKey(account);
		String json = JSONObject.toJSONString(pay);
		return json;
	}
	
	@RequestMapping(value = "pay", produces = "text/html;charset=UTF-8", method = RequestMethod.PUT)
	@ResponseBody
	public String update(Pay pay) throws Exception {
		String res =  payService.validate(pay, UPDATE);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}
	
	@RequestMapping(value = "pay", produces = "text/html;charset=UTF-8", method = RequestMethod.DELETE)
	@ResponseBody
	public String delete(@RequestBody String number) throws Exception {
		String account = number;
		payService.deleteByPrimaryKey(account);
		return "删除成功";

	}	
}	
