package kr.or.eutchapedia.mypage.entity;

public class StarRatingForMainVo {
	
	private int starIndex;
	private String movieDocId;
	private String memberEmail;
	private String starRating; 
	private String title;
	private String nation;
	private String movieRunningTime;
	private String prodYear;
	private String posterUri;
	private String genre;
	private String majorGenre;
	
	
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
	public String getMajorGenre() {
		return majorGenre;
	}
	public void setMajorGenre(String majorGenre) {
		this.majorGenre = majorGenre;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getMovieRunningTime() {
		return movieRunningTime;
	}
	public void setMovieRunningTime(String movieRunningTime) {
		this.movieRunningTime = movieRunningTime;
	}
	public String getPosterUri() {
		return posterUri;
	}
	public void setPosterUri(String posterUri) {
		this.posterUri = posterUri;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getStarIndex() {
		return starIndex;
	}
	public void setStarIndex(int starIndex) {
		this.starIndex = starIndex;
	}
	public String getMovieDocId() {
		return movieDocId;
	}
	public void setMovieDocId(String movieDocId) {
		this.movieDocId = movieDocId;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getStarRating() {
		return starRating;
	}
	public void setStarRating(String starRating) {
		this.starRating = starRating;
	}
	
	
	
}
