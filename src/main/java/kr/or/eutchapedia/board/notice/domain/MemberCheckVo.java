package kr.or.eutchapedia.board.notice.domain;

public class MemberCheckVo {
	private String memeberEmail;
	private String memberNickName;
	private String memberPwd;
	private String memberPwdSalt;
	private String memberDate;
	private String adminCheck;
    private String memberStatus;
	public String getMemeberEmail() {
		return memeberEmail;
	}
	public void setMemeberEmail(String memeberEmail) {
		this.memeberEmail = memeberEmail;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberPwdSalt() {
		return memberPwdSalt;
	}
	public void setMemberPwdSalt(String memberPwdSalt) {
		this.memberPwdSalt = memberPwdSalt;
	}
	public String getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(String memberDate) {
		this.memberDate = memberDate;
	}
	public String getAdminCheck() {
		return adminCheck;
	}
	public void setAdminCheck(String adminCheck) {
		this.adminCheck = adminCheck;
	}
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
    
	
}
