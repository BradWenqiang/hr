package manage.base;

import java.util.HashMap;
import manage.util.PageInfo;

/**
 * @author 曲文强
 * @version 创建时间：2018.04.18 @describe： 所有Controller都需要继承这个Controller
 * @param pageSize:
 *            分页查询时每页显示的个数 number: 分页查询时的当前页，可能传入的值为空，如果为空设置为1 m:
 *            ServiceImpl，在这个方法中会调用ServiceImpl.selectAll()方法查询EntityList
 *            parentsId: 分类查询需要的分类Id
 * @return HashMap<String, Object> info:
 *         返回值是一个HashMap，Map里放了两个键值对，pageEntity(分页用的POJO)，EntityList(
 *         ServiceImpl查询出的实体类List)
 */
public class BaseController<T, M extends BaseService<T>> {

	/*
	 * //重载方法，如果没有parentsId参数调用这个方法，给传parentsId赋空 public HashMap pageList(int
	 * pageSize, String number, M m){ String parentsId = null; HashMap pageList
	 * = pageList(pageSize,number,m,parentsId); return pageList; }
	 * 
	 * // 第一个参数是分页的容量，第二个参数是当前页数，第三个是service public HashMap pageList(int
	 * pageSize, String number, M m, String parentsId) { HashMap<String, Object>
	 * info = new HashMap(); PageEntity pageEntity = new PageEntity(); //
	 * JSONArray pageData = new JSONArray(); int currentPage =
	 * number.equals("undefined") ? 1 : Integer.parseInt(number); if
	 * (currentPage <= 0) { currentPage = 1; } int currentResult = (currentPage
	 * - 1) * pageSize; PageInfo page = new PageInfo();
	 * page.setCurrentPage(pageSize); page.setShowCount(pageSize);
	 * page.setCurrentResult(currentResult); List<?> EntityList =
	 * m.selectAll(page, parentsId); info.put("EntityList", EntityList);
	 * 
	 * int totalCount = page.getTotalResult(); int lastPage = 0; if (totalCount
	 * % pageSize == 0) { lastPage = totalCount / pageSize; } else { lastPage =
	 * 1 + totalCount / pageSize; }
	 * 
	 * if (currentPage >= lastPage) { currentPage = lastPage; }
	 * pageEntity.setCurrentPage(currentPage); pageEntity.setLastPage(lastPage);
	 * pageEntity.setCurrentResult(currentResult + 1); if (currentPage ==
	 * lastPage) { pageEntity.setLocalResult(totalCount); } else {
	 * pageEntity.setLocalResult(currentResult + pageSize); }
	 * pageEntity.setTotalResult(totalCount); info.put("pageEntity",
	 * pageEntity); // info.put("pageData", pageData); return info;
	 * 
	 * }
	 */

	// 如果想把serviceImpl的selectAll方法提出来可以用下面的方法

	// 第一个参数是分页的容量，第二个参数是当前页数，第三个是service
	 protected final String UPDATE = "update";
	 protected final String INSERT = "insert";
	
	public PageInfo getPage(String ps, String number) {
		 PageInfo page = new PageInfo();
		HashMap<String, Object> info = new HashMap();
		//PageEntity pageEntity = new PageEntity();
		// JSONArray pageData = new
		// JSONArray();
		int pageSize = Integer.parseInt(ps);
		int currentPage = number.equals("undefined") ? 1 : Integer.parseInt(number);
		if (currentPage <= 0) {
			currentPage = 1;
		}
		int currentResult = (currentPage - 1) * pageSize;
		page.setCurrentPage(currentPage);
		page.setShowCount(pageSize);
		page.setCurrentResult(currentResult);

		return page;

	}

	public void validate(PageInfo page) {
		//PageEntity pageEntity = new PageEntity();
		int currentPage = page.getCurrentPage();
		int pageSize = page.getShowCount();
		int totalCount = page.getTotalResult();
		//int currentResult = page.getCurrentResult();
		int lastPage = 0;
		if (totalCount % pageSize == 0) {
			lastPage = totalCount / pageSize;
		} else {
			lastPage = 1 + totalCount / pageSize;
		}
		page.setTotalPage(lastPage);
		

		if (currentPage >= lastPage) {
			currentPage = lastPage;
		}
		//pageEntity.setCurrentPage(currentPage);
		//pageEntity.setLastPage(lastPage);
		//pageEntity.setCurrentResult(currentResult + 1);
		//page.setCurrentResult(currentResult);
		/*if (currentPage == lastPage) {
			pageEntity.setLocalResult(totalCount);
		} else {
			pageEntity.setLocalResult(currentResult + pageSize);
		}
		pageEntity.setTotalResult(totalCount);*/

	}

}
