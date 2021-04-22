package com.spring.blog.board.vo;

import org.springframework.stereotype.Component;

@Component("criteria")
public class Criteria {
	//특정 페이지의 게시판을 조회하기 위한 도우미 클래스

	private String id;
	//조회할 아이디값
	private int rowStart;
	//조회 시작 번호
	private int rowEnd;
	//조회 끝 번호
	private int page;
	//현재 페이지 정보
	private int perPageNum;
	//페이지당 표시할 개시글 수
	
	//게시글검색에 필요한 항목
	private String selector;
	private String who;
	
	public String getSelector() {
		return selector;
	}

	public void setSelector(String selector) {
		this.selector = selector;
	}

	public String getWho() {
		return who;
	}

	public void setWho(String who) {
		this.who = who;
	}

	public Criteria() {
		this.page = 1;
		this.perPageNum = 5;
	}
	//생성자로 값 초기화
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		//현제 페이지 가 1 이라면 0 +1 시작 번호 1로 시작
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		//시작번호1 + 현재 페이지에 보여줄 글갯수  -1; 
		
		return rowEnd;
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			//페이지호출이 없을경우 1로 시작 한다
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			// 보여줄 게시글 갯수가 없거나 100개 이상일경우 5로 초기화
			if(getPerPageNum() == 10) {
				this.perPageNum = 10;
				return;
			}
			this.perPageNum = 5;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
}
