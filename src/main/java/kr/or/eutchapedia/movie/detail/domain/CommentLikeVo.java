package kr.or.eutchapedia.movie.detail.domain;

public class CommentLikeVo {
	private int likeIndex;
	private int commentIndex;
	private String memberEmail;
	private int likeCheck;
	
	public int getLikeIndex() {
		return likeIndex;
	}
	public void setLikeIndex(int likeIndex) {
		this.likeIndex = likeIndex;
	}
	public int getCommentIndex() {
		return commentIndex;
	}
	public void setCommentIndex(int commentIndex) {
		this.commentIndex = commentIndex;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public int getLikeCheck() {
		return likeCheck;
	}
	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}
	@Override
	public String toString() {
		return "LikeVo [likeIndex=" + likeIndex + ", commentIndex=" + commentIndex + ", memberEmail=" + memberEmail
				+ ", likeCheck=" + likeCheck + "]";
	}
	
	
	
	
	
}
