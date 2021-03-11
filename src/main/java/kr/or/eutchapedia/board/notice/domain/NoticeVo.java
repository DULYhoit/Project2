package kr.or.eutchapedia.board.notice.domain;

import java.sql.Date;

public class NoticeVo {
	
	private long noticeNo;			// pk
	private String memberEmail;		// 회원식별자
	private String noticeTitle;		// 제목
	private String noticeContent;	// 내용
	private Date noticeDate;		// 작성일
	private String noticeFiles;		// 업로드파일
	private long noticePub;			// 공개여부
	/**
	 * @return the noticeNo
	 */
	public long getNoticeNo() {
		return noticeNo;
	}
	/**
	 * @param noticeNo the noticeNo to set
	 */
	public void setNoticeNo(long noticeNo) {
		this.noticeNo = noticeNo;
	}
	/**
	 * @return the memberEmail
	 */
	public String getMemberEmail() {
		return memberEmail;
	}
	/**
	 * @param memberEmail the memberEmail to set
	 */
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	/**
	 * @return the noticeTitle
	 */
	public String getNoticeTitle() {
		return noticeTitle;
	}
	/**
	 * @param noticeTitle the noticeTitle to set
	 */
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	/**
	 * @return the noticeContent
	 */
	public String getNoticeContent() {
		return noticeContent;
	}
	/**
	 * @param noticeContent the noticeContent to set
	 */
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	/**
	 * @return the noticeDate
	 */
	public Date getNoticeDate() {
		return noticeDate;
	}
	/**
	 * @param noticeDate the noticeDate to set
	 */
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	/**
	 * @return the noticeFiles
	 */
	public String getNoticeFiles() {
		return noticeFiles;
	}
	/**
	 * @param noticeFiles the noticeFiles to set
	 */
	public void setNoticeFiles(String noticeFiles) {
		this.noticeFiles = noticeFiles;
	}
	/**
	 * @return the noticePub
	 */
	public long getNoticePub() {
		return noticePub;
	}
	/**
	 * @param noticePub the noticePub to set
	 */
	public void setNoticePub(long noticePub) {
		this.noticePub = noticePub;
	}
	@Override
	public String toString() {
		return "NoticeVo [noticeNo=" + noticeNo + ", memberEmail=" + memberEmail + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + ", noticeFiles=" + noticeFiles
				+ ", noticePub=" + noticePub + "]";
	}
	
	

}

