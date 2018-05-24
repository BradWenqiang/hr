package manage.model;

import java.util.List;

public class User {
	private String username;

	private String password;

	private String account;

	private String depNumber;
	
	private List<Departments> dlist;

	public List<Departments> getDlist() {
		return dlist;
	}

	public void setDlist(List<Departments> dlist) {
		this.dlist = dlist;
	}

	public String getDepNumber() {
		return depNumber;
	}

	public void setDepNumber(String depNumber) {
		this.depNumber = depNumber;
	}

	private Integer authority;

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", account=" + account + ",depNumber="
				+ depNumber + ", authority=" + authority + "]";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public Integer getAuthority() {
		return authority;
	}

	public void setAuthority(Integer authority) {
		this.authority = authority;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

}