package kr.or.eutchapedia.login.service;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eutchapedia.login.controller.Utils;
import kr.or.eutchapedia.login.dao.MemberDaoInterface;
import kr.or.eutchapedia.login.vo.MemberVo;
import kr.or.eutchapedia.login.vo.MemberVoTemp;


@Service
public class MemberService {

	@Autowired
	private MemberDaoInterface memberDao;
	private Utils utils;

	//회원가입
	public int signup(MemberVo memberVo) {

		int resultCnt = 0;

		try {
			utils = new Utils();
			memberVo.setMemberPwdSalt(utils.getSalt());
			memberVo.setMemberPwd(utils.getEncrypt(memberVo.getMemberPwd(), memberVo.getMemberPwdSalt()));

			resultCnt = memberDao.signup(memberVo);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultCnt;
	}

	//로그인
	public int login(MemberVo memberVo, HttpSession httpSession) {

		//로그인 객체 확인
		System.out.println("//로그인 객체 확인 memberVo : " + memberVo);

		utils = new Utils();

		MemberVoTemp vtemp = new MemberVoTemp(); //로그인 확인용

		String memberEmail = memberVo.getMemberEmail(); //사용자 입력 이메일
		String inputPwd = memberVo.getMemberPwd(); // 사용자 입력 비번
		System.out.println("여기까지");
		vtemp = memberDao.loginchk(memberEmail);
		System.out.println("vtemp 작동");
		int result = 0;
		if(vtemp != null) {

			//비밀번호 암호화
			String salt = vtemp.getMemberPwdSalt(); //솔트
			String pwd = vtemp.getMemberPwd(); //db에서 가져온 최종pwd해시
			String pwdSalt = utils.getEncrypt(inputPwd, salt); //사용자 입력후 해시한 값

			//회원 상태
			String status = vtemp.getMemberStatus();
			String adminCheck = vtemp.getAdminCheck();

			System.out.println("//로그인 객체 확인 vtemp : " + vtemp);
			System.out.println("status 값 : " + status);
			System.out.println("admincheck: " + adminCheck);
			//로그인 결과 값

			if(pwd.equals(pwdSalt) && status.equals("N") || status.equals("C") || vtemp == null ) {
				MemberVo loginchk = memberDao.login(memberEmail, pwdSalt);
				httpSession.setAttribute("loginchk", loginchk);
				System.out.println(loginchk);
				
				// 세션에 아이디값 저장
				if (adminCheck.equals("N")) {
					httpSession.setAttribute("memberEmail", memberEmail);
					System.out.println("회원 이메일 세션 : " + httpSession.getAttribute("memberEmail"));				
				} else if (adminCheck.equals("A")) {
					httpSession.setAttribute("admincheck", adminCheck);
					httpSession.setAttribute("memberEmail1", memberEmail);
					System.out.println("관리자 세션 : " + httpSession.getAttribute("admincheck"));
				}
				result = 1;
			} else {
				System.out.println("불일치");
				result = 0;
			}
		}
		return result;
	}

	//로그아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}

	//이메일 중복 체크
	public int emailchk(String memberEmail) throws Exception {

		return memberDao.emailchk(memberEmail); 
	}

	//닉네임 중복 체크
	public int nicknamechk(String memberNickname) throws Exception {

		return memberDao.nicknamechk(memberNickname);
	}

	//비밀번호 변경
	public String updatepwd(MemberVo memberVo) {

		String msg = "비번변경 성공";
		int cnt = 0;

		try {
			cnt = memberDao.updatepwd(memberVo);

			System.out.println("service cnt : " + cnt);
			if (cnt < 1) {
				msg = "비번변경중 오류";
			}
		} catch (Exception e) {
			msg = e.getMessage();
		}
		return msg;
	}

}	



