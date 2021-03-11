package kr.or.eutchapedia.movie.detail.domain;

import java.sql.Date;

public class WannaWatchVo {
	private int wannaWatchIndex;
	private String memberEmail;
	private String movieDocId;
	private Date wannaWatchDate;
	
	public int getWannaWatchIndex() {
		return wannaWatchIndex;
	}
	public void setWannaWatchIndex(int wannaWatchIndex) {
		this.wannaWatchIndex = wannaWatchIndex;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMovieDocId() {
		return movieDocId;
	}
	public void setMovieDocId(String movieDocId) {
		this.movieDocId = movieDocId;
	}
	public Date getWannaWatchDate() {
		return wannaWatchDate;
	}
	public void setWannaWatchDate(Date wannaWatchDate) {
		this.wannaWatchDate = wannaWatchDate;
	}
	
	
}
