package kr.or.eutchapedia.board.notice.domain;


//게시판 하단의 페이징
public class Paging {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int total;
	private int displayPageNum = 5;

	private Criteria cri;
	
	public Paging(Criteria cri, int total) {
		this.cri=cri;
		this.total=total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (double) displayPageNum) * displayPageNum);

		this.startPage = (endPage - displayPageNum) + 1;
		
		int realEnd = (int)(Math.ceil(total / (double)cri.getAmount()));

		if(realEnd < endPage) {
			this.endPage=realEnd;
		}
		
		this.prev = this.startPage>1;
		this.next = this.endPage < realEnd;
		
		prev= startPage == 1? false:true;
		next = endPage * cri.getAmount() >= total ? false:true;
	}
	public Criteria getCri() {
		return cri;
	}
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
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


	@Override
	public String toString() {
		return "Paging [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + "]";
	}
	
	
	
  

}
