package manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONObject;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import manage.model.Departments;
import manage.model.Userinfo;
import manage.service.UserinfoService;
import manage.util.PageInfo;
import manage.base.BaseController;
import java.util.*;

@Controller
@RequestMapping("/")
public class UserinfoController extends BaseController {

	@Resource(name="UserinfoServiceImpl")
	private UserinfoService<Userinfo> userinfoService;

	@RequestMapping(value = "userinfo", produces = "text/html;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public String find(HttpServletRequest request) {
		String pageSize = request.getParameter("pageSize");
		String currentPage = request.getParameter("currentPage");
		PageInfo page = getPage(pageSize, currentPage);
		@SuppressWarnings("unchecked")
		List<Userinfo> userInfoList = (List<Userinfo>) userinfoService.selectAll(page);
		validate(page);
		HashMap result = new HashMap();
		result.put("arrayList", userInfoList);
		result.put("pageInfo", page);
		String returnInfo = JSONObject.toJSONString(result);
		return returnInfo;
	}
	
	@RequestMapping(value = "userinfo", produces = "text/html;charset=UTF-8", method = RequestMethod.PUT)
	@ResponseBody
	public String update(Userinfo user) throws Exception {
		String res = userinfoService.updateByPrimaryKey(user);
		// String res = userServiceImpl.updateByPrimaryKeySelective(user);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}
	
	@RequestMapping(value = "userinfoSelect", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String selectByPrimaryKey(@RequestBody String account) {
		String userInfoNum = account;
		Userinfo user =  userinfoService.selectByPrimaryKey(userInfoNum);
		String json = JSONObject.toJSONString(user);
		return json;
	}
	
	@RequestMapping(value = "userinfo", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String add(Userinfo user) throws Exception {
		String res = userinfoService.insert(user);
		// String res = userServiceImpl.insertAdd(user);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}
	
	@RequestMapping(value = "userinfo", produces = "text/html;charset=UTF-8", method = RequestMethod.DELETE)
	@ResponseBody
	public String delete(@RequestBody String number) throws Exception {
		String userInfoNum = number;
		userinfoService.deleteByPrimaryKey(userInfoNum);
		return "删除成功";

	}
	

}
