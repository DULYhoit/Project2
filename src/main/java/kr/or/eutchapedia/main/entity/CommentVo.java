package kr.or.eutchapedia.main.entity;

import java.sql.Date;

public class CommentVo {

	private int commentIndex;
	private int starIndex;
	private String commentText;
	private int commentLikeCount;
	private int commentReportCount;
	private int commentBlindCheck;
	private Date commentDate;
	
	
	public int getCommentIndex() {
		return commentIndex;
	}
	public void setCommentIndex(int commentIndex) {
		this.commentIndex = commentIndex;
	}
	public int getStarIndex() {
		return starIndex;
	}
	public void setStarIndex(int starIndex) {
		this.starIndex = starIndex;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public int getCommentLikeCount() {
		return commentLikeCount;
	}
	public void setCommentLikeCount(int commentLikeCount) {
		this.commentLikeCount = commentLikeCount;
	}
	public int getCommentReportCount() {
		return commentReportCount;
	}
	public void setCommentReportCount(int commentReportCount) {
		this.commentReportCount = commentReportCount;
	}
	public int getCommentBlindCheck() {
		return commentBlindCheck;
	}
	public void setCommentBlindCheck(int commentBlindCheck) {
		this.commentBlindCheck = commentBlindCheck;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
	
}