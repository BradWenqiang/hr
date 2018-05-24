package manage.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import manage.model.User;
import manage.service.UserService;
import manage.util.PageInfo;

public class BaseServiceImpl<T, M extends BaseMapper<T>> implements BaseService<T> {
	@Autowired
	private M m;
	private UserService<User> userService;
	public int deleteByPrimaryKey(String username) {
		m.deleteByPrimaryKey(username);
		return 0;
	}

	public String insert(T record) {
		m.insert(record);
		return "";
	}

	public String insertSelective(T record) {
		m.insertSelective(record);
		return "";
	}

	/*
	 * public User selectByPrimaryKey(String username) { User u =
	 * m.selectByPrimaryKey(username); return u; }
	 */
	public T selectByPrimaryKey(String PrimaryKey) {
		T u = (T) m.selectByPrimaryKey(PrimaryKey);
		return u;
	}

	public String updateByPrimaryKeySelective(T record) {
		m.updateByPrimaryKeySelective(record);
		return "";
	}

	public String updateByPrimaryKey(T record) {
		m.updateByPrimaryKey(record);
		return "";
	}

	public List<?> selectAll(PageInfo page) {
		// TODO Auto-generated method stub
		List<?> entityList = m.selectAllListPage(page);
		return entityList;
	}


}
