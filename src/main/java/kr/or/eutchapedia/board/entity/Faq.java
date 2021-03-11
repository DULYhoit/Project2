package kr.or.eutchapedia.board.entity;

import java.util.Date;

public class Faq {
	private int faqNo;			//faq게시판 식별자
	private String memberEmail;	//아이디
	private String faqTitle;	//faq 제목
	private String faqContent;	//faq 내용
	private boolean faqPub;			//faq 공개여부
	private String faqFiles;	//faq 파일 디비 수정해야함!!!!!!!
	private Date faqRegdate;
	
	public Faq() {
	}

	public Faq(int faqNo, String memberEmail, String faqTitle, String faqContent, boolean faqPub, String faqFiles,
			Date faqRegdate) {
		super();
		this.faqNo = faqNo;
		this.memberEmail = memberEmail;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqPub = faqPub;
		this.faqFiles = faqFiles;
		this.faqRegdate = faqRegdate;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public boolean getFaqPub() {
		return faqPub;
	}

	public void setFaqPub(boolean faqPub) {
		this.faqPub = faqPub;
	}

	public String getFaqFiles() {
		return faqFiles;
	}

	public void setFaqFiles(String faqFiles) {
		this.faqFiles = faqFiles;
	}

	public Date getFaqRegdate() {
		return faqRegdate;
	}

	public void setFaqRegdate(Date faqRegdate) {
		this.faqRegdate = faqRegdate;
	}

	
	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", memberEmail=" + memberEmail + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + ", faqPub=" + faqPub + ", faqFiles=" + faqFiles + ", faqRegdate=" + faqRegdate + "]";
	}
	
	
}
