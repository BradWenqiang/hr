package manage.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import manage.model.User;
import manage.service.UserService;
/**
* @author 曲文强
* @version 创建时间：2018.04.18
* @describe：登陆用的Controller，SpringSecurity的登陆会来这个方法中做验证
*/
@Controller
@RequestMapping("/")
public class LoginController {
	@Resource
	private UserService<User> userServiceImpl;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) boolean error, ModelMap model) {
		if (error) {
			model.put("error", "用户名或密码错误");
		} else {
			model.put("error", "");
		}
		// System.out.println(userServiceImpl.selectByPrimaryKey("admin").getAuthority());
		return "login";
	}

	@RequestMapping("index")
	public String index() {
		return "index";
	}

	@RequestMapping("logout")
	public String logout(@RequestParam(value = "username", required = false) String username,
			RedirectAttributes redirectAttributes) {

		return "redirect:/login";
	}

}