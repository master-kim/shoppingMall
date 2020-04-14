package com.jica.springshoppingmall.beans;

public class PageBean {
	// 현재 페이지 번호
	private int now_page;
	// 전체 글의 개수
	private int content_cnt;
	// 전체 페이지 개수
	private int page_cnt;
	// pagination 최소 값
	private int pagination_min;
	// pagination 최대 값
	private int pagination_max;
	// pagination 개수
	private int pagination_cnt;
	// 페이지당 글의 개수
	private int cnt_per_page;
	
	// page_num : 현재 페이지 번호
	// cnt1 : 전페 글의 개수
	// cnt2 : 페이지당 글의 개수
	// cnt3 : 페이지네이션 개수
	public PageBean(int page_num, int cnt1, int cnt2, int cnt3) {
		// 현재 페이지 번호
		this.now_page = page_num;
		// 전체 글 개수
		this.content_cnt = cnt1;
		// 페이지당 글 개수
		this.cnt_per_page = cnt2;
		// 전체 페이지의 개수
		// 전체 글 개수 / 페이지당 글 개수
		int a1 = this.content_cnt / this.cnt_per_page;
		// 페이징 글 개수로 나누어 떨어지지 않을 경우 1페이지를 추가한다.
		if(this.content_cnt % this.cnt_per_page > 0) {
			a1++;
		}
		this.page_cnt = a1;
		// 전체 페이지 개수보다 현재 페이지 번호가 크면 전체 페이지 개수로 변경한다.
		if(this.now_page > this.page_cnt) {
			this.now_page = this.page_cnt;
		}
		// 보여줄 pagination 개수
		this.pagination_cnt = cnt3;
		// pagination 최소 값
		// (((현재 페이지 번호 - 1) / 페이지네이션 개수) * 페이지네이션 개수) + 1
		int a2 = this.now_page - 1;
		int a3 = a2 / this.pagination_cnt;
		int a4 = a3 * this.pagination_cnt;
		int a5 = a4 + 1;
		this.pagination_min = a5;
		// pagination 최대 값
		// pagination 최소 값 + 페이지네이션 개수 - 1
		int a6 = this.pagination_min + this.pagination_cnt - 1;
		// 최대값이 전체 페이지 수보다 많을 경우
		if(a6 > this.page_cnt) {
			a6 = this.page_cnt;
		}
		this.pagination_max = a6;
	}
	
	public int getNow_page() {
		return now_page;
	}
	public void setNow_page(int now_page) {
		this.now_page = now_page;
	}
	public int getContent_cnt() {
		return content_cnt;
	}
	public void setContent_cnt(int content_cnt) {
		this.content_cnt = content_cnt;
	}
	public int getPage_cnt() {
		return page_cnt;
	}
	public void setPage_cnt(int page_cnt) {
		this.page_cnt = page_cnt;
	}
	public int getPagination_min() {
		return pagination_min;
	}
	public void setPagination_min(int pagination_min) {
		this.pagination_min = pagination_min;
	}
	public int getPagination_max() {
		return pagination_max;
	}
	public void setPagination_max(int pagination_max) {
		this.pagination_max = pagination_max;
	}
	public int getPagination_cnt() {
		return pagination_cnt;
	}
	public void setPagination_cnt(int pagination_cnt) {
		this.pagination_cnt = pagination_cnt;
	}
	public int getCnt_per_page() {
		return cnt_per_page;
	}
	public void setCnt_per_page(int cnt_per_page) {
		this.cnt_per_page = cnt_per_page;
	}
	
	
}










