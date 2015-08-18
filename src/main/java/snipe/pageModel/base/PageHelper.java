package snipe.pageModel.base;

/**
 * EasyUI 分页帮助类
 * 
 * @author 孙宇
 * 
 */
public class PageHelper implements java.io.Serializable {

	protected int page;// 当前页
	protected int rows;// 每页显示记录数
	protected String sort;// 排序字段
	protected String order;// asc/desc
	protected boolean queryAll = true; // 默认查询全部,为导出列表做准备,分页时设置false.
	protected Long total;// 总记录数

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public boolean isQueryAll() {
		return queryAll;
	}

	public void setQueryAll(boolean queryAll) {
		this.queryAll = queryAll;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

}
