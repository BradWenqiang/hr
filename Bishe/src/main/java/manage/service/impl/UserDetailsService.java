package manage.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import manage.dao.UserMapper;

@Service
public class UserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {
	@Autowired
	private UserMapper userMapper;
	private manage.model.User user;

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDetails userDetails = null;
		try {
			user = userMapper.selectByPrimaryKey(username);
			userDetails = new User(username, user.getPassword(), getAuthorities(user.getAuthority()));
		} catch (Exception e) {
			throw new UsernameNotFoundException("Error in retrieving user");
		}
		return userDetails;
	}

	private Collection<GrantedAuthority> getAuthorities(Integer access) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		// 每个用户都具有ROLE_USER权限
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		// 如果参数access为1.则拥有ROLE_ADMIN权限
		if (access.compareTo(1) == 0) {
			authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}

		return authorities;
	}

}
