package com.fc.util;

import java.util.List;

public class Page<T> {
	private int currentPage;// 当前页数
	private int totalPage; // 总页数
	
	private int totalCount; // 总记录数
	private int perPageCount;	// 每页显示的记录数
	private List<T> list; // 每页显示数据的集合
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
		System.out.println(this.totalPage);
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPerPageCount() {
		return perPageCount;
	}
	public void setPerPageCount(int perPageCount) {
		this.perPageCount = perPageCount;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", totalPage=" + totalPage
				+ ", totalCount=" + totalCount + ", perPageCount="
				+ perPageCount + ", list=" + list + "]";
	}
	
	
}
