package kr.or.eutchapedia.board.entity;

import java.util.Date;

public class QnaView extends QnaVO{
	private String memberNickname;

	public QnaView() {
	}

	public QnaView(long qnaNo, String memberEmail, String qnaTitle, String qnaContent, Date qnaDate, String qnaFilename,
			String qnaFilepath, String aContent) {
		super(qnaNo, memberEmail, qnaTitle, qnaContent, qnaDate, qnaFilename, qnaFilepath, aContent);
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
		return "QnaView [memberNickname=" + memberNickname + ", getQnaNo()=" + getQnaNo() + ", getMemberEmail()="
				+ getMemberEmail() + ", getQnaTitle()=" + getQnaTitle() + ", getQnaContent()=" + getQnaContent()
				+ ", getQnaDate()=" + getQnaDate() + ", getQnaFilename()=" + getQnaFilename() + ", getQnaFilepath()="
				+ getQnaFilepath() + ", getaContent()=" + getaContent() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
