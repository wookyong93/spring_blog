package com.spring.blog.board.vo;

import org.springframework.stereotype.Component;

@Component("criteria")
public class Criteria {
	//특정 페이지의 게시판을 조회하기 위한 도우미 클래스
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private int page;
	//현재 페이지 정보
	
	private int perPageNum;
	//페이지당 표시할 개시글 수
	public  int getPageStart() {
		//특정 페이지의 게시글 시작번호, 게시글 시작행번호 
		//현재 페이지의 게시글 시작 번호 =(현재 페이지 번호 -1)*페이지당 보여줄 게시글 갯수
		return (this.page-1)*perPageNum;
	}
	public Criteria() {
		//생성자를 이용하여 페이지번호와 , 표시 게시글 갯수 초기화
		this.page = 1;
		this.perPageNum= 5;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <=0) {
			this.page=1;
		}else {
			this.page = page;
		}
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		//표시글 갯수가 5 이상일경우 
		//표시될 글번호를 cnt로 표시 
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		}else {
			this.perPageNum = pageCount;
		}
	}
	
}
