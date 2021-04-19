package com.spring.blog.board.vo;

public class PageMaker {
	//페이지를 생성하고 ㅡ 계산하는 클래스 
	private Criteria cri;
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum= 5;
	
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		//총 게시글 수 셋팅할때 calcData() 메서드를 호출하여 페이징 관련 버튼 계산
		calcData();
	}

	/*
	 * cri.getPage() 현재 페이지 번호 
	 * cri.getPerPageNum() : 한 페이지당 보여줄 게시글의 갯수
	 */
	public void calcData() {
		endPage =(int) (Math.ceil(cri.getPage()/(double) displayPageNum)*displayPageNum);
		int tempEndPage = (int)(Math.ceil(totalCount/(double) cri.getPerPageNum()));
		if(endPage> tempEndPage) {
			endPage = tempEndPage;
		}
		//끝 페이지 번호 = (현재 페이지 번호 / 화면에 보여질 페이지 번호의 갯수) * 화면에 보여질 페이지 번호의 갯수
		// 마지막 페이지 번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글의 갯수
		startPage=(endPage - displayPageNum)+1;
		if(startPage <=0) startPage =1;
		prev = startPage ==1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
}
