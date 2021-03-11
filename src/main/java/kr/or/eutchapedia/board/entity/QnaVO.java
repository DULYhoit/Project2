package kr.or.eutchapedia.board.entity;

import java.util.Date;

public class QnaVO {
	private long qnaNo;			//qna게시판 식별자
	private String memberEmail;	//아이디
	private String qnaTitle;	//qna 제목
	private String qnaContent;	//qna 내용
	private Date qnaDate;		//qna 등록날짜
	private String qnaFilename;	//qna 파일이름
	private String qnaFilepath; //qna 파일경로
	private String aContent;
	
	

	/*
	private int rNo;
	private int qnaNo1;
	private String rTitle;
	private String rContent;
	private String rDate;
	*/
	
	public QnaVO() {
		// TODO Auto-generated constructor stub
	}

	public QnaVO(long qnaNo, String memberEmail, String qnaTitle, String qnaContent, Date qnaDate, String qnaFilename,
			String qnaFilepath, String aContent) {
		super();
		this.qnaNo = qnaNo;
		this.memberEmail = memberEmail;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.qnaFilename = qnaFilename;
		this.qnaFilepath = qnaFilepath;
		this.aContent = aContent;
	}

	public long getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(long qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getQnaFilename() {
		return qnaFilename;
	}

	public void setQnaFilename(String qnaFilename) {
		this.qnaFilename = qnaFilename;
	}

	public String getQnaFilepath() {
		return qnaFilepath;
	}

	public void setQnaFilepath(String qnaFilepath) {
		this.qnaFilepath = qnaFilepath;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	
	
	
}
