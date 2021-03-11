package kr.or.eutchapedia.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.eutchapedia.login.service.MemberService;
import kr.or.eutchapedia.login.vo.MemberVo;

@RestController
public class LoginController {

	@Autowired
	private MemberService memberService;

	// 로그인 페이지
	@RequestMapping(value = "/login")
	public ModelAndView loginPage(HttpSession httpSession, HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView("user/member/login");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		
		  if(httpSession.getAttribute("memberEmail") != null) {
			  out.println("<script>alert('로그인 한 상태로 접근이 불가능합니다.');history.go(-1);</script>");
			  out.flush(); 
		  }
		 

		return mv;
	}

	// 로그인 처리
	@RequestMapping(value = "/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView login(@ModelAttribute MemberVo memberVo, HttpSession httpSession, HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		int result = memberService.login(memberVo, httpSession);
		if (result == 1) {
			mv.setViewName("redirect:/"); // 경로 임시
		} else if (result == 0) {
			out.println("<script>alert('차단된 유저 혹은 아이디와 비밀번호를 확인해 주세요.'); location.href='/login';</script>");
			out.flush();
		}

		return mv;
	}

}
