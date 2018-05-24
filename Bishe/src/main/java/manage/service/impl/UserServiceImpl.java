package manage.service.impl;

import manage.model.User;
import manage.model.UserPo;
import manage.service.UserService;
import manage.util.BiSheUtil;
import manage.util.PageInfo;
import manage.dao.UserMapper;
import manage.util.UserEnum;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.base.BaseServiceImpl;
import manage.controller.UserController;
/**
* @author 曲文强
* @version 创建时间：2018.04.18
*/
@Service
public class UserServiceImpl extends BaseServiceImpl<User, UserMapper> implements UserService<User> {
	private static Logger logger = LogManager.getLogger(UserServiceImpl.class);
	@Autowired
	private UserMapper userMapper;

	public List<UserPo> selectAll(PageInfo page, String depNumber ,String userNum,String userName) {
		List<UserPo> arrayList = userMapper.selectAllListPage(depNumber, page,userNum,userName);
		for (UserPo userPo : arrayList) {
			userPo.setDepName(userPo.getDepartments().getName());
		}
		// List<UserPo> arrayList = new ArrayList<UserPo>();
		return arrayList;
	}

	// 验证功能，验证字段是否已经存在
	public String validate(User user, String method) throws Exception {

		if (BiSheUtil.notNull(user.getAccount())) {
			if (!(method.equals("update"))) {
				if (userMapper.selectByPrimaryKey(user.getAccount()) != null) {
					return UserEnum.getName("account");
				}
			}
		} else {
			return UserEnum.getName("accountNull");
		}
		if (!BiSheUtil.notNull(user.getPassword())) {
			return UserEnum.getName("passWord");
		}
		if (!BiSheUtil.notNull(user.getDepNumber())) {
			return UserEnum.getName("depatrments");
		}
		if (!BiSheUtil.notNull(user.getUsername())) {
			return UserEnum.getName("userName");
		}
		
		if (method == "update" || method.equals("update")) {
			try {
				userMapper.updateByPrimaryKey(user);
			} catch (Exception e) {
				logger.error("员工更新失败：" + e);
				throw new Exception("员工更新失败：" + e);
			}

			return UserEnum.getName("updateSuccess");
		} else {
			try {
				userMapper.insert(user);
			} catch (Exception e) {
				logger.error("员工增加失败：" + e);
				throw new Exception("员工增加失败：" + e);
			}

		}

		return UserEnum.getName("success");

	}
	/*
	 * public String insertAdd(User user) { if
	 * (BiSheUtil.notNull(user.getAccount())) { if
	 * (userMapper.selectByPrimaryKey(user.getUsername()) != null) { return
	 * UserEnum.getName("account"); } } else { return
	 * UserEnum.getName("accountnull");
	 * 
	 * } if (BiSheUtil.notNull(user.getNumber())) { if
	 * (userMapper.selectByNumber(user.getNumber()) != null) { return
	 * UserEnum.getName("number"); } } else { return
	 * UserEnum.getName("numbernull");
	 * 
	 * } if (!BiSheUtil.notNull(user.getPassword())) { return
	 * UserEnum.getName("passWord"); } if
	 * (!BiSheUtil.notNull(user.getUsername())) { return
	 * UserEnum.getName("userName"); } userMapper.insert(user); return
	 * UserEnum.getName("success");
	 * 
	 * }
	 */
	//批量删除
	public void deleteList(String[] deleteList) {
		userMapper.deleteList(deleteList);
		
	}

	/*
	 * public String insertAdd(User record) { // TODO Auto-generated method stub
	 * return null; }
	 */

}
