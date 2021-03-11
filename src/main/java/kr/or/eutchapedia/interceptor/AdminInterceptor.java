package kr.or.eutchapedia.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.eutchapedia.login.vo.MemberVo;
@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest req,
			HttpServletResponse res, Object obj) throws Exception {
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		HttpSession session = req.getSession();
		System.out.println("인터셉터진입전");
		MemberVo member = (MemberVo)session.getAttribute("loginchk");
		System.out.println("인터셉터");
		System.out.println(member);
		if(member == null || member.getAdminCheck().equals("N")) {
			out.println("<script>alert('접근이 잘못되었습니다.'); location.href='/';</script>");
			out.flush();
			res.sendRedirect("/");
			return false;
		}

		return true;
	}
}
