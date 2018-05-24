package manage.util;

public enum UserEnum {
	ACCOUNT("账号已经存在", "account"), PASSWORD("密码不可以为空", "passWord"), NAME("名字不可以为空", "userName"), SUCCESS("添加成功",
			"success"), UPDATESUCCESS("修改成功", "updateSuccess"), ACCOUNTNULL("账号不可以为空", "accountNull"), DEPARTMENTS(
					"部门不可以为空，如果没有部门请先创建部门", "depatrments"), NUMBERNULL("员工编号不可以为空", "numbernull");

	public static String getName(String errorName) {
		for (UserEnum c : UserEnum.values()) {
			if (c.getErrorName().equals(errorName)) {
				return c.errorValue;
			}
		}
		return null;
	}

	private String errorValue;
	private String errorName;

	private UserEnum(String errorValue, String errorName) {
		this.errorName = errorName;
		this.errorValue = errorValue;
	}

	public String getErrorValue() {
		return errorValue;
	}

	public void setErrorValue(String errorValue) {
		this.errorValue = errorValue;
	}

	public String getErrorName() {
		return errorName;
	}

	public void setErrorName(String errorName) {
		this.errorName = errorName;
	}

}
