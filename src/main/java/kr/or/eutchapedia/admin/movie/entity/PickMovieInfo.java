package kr.or.eutchapedia.admin.movie.entity;

public class PickMovieInfo {
	private String fkMemberEmail;
	private String pickName;
	private String fkPickIndex;
	private String movieDocid;
	private String title;
	private String nation;
	private String genre;
	private int movieHitCount;
	
	public String getFkMemberEmail() {
		return fkMemberEmail;
	}
	public void setFkMemberEmail(String fkMemberEmail) {
		this.fkMemberEmail = fkMemberEmail;
	}
	public String getPickName() {
		return pickName;
	}
	public void setPickName(String pickName) {
		this.pickName = pickName;
	}
	public String getFkPickIndex() {
		return fkPickIndex;
	}
	public void setFkPickIndex(String fkPickIndex) {
		this.fkPickIndex = fkPickIndex;
	}
	public String getMovieDocid() {
		return movieDocid;
	}
	public void setMovieDocid(String movieDocid) {
		this.movieDocid = movieDocid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getMovieHitCount() {
		return movieHitCount;
	}
	public void setMovieHitCount(int movieHitCount) {
		this.movieHitCount = movieHitCount;
	}
	
	
}
