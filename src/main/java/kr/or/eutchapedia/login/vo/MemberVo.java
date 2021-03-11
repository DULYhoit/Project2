package kr.or.eutchapedia.login.vo;

import java.sql.Date;

public class MemberVo {
	
	private String memberEmail;
	private String memberNickname;
	private String memberPwd;
	private String memberPwdSalt;
	private Date memberDate;
	private String adminCheck;
	private String memberStatus;
	private String memberPhoto;
	private String memberIntroduce;
	private String memberJoinRoute;
	
	

	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
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
	public Date getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(Date memberDate) {
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
	public String getMemberPhoto() {
		return memberPhoto;
	}
	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}
	public String getMemberIntroduce() {
		return memberIntroduce;
	}
	public void setMemberIntroduce(String memberIntroduce) {
		this.memberIntroduce = memberIntroduce;
	}
	public String getMemberJoinRoute() {
		return memberJoinRoute;
	}
	public void setMemberJoinRoute(String memberJoinRoute) {
		this.memberJoinRoute = memberJoinRoute;
	}
	
	

}
