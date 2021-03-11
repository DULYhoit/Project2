package kr.or.eutchapedia.login.vo;

public class MemberVoTemp {
	

	private String memberPwd;
	private String memberPwdSalt;
	private String memberEmail;
	private String memberStatus;
	private String adminCheck;
	
	
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
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
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getAdminCheck() {
		return adminCheck;
	}
	public void setAdminCheck(String adminCheck) {
		this.adminCheck = adminCheck;
	}
}