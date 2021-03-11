package kr.or.eutchapedia.movie.detail.domain;

import java.sql.Timestamp;

public class CommentListVo {
	
	private String movieDocId;
	private String nickname;
	private String photo;
	private String commentIndex;
	private String commentText;
	private String likeCount;
	private Timestamp commentDate;
	private Long stars;
	
	
	public String getMovieDocId() {
		return movieDocId;
	}
	public void setMovieDocId(String movieDocId) {
		this.movieDocId = movieDocId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getCommentIndex() {
		return commentIndex;
	}
	public void setCommentIndex(String commentIndex) {
		this.commentIndex = commentIndex;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public String getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(String likeCount) {
		this.likeCount = likeCount;
	}
	public Timestamp getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}
	public Long getStars() {
		return stars;
	}
	public void setStars(Long stars) {
		this.stars = stars;
	}
	
}
