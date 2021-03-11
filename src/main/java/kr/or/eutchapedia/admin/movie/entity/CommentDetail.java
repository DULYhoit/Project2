package kr.or.eutchapedia.admin.movie.entity;

public class CommentDetail {
	private int fkCommentIndex;
	private String fkMemberEmail;
	private String reportText;
	private int fkStarIndex;
	private String commentText;
	private String commentDate;
	
	public int getFkCommentIndex() {
		return fkCommentIndex;
	}
	public void setFkCommentIndex(int fkCommentIndex) {
		this.fkCommentIndex = fkCommentIndex;
	}
	public String getFkMemberEmail() {
		return fkMemberEmail;
	}
	public void setFkMemberEmail(String fkMemberEmail) {
		this.fkMemberEmail = fkMemberEmail;
	}
	public String getReportText() {
		return reportText;
	}
	public void setReportText(String reportText) {
		this.reportText = reportText;
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
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	
	
}
