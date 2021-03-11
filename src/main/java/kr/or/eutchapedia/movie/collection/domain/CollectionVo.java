package kr.or.eutchapedia.movie.collection.domain;

public class CollectionVo {
	private int pickIndex;
	private String pickName;
	private String movieDocId;
	private String title;
	private String prodYear;
	private String nation;
	private String posterUri;
	
	public int getPickIndex() {
		return pickIndex;
	}
	public void setPickIndex(int pickIndex) {
		this.pickIndex = pickIndex;
	}
	public String getPickName() {
		return pickName;
	}
	public void setPickName(String pickName) {
		this.pickName = pickName;
	}
	public String getMovieDocId() {
		return movieDocId;
	}
	public void setMovieDocId(String movieDocId) {
		this.movieDocId = movieDocId;
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
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getPosterUri() {
		return posterUri;
	}
	public void setPosterUri(String posterUri) {
		this.posterUri = posterUri;
	}
	@Override
	public String toString() {
		return "CollectionVo [pickIndex=" + pickIndex + ", pickName=" + pickName + ", movieDocId=" + movieDocId
				+ ", title=" + title + ", prodYear=" + prodYear + ", nation=" + nation + ", posterUri=" + posterUri
				+ "]";
	}
	
	
	
}
