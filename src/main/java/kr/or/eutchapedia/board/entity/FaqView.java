package kr.or.eutchapedia.board.entity;

import java.util.Date;

public class FaqView extends Faq {
	private String memberNickname;
	
	public FaqView() {
	}


	public FaqView(int faqNo, String memberEmail, String faqTitle, String faqContent, boolean faqPub, String faqFiles,
			Date faqRegdate) {
		super(faqNo, memberEmail, faqTitle, faqContent, faqPub, faqFiles, faqRegdate);
		// TODO Auto-generated constructor stub
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	@Override
	public String toString() {
		return "FaqView [memberNickname=" + memberNickname + ", getFaqNo()=" + getFaqNo() + ", getMemberEmail()="
				+ getMemberEmail() + ", getFaqTitle()=" + getFaqTitle() + ", getFaqContent()=" + getFaqContent()
				+ ", getFaqFiles()=" + getFaqFiles() + ", getFaqPub()=" + getFaqPub() + ", toString()="
				+ super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}


}
