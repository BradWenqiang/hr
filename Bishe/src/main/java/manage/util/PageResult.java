package manage.util;

public enum PageResult {
	PAGESIZE("8", "pageSize"), PAGEENTITY("pageEntity", "pageEntity"), ENITTYLIST("EntityList", "entityList");

	public static String getName(String name) {
		for (PageResult c : PageResult.values()) {
			if (c.getName().equals(name)) {
				return c.value;
			}
		}
		return null;
	}

	private String value;
	private String name;

	private PageResult(String value, String name) {
		this.name = name;
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
}
