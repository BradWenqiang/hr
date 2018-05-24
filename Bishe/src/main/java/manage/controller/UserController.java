package manage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import manage.base.BaseController;
import manage.model.Departments;
import manage.model.User;
import manage.model.UserPo;
import manage.service.DepartmentsService;
import manage.service.UserService;
import manage.util.BiSheUtil;
import manage.util.PageInfo;
import manage.util.PageResult;
/**
* @author 曲文强
* @version 创建时间：2018.04.18
* @describe： 员工模块
*/
@Controller
public class UserController extends BaseController<User, UserService<User>> {

	private static Logger logger = LogManager.getLogger(UserController.class);
	@Resource
	private UserService<User> userServiceImpl;
	@Resource
	private DepartmentsService<Departments> departmentsServiceImpl;

	@RequestMapping("/add")
	public String Register() {
		return "index";
	}



	@RequestMapping(value = "/register", produces = "text/html;charset=UTF-8", method = RequestMethod.DELETE)
	@ResponseBody
	public String delete(@RequestBody String account) {
		System.out.println(account);
		String userAccount = account;
		userServiceImpl.deleteByPrimaryKey(userAccount);
		// String returnInfo = JSONObject.toJSONString("删除成功");
		return "删除成功";

	}

	@RequestMapping(value = "/register", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String add(User user) throws Exception {
		String res = userServiceImpl.validate(user, INSERT);
		// String res = userServiceImpl.insertAdd(user);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}

	@RequestMapping(value = "/register", produces = "text/html;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	// 分页查询
	public String find(HttpServletRequest request) {
		// ,HttpSession session
		// 从分页工具中得到数据库查询的数据和page的信息
		 //int pageSize = Integer.parseInt(PageResult.getName("pageSize"));
		 String pageSize = request.getParameter("pageSize");
		 String currentPage = request.getParameter("currentPage");
		 String depNumber = request.getParameter("depNum");
		 String userNum = request.getParameter("userNum");
		 String userName = request.getParameter("userName");
		 //String userAutho = request.getParameter("userAutho");
		 if (!BiSheUtil.notNull(depNumber)) {
				depNumber = null;
			}
		 if (!BiSheUtil.notNull(userNum)) {
			 userNum = null;
			}
		 if (!BiSheUtil.notNull(userName)) {
			 userName = null;
			}
		 /*if (!BiSheUtil.notNull(userAutho)) {
			 userAutho = null;
			}*/
		 
		  PageInfo page= getPage(pageSize, currentPage); 
		  @SuppressWarnings("unchecked")
		  List<User> userList = (List<User>) userServiceImpl.selectAll(page,depNumber,userNum,userName); 
		  validate(page);
		 
		//默认的pageSize从PageResult中取，如果特定的手动输入
		/*int pageSize = Integer.parseInt(PageResult.getName("pageSize"));
		String currentPage = request.getParameter("number");
		String depNumber = request.getParameter("depNum");
		if (!BiSheUtil.notNull(depNumber)) {
			depNumber = null;
		}
		HashMap pageMap = pageList(pageSize, currentPage, userServiceImpl, depNumber);*/
		// JSONArray pageData = (JSONArray) pageList.get("pageData");
		// pageList从数据库中取出的实体类，可能为空，页面中JS为了防止重复刷新，会根据有没有数据判断
	/*	@SuppressWarnings("unchecked")
		ArrayList<UserPo> userList = (ArrayList<UserPo>) pageMap.get(PageResult.getName("entityList"));
		PageEntity pageEntity = (PageEntity) pageMap.get(PageResult.getName("pageEntity"));*/
		// 判断是否为空
		/*if (userList.isEmpty()) {
			// 如果为空的话加入一个实体类，里面的值为-----
			UserPo empty = new UserPo();
			empty.setAccount("-");
			empty.setPassword("-");
			empty.setUsername("-");
			userList.add(empty);
		}
		*/
		
		
		  //List<Departments> departmentsList = departmentsServiceImpl.selectAll(); 
		 /* for (Departments departments :
		  departmentsList) { for (User user : userList) {
		  if(user.equals(departments.getNumber())){
		  
		  } } }*/
		 
		// request.setAttribute("list", userList);
		// request.setAttribute("pageEntity", pageEntity);
		//HashMap resultMap = new HashMap();
		
		//--------
		/*session.setAttribute("list", userList);
		session.setAttribute("pageEntity", pageEntity);
		session.setAttribute("depNumber", depNumber);
		session.setAttribute("userNum", userNum);
		session.setAttribute("userName", userName);*/
		//-------
		
		//session.setAttribute("userAutho", userAutho);
		// String returnInfo = JSONObject.toJSONString("success");
		HashMap result = new HashMap();
		result.put("arrayList", userList);
		result.put("pageInfo", page);
		String returnInfo = JSONObject.toJSONString(result);
		return returnInfo;
	}


	@RequestMapping(value = "/registerSelect", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String selectByPrimaryKey(@RequestBody String account) {
		String userAccount = account;
		User user = userServiceImpl.selectByPrimaryKey(userAccount);
		String json = JSONObject.toJSONString(user);
		return json;
	}

	@RequestMapping(value = "/register", produces = "text/html;charset=UTF-8", method = RequestMethod.PUT)
	@ResponseBody
	public String update(User user) throws Exception {
		String res = userServiceImpl.validate(user, UPDATE);
		// String res = userServiceImpl.updateByPrimaryKeySelective(user);
		String returnInfo = JSONObject.toJSONString(res);
		return returnInfo;
	}

	/*
	 * @RequestMapping(value="/userSelectTree",
	 * produces="text/html;charset=UTF-8", method=RequestMethod.PUT)
	 * 
	 * @ResponseBody public String selectByDepNumber( User user) throws
	 * Exception { String res = userServiceImpl.validate(user, UPDATE); //
	 * String res = userServiceImpl.updateByPrimaryKeySelective(user); String
	 * returnInfo = JSONObject.toJSONString(res); return returnInfo; }
	 */
	@RequestMapping(value = "/departmentsDel", produces = "text/html;charset=UTF-8", method = RequestMethod.DELETE)
	@ResponseBody
	// 分页查询
	public String deleteList(@RequestBody String deleteList) {
		String[] delete = deleteList.split(",");
		userServiceImpl.deleteList(delete);
		return "删除成功";
	}

}
