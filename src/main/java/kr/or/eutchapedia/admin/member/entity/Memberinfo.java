package kr.or.eutchapedia.admin.member.entity;
import java.sql.Date;

public class Memberinfo {
	
	private String num;
	private String member_email;
	private String member_nickname;
	private String member_pwd;
	private String member_pwd_salt;
	private Date member_date;
	private String admin_check;
	private String member_status;
	private String member_join_route;
	private String comment_report_count;
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_pwd_salt() {
		return member_pwd_salt;
	}
	public void setMember_pwd_salt(String member_pwd_salt) {
		this.member_pwd_salt = member_pwd_salt;
	}
	public Date getMember_date() {
		return member_date;
	}
	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}
	public String getAdmin_check() {
		return admin_check;
	}
	public void setAdmin_check(String admin_check) {
		this.admin_check = admin_check;
	}
	public String getMember_status() {
		return member_status;
	}
	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}
	public String getMember_join_route() {
		return member_join_route;
	}
	public void setMember_join_route(String member_join_route) {
		this.member_join_route = member_join_route;
	}

}
