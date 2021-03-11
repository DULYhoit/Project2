package kr.or.eutchapedia.board.controller.admin;

import java.util.ArrayList;
import java.util.Arrays;
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

import kr.or.eutchapedia.board.controller.service.FaqService;
import kr.or.eutchapedia.board.entity.Faq;
import kr.or.eutchapedia.board.entity.FaqView;
import kr.or.eutchapedia.board.notice.domain.MemberCheckVo;
import kr.or.eutchapedia.board.notice.service.NoticeService;


@Controller
@RequestMapping("/faq")
public class FaqController {
   
   @Autowired
   private FaqService service;
   @Autowired
   private NoticeService noticeService;
   
   /*
    * @Autowired private Faq faq;
    */
   
   //목록 
   @RequestMapping("/faq_list(admin)") 
   public String list(Model model, HttpServletRequest request, HttpSession session) {
	   
	   String member = (String)session.getAttribute("memberEmail1");
		if(member == null) {
			member = (String)session.getAttribute("memberEmail");
		}
	   
	   MemberCheckVo getmember = noticeService.getMember(member);
		
		model.addAttribute("getmember",getmember);
	   
	   String[] openIds = request.getParameterValues("open-id");
	   String cmd = request.getParameter("cmd");
	   /*
	   String ids_ = request.getParameter("ids");
	  
	   System.out.println("ids_ : " + ids_ );
	  
	   
	   String[] ids = ids_.trim().split(" ");
	  
		 for(String openId : openIds) 
			 System.out.printf("open id :%s\n", openId);
		  
		 List<String> oids = Arrays.asList(openIds);
		 List<String> cids = new ArrayList(Arrays.asList(ids)); 
		 cids.removeAll(oids);
		 
		 System.out.println("ids: " + Arrays.asList(ids)); 
		 System.out.println("oids: " + oids);
		 System.out.println("cids: " + cids);
		  
		// int result = service.updatePubAll(oids, cids);
		 
     // service.closeList(closeIds);
 
	  /**/
      String field_ = request.getParameter("f");
      String query_ = request.getParameter("q");
      String page_ = request.getParameter("p");
      
      String field = "FAQ_TITLE";
      if(field_ != null && !field_.equals(""))
         field = field_;
      
      String query = "";
      if(query_ != null && !query_.equals(""))
         query = query_;

      int page = 1;
      if(page_ != null && !page_.equals(""))
         page = Integer.parseInt(page_);
      
      
      List<FaqView> list = service.getViewList(page, field, query);
      int count = service.getCount(field, query);
      //추가
      model.addAttribute("list", list);
      model.addAttribute("count", count);
      //추가 
      return "/user/board/faq/faq_list(admin)";  
   }
   
   //상세페이지 
   @RequestMapping("/faq_list(admin)/{faqNo}")
   public String detail(int faqNo, Model model) throws Exception {
      model.addAttribute("detail", service.detail(faqNo));
      return "redirect:/faq/faq_list(admin)";
   }
   
   //등록페이지
   @RequestMapping("/faq_reg(admin)") 
   public String regPage() {
      return "/user/board/faq/faq_reg(admin)";
      
   }
   
   //등록
   @RequestMapping("/faq_reg(admin)/do")
   public String reg(Faq faq, HttpServletRequest request) { 
      String faqTitle = request.getParameter("faqTitle");
      String faqContent = request.getParameter("faqContent");   
      String isOpen = request.getParameter("open");
      String faqFiles = request.getParameter("file[]");
      
      boolean pub = false;
      if(isOpen != null)
         pub = true;
      
      
      faq.setFaqTitle(faqTitle);
      faq.setFaqContent(faqContent);
      faq.setFaqFiles(faqFiles);
      faq.setFaqPub(pub);
      System.out.println("타이틀 값 들어옴"+faq.getFaqTitle());
      
      int result = service.insert(faq);
      
      return "redirect:/faq/faq_list(admin)";
      
   }
   
   //수정페이지
   @RequestMapping(value="/updateView", method = RequestMethod.GET)
   public ModelAndView updateForm(@RequestParam int faqNo) throws Exception{
      ModelAndView mv = new ModelAndView();
      
      System.out.println("페이지 = " + faqNo);
      
      Faq faq = service.detail(faqNo);
      mv.addObject("faq", faq);
      mv.setViewName("/user/board/faq/faq_edit(admin)");
      return mv;
   }
   
   //수정
   @RequestMapping(value="/update.do", method = RequestMethod.POST)
   public String updateFaq(@ModelAttribute("faq") Faq faq, Model model)throws Exception {
         	service.update(faq);
         return "redirect:/faq/faq_list(admin)";
   }
   
   
   //삭제
   @RequestMapping(value="/delete", method = {RequestMethod.GET, RequestMethod.POST})
   public String delete(@RequestParam("faqNo")String faqNo) throws Exception {
	   		service.delete(faqNo);		
	   	return "redirect:/faq/faq_list(admin)";
   }

   
   //선택삭제 
   @RequestMapping(value = "/deleteChk")
	public String ajaxTest(HttpServletRequest request) throws Exception {
	   String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.delete(ajaxMsg[i]);
		}
	   	return "redirect:/faq/faq_list(admin)";
	}
   
   //@RequestMapping()
   
   
}