package kr.or.eutchapedia.movie.detail.domain;

// 임시. 더 좋은 방법 찾아야 함 
public class StaffFilmoVo {
	
	private String title;
	private String prodYear;
	private String staffName;
	private String staffRoleGroup;
	private String movieDocId;
	private String posterUri;
	private String staffId;
	
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
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getStaffRoleGroup() {
		return staffRoleGroup;
	}
	public void setStaffRoleGroup(String staffRoleGroup) {
		this.staffRoleGroup = staffRoleGroup;
	}
	
	public String getMovieDocId() {
		return movieDocId;
	}
	public void setMovieDocId(String movieDocId) {
		this.movieDocId = movieDocId;
	}
	
	
	public String getPosterUri() {
		return posterUri;
	}
	public void setPosterUri(String posterUri) {
		this.posterUri = posterUri;
	}
	
	public String getStaffId() {
		return staffId;
	}
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
	
	
}
