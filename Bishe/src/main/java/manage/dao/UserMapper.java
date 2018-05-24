package manage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import manage.base.BaseMapper;
import manage.model.User;
import manage.model.UserPo;
import manage.util.PageInfo;

public interface UserMapper extends BaseMapper<User> {
	int deleteByPrimaryKey(String username);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(String username);

	// List<User> selectAll(PageInfo page);
	List<UserPo> selectAllListPage(@Param("depNumber") String depNumber, @Param("page") PageInfo page,@Param("account")String account,@Param("username")String username);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);
	
	int deleteList(String[] deleteList);
	
	List<User> selectBydepNumber(String depNumber);

}