package manage.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import manage.model.User;
import manage.util.PageInfo;
@Controller
public class BreadCrumbController {

	@RequestMapping(value = "/breadCrumb", produces = "text/html;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public void getBreadCrumb(HttpServletRequest request, HttpSession session) {
 		/*String breadCrumb = request.getParameter("breadCrumb");
 		String url = request.getParameter("url");
 		String panelParentId = request.getParameter("panelParentId");
 		String panelChildrenId = request.getParameter("panelChildrenId");
 		session.setAttribute("url", url);
		session.setAttribute("breadCrumb", breadCrumb);
		session.setAttribute("panelParentId", panelParentId);
		session.setAttribute("panelChildrenId", panelChildrenId);*/
		
	}
	
	
	@RequestMapping(value = "/biaoge", produces = "text/html;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public String test(HttpServletRequest request, HttpSession session) {
		  User user = new User();
		  user.setAccount("zhanghao");
		  user.setPassword("mima");
		  user.setUsername("mingzi");
		  user.setAuthority(1);
		  ArrayList<User> arrayList = new ArrayList<User>();
		 
		  PageInfo pageInfo = new PageInfo();
		  pageInfo.setTotalPage(8);
		  pageInfo.setCurrentPage(3);
		  arrayList.add(user);
		  HashMap hashMap = new HashMap();
		  hashMap.put("arrayList", arrayList);
		  hashMap.put("pageInfo", pageInfo);
		  String returnInfo = JSONObject.toJSONString(hashMap);
		return returnInfo;
		
		
	}
	
	
}
