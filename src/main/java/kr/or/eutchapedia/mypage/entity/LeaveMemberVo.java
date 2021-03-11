package kr.or.eutchapedia.mypage.entity;

import java.util.Date;

public class LeaveMemberVo {
	
	private int leaveMemberIndex;
	private String memberEmail;
	private int reason1;
	private int reason2;
	private int reason3;
	private int reason4;
	private Date leaveDate;
	
	public Date getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}
	
	public int getLeaveMemberIndex() {
		return leaveMemberIndex;
	}
	public void setLeaveMemberIndex(int leaveMemberIndex) {
		this.leaveMemberIndex = leaveMemberIndex;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public int getReason1() {
		return reason1;
	}
	public void setReason1(int reason1) {
		this.reason1 = reason1;
	}
	public int getReason2() {
		return reason2;
	}
	public void setReason2(int reason2) {
		this.reason2 = reason2;
	}
	public int getReason3() {
		return reason3;
	}
	public void setReason3(int reason3) {
		this.reason3 = reason3;
	}
	public int getReason4() {
		return reason4;
	}
	public void setReason4(int reason4) {
		this.reason4 = reason4;
	}

}
