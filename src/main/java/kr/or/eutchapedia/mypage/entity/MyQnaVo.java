package kr.or.eutchapedia.mypage.entity;

import java.sql.Date;

public class MyQnaVo {
	private int qnaNo;			//qna게시판 식별자
	private String memberEmail;	//아이디
	private String qnaTitle;	//qna 제목
	private String qnaContent;	//qna 내용
	private Date qnaDate;		//qna 등록날짜
	private String qnaFiles;	//qna 파일
	private String qnaFilename;
	private int qnaAnswer;		//qna 답변여부
	private String answerContent;//qna 답변내용
	private String answerFiles;
	private String aContent;
	private String qnaFilepath;
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
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
	public String getQnaFiles() {
		return qnaFiles;
	}
	public void setQnaFiles(String qnaFiles) {
		this.qnaFiles = qnaFiles;
	}
	public int getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(int qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public String getAnswerFiles() {
		return answerFiles;
	}
	public void setAnswerFiles(String answerFiles) {
		this.answerFiles = answerFiles;
	}
	public String getQnaFilename() {
		return qnaFilename;
	}
	public void setQnaFilename(String qnaFilename) {
		this.qnaFilename = qnaFilename;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getQnaFilepath() {
		return qnaFilepath;
	}
	public void setQnaFilepath(String qnaFilepath) {
		this.qnaFilepath = qnaFilepath;
	}
	@Override
	public String toString() {
		return "MyQnaVo [qnaNo=" + qnaNo + ", memberEmail=" + memberEmail + ", qnaTitle=" + qnaTitle + ", qnaContent="
				+ qnaContent + ", qnaDate=" + qnaDate + ", qnaFiles=" + qnaFiles + ", qnaFilename=" + qnaFilename
				+ ", qnaAnswer=" + qnaAnswer + ", answerContent=" + answerContent + ", answerFiles=" + answerFiles
				+ ", aContent=" + aContent + ", qnaFilepath=" + qnaFilepath + "]";
	}



}
