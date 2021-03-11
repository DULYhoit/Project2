package kr.or.eutchapedia.board.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.eutchapedia.board.notice.domain.Criteria;
import kr.or.eutchapedia.board.notice.domain.MemberCheckVo;
import kr.or.eutchapedia.board.notice.domain.NoticeVo;
import kr.or.eutchapedia.board.notice.domain.Paging;
import kr.or.eutchapedia.board.notice.service.NoticeService;

@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;

	@RequestMapping("/list")
	public String boardList(Criteria cri, Model model, HttpSession session) throws Exception {
		List<NoticeVo> list = noticeService.boardList(cri);
		String member = (String)session.getAttribute("memberEmail1");
		if(member == null) {
			member = (String)session.getAttribute("memberEmail");
		}
		MemberCheckVo getmember = noticeService.getMember(member);
		
		int total = noticeService.totalCnt(cri);
		model.addAttribute("getmember",getmember);
		model.addAttribute("list", list);
		model.addAttribute("paging", new Paging(cri, total));
		return "/user/board/notice/notiboard";
	}
	
	@RequestMapping("/list/{noticeIdx}")
	public String boardDetail(long noticeNo, Model model, HttpSession session) throws Exception {
		model.addAttribute("detail", noticeService.boardDetail(noticeNo));
		return "redirect:/notice/list";
	}

	// 글쓰기 폼
	@RequestMapping(value="/insertView")
	public String openInsertForm() throws Exception {
		return "/user/board/notice/notiboard(admin_write)";
	}
	
	// 글 등록
	@RequestMapping("/insert.do")
	public String insertNotice(@ModelAttribute("board") NoticeVo board, Model model, HttpSession session) throws Exception {
		noticeService.insertNotice(board);
		return "redirect:/notice/list";
	}
	
	/**
	 * 게시판 수정폼
	 * @param board
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 * */
	
	@RequestMapping(value="/updateView", method = RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam long noticeNo, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("페이지 = " +noticeNo);
		NoticeVo board = noticeService.boardDetail(noticeNo);
		mv.addObject("board", board);
		mv.setViewName("/user/board/notice/notiboard(admin_modify)");
		return mv;
	}
	
	/**
	 * 글 수정하기
	 * @return
	 * */
	@RequestMapping(value="/update.do", method = RequestMethod.POST)
	public String updateNotice(@ModelAttribute("board") NoticeVo board, Model model, HttpSession session) throws Exception {
		noticeService.updateNotice(board);
		return "redirect:/notice/list";
	}
	
	/**
	 * 글 삭제
	 * @return
	 * */
	@RequestMapping(value="/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteNotice(@RequestParam("noticeNo") String noticeNo, HttpSession session) throws Exception {
		noticeService.deleteNotice(noticeNo);
		return "redirect:/notice/list";
	}
	
	/**
	 * 글 선택 삭제
	 * @throws Exception 
	 * */
	@RequestMapping(value = "/deleteChk")
	public String ajaxTest(HttpServletRequest request, HttpSession session) throws Exception {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			noticeService.deleteNotice(ajaxMsg[i]);
		}
		return "redirect:/notice/list";
	}
	
}
