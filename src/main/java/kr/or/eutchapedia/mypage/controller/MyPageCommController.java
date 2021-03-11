package kr.or.eutchapedia.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.eutchapedia.mypage.entity.CommentVo;
import kr.or.eutchapedia.mypage.entity.MyQnaVo;
import kr.or.eutchapedia.mypage.service.MyCommService;


@RequestMapping("/mypage")
@Controller
public class MyPageCommController {
	@Autowired
	MyCommService service;

	@RequestMapping("/myq")
	public ModelAndView selectQna(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String memberEmail = (String)session.getAttribute("memberEmail");
		List<MyQnaVo> member = service.selectQna(memberEmail);
		
		mv.addObject("member", member);
		mv.setViewName("/user/mypage/mypage_myq");
		return mv;
	}
	
	@RequestMapping("/mycomment")
	public ModelAndView selectComment(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String memberEmail = (String)session.getAttribute("memberEmail");
		List<CommentVo> list = service.selectComm(memberEmail);
		mv.addObject("list", list);
		mv.setViewName("/user/mypage/mypage_comment");
		return mv;
	}
	
	@RequestMapping(value="/myq/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteQna(@RequestParam("qnaNo") String qnaNo, HttpSession session) throws Exception {
		service.deleteQna(qnaNo);
		return "redirect:/mypage/myq";
	}


}
