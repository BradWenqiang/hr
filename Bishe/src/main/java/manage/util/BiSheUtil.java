package manage.util;
/**
* @author 曲文强
* @version 创建时间：2018.04.18
* @describe： 工具类
*/
public class BiSheUtil {
	//判断是否为空
	public static Boolean notNull(String str) {
		if (str == "" || str.isEmpty() || str.equals("undefined") || str == null  ) {
			return false;
		} else {
			return true;
		}
	}

}
