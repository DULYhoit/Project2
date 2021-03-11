package kr.or.eutchapedia.mypage.entity;

import java.util.Date;

public class WannaWatchVo {
	
	int wannaWatchIndex;
	String memberEmail;
	String movieDocid;
	Date wannaWatchDate;
	String title;
	String prodYear;
	String posterUri;
	
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
	public String getMovieDocid() {
		return movieDocid;
	}
	public void setMovieDocid(String movieDocid) {
		this.movieDocid = movieDocid;
	}
	public Date getWannaWatchDate() {
		return wannaWatchDate;
	}
	public void setWannaWatchDate(Date wannaWatchDate) {
		this.wannaWatchDate = wannaWatchDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getProdYear() {
		return prodYear;
	}
	public void setProdYear(String prodYear) {
		this.prodYear = prodYear;
	}
	public String getPosterUri() {
		return posterUri;
	}
	public void setPosterUri(String posterUri) {
		this.posterUri = posterUri;
	}


}
