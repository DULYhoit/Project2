package kr.or.eutchapedia.board.notice.domain;

// 특정 페이지 조회를 위한 클래스
public class Criteria {
		
		private int pageNum; 	// 페이지 번호
		private int amount; 	// 페이지당 보여줄 게시글의 개수

		private int rowStart;
		private int rowEnd;
		
		public Criteria() {
			this(1,10);
			
		}
		public Criteria(int pageNum, int amount) {
			this.pageNum = pageNum;
			this.amount = amount;
		}
		public int getPageNum() {
			return pageNum;
		}

		public void setPageNum(int pageNum) {
			if(pageNum <= 0) {
				this.pageNum = 1;
				return;
			}
			this.pageNum = pageNum;
		}

		public int getAmount() {
			return amount;
		}

		public void setAmount(int amount) {
			int cnt = this.amount;
			
			if(amount != cnt) {
				this.amount = cnt;
			}else {
				this.amount = amount;
			}
		}

		public int getPageStart() {
			return (this.pageNum - 1) * amount;
		}
		
		public int getRowStart() {
			rowStart = ((pageNum - 1) * amount) + 1;
			return rowStart;
		}
		
		public int getRowEnd() {
			rowEnd = rowStart + amount - 1;
			return rowEnd;
		}
		
		@Override
		public String toString() {
			return "Criteria [pageNum=" + pageNum + ", amount=" + amount +", rowStart=" + rowStart 
					+ ", rowEnd=" + rowEnd + "]";
					
		}
}
