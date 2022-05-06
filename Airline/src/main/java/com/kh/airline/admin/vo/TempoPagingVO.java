package com.kh.airline.admin.vo;

public class TempoPagingVO {
	private boolean prev; // 계산
	private boolean next; // 계산
	private int nowPage; // 설정값
	private int startPage;
	private int endPage;
	private int lastPage; // 마지막 페이지
	private int startNum; // DB로 넘길 값
	private int endNum; // DB로 넘길 값
	
	// 총 게시글 수 //DB 받아올 값
	private int listCnt;
	// 페이지 당 게시글 수 // 설정값
	private int pagePerList;
	
	// 전체 페이지 수 // 계산
	private int totalPageCnt;
	// 한 번에 보여질 페이지 수 // 설정
	private int dispPageCnt = 5;
	// 현재 보여지는 페이지들 중 첫번째 // 계산
	private int dispFirstPage;
	
	public TempoPagingVO() {}
	
	public TempoPagingVO(int totalPageCnt, int nowPage, int pagePerList) {
		setTotalPageCnt(totalPageCnt);
		setPagePerList(pagePerList);
		setNowPage(nowPage);
		calcLastPage(getListCnt(), getPagePerList());
		calcPageRange(getNowPage(), dispPageCnt);
		calcNumRange(getNowPage(), getPagePerList());
		setPrev(nowPage > 1);
		setNext(nowPage + 1 < endPage);
	}
	
	public void calcLastPage(int listCnt, int pagePerList) {
		setLastPage((int)Math.ceil((double)listCnt / (double)pagePerList));
	}
	
	public void calcPageRange(int nowPage, int dispPageCnt) {
		setEndPage((int)Math.ceil((double)nowPage / (double)dispPageCnt) * dispPageCnt);

		if(getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - dispPageCnt + 1 );
		if(getStartPage() < 1) {
			setStartPage(1);
		}
	}
	
	public void calcNumRange(int nowPage, int pagePerList) {
		setEndNum(nowPage * pagePerList);
		setStartNum(getEndNum() - pagePerList + 1);
	}
	
	
	
	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
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
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
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
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getPagePerList() {
		return pagePerList;
	}
	public void setPagePerList(int pagePerList) {
		this.pagePerList = pagePerList;
	}
	public int getTotalPageCnt() {
		return totalPageCnt;
	}
	public void setTotalPageCnt(int totalPageCnt) {
		this.totalPageCnt = totalPageCnt;
	}
	public int getDispPageCnt() {
		return dispPageCnt;
	}
	public void setDispPageCnt(int dispPageCnt) {
		this.dispPageCnt = dispPageCnt;
	}
	public int getDispFirstPage() {
		return dispFirstPage;
	}
	public void setDispFirstPage(int dispFirstPage) {
		this.dispFirstPage = dispFirstPage;
	}
	
	

}
