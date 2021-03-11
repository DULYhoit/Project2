package kr.or.eutchapedia.admin.movie.entity;

public class CommentEnrollment {
	private int num;
	private int commentIndex;
	private int fkStarIndex;
	private String commentText;
	private int commentLikeCount;
	private int commentReportCount;
	private int commentBlindCheck;
	private String commentDate;
	private String fkMovieDocid;
	private String fkMemberEmail;
	private String starRating;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCommentIndex() {
		return commentIndex;
	}
	public void setCommentIndex(int commentIndex) {
		this.commentIndex = commentIndex;
	}
	public int getFkStarIndex() {
		return fkStarIndex;
	}
	public void setFkStarIndex(int fkStarIndex) {
		this.fkStarIndex = fkStarIndex;
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
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getFkMovieDocid() {
		return fkMovieDocid;
	}
	public void setFkMovieDocid(String fkMovieDocid) {
		this.fkMovieDocid = fkMovieDocid;
	}
	public String getFkMemberEmail() {
		return fkMemberEmail;
	}
	public void setFkMemberEmail(String fkMemberEmail) {
		this.fkMemberEmail = fkMemberEmail;
	}
	public String getStarRating() {
		return starRating;
	}
	public void setStarRating(String starRating) {
		this.starRating = starRating;
	}
	
	
	
	
}
