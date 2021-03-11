package kr.or.eutchapedia.admin.member.controll;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.eutchapedia.admin.member.entity.MemberCount;
import kr.or.eutchapedia.admin.member.entity.Memberinfo;
import kr.or.eutchapedia.admin.member.service.MemberselectService;


@RequestMapping("/admin")
@RestController
//셀렉트멤버
public class AdminMemberController {
	@Autowired
	private MemberselectService service;


	@RequestMapping("/selectmember")
	public ModelAndView selectMember(Model model,HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("admin/member/selectMember");
		String field_ = req.getParameter("f");
		String query_ = req.getParameter("q");
		String number_ = req.getParameter("p");
		String field = "member_email"; 
		if(field_ != null && !field_.equals(""))
			field = field_;
		String query = "";
		if(query_ != null && !query_.equals(""))
			query = query_;
		int number = 1;

		if(number_ != null && !number_.equals(""))
			number = Integer.parseInt(number_);
		int page = 1+(number-1)*10;
		int amount = number*10;

		System.out.println(page);
		System.out.println(amount);

		System.out.println("여기까지실행됨");
		List<Memberinfo> memberlist = service.getmemberList(field, query, page,amount);

		String count = null;
		List<MemberCount> membercount = service.getmemberCount(field,query);
		if(!membercount.isEmpty())
			count = membercount.get(membercount.size() - 1).getNum();
		System.out.println("총 갯수 : " + count);

		model.addAttribute("memberlist", memberlist);
		model.addAttribute("count",count);



		return mv;

	}

	//삭제
	@RequestMapping("/selectmember/delete")
	public ModelAndView memberDelete(Model model,HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String[] memberemail_ = req.getParameterValues("RowCheck");
		String memberemail = null;
		String sub_ =req.getParameter("sub");
		int sub = Integer.parseInt(sub_);

		String status=req.getParameter("status");
		System.out.println(status);




		switch (sub) {
		case 1:
			if(memberemail_ != null && !memberemail_.equals("")) {

				for (int i = 0; i < memberemail_.length; i++) {
					memberemail = memberemail_[i];
					int updatestatus = service.updateStatus(memberemail,status);

				}
			}

			break;

		case 2:
			if(memberemail_ != null && !memberemail_.equals("")) {

				for (int i = 0; i < memberemail_.length; i++) {
					memberemail = memberemail_[i];
					int memberdelete = service.delMember(memberemail);

				}
			}

			break;
		}


		mv.setViewName("redirect:/admin/selectmember");

		return mv;



	}



	//차단유저게시판	
	@RequestMapping("/blockmember")
	public ModelAndView blockmember(Model model,HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("admin/member/blockMember");
		//선택창
		String field_ = req.getParameter("f");
		//검색
		String query_ = req.getParameter("q");
		//페이징
		String number_ = req.getParameter("p");
		String field = "member_email"; 
		if(field_ != null && !field_.equals(""))
			field = field_;
		String query = "";
		if(query_ != null && !query_.equals(""))
			query = query_;
		int number = 1;

		if(number_ != null && !number_.equals(""))
			number = Integer.parseInt(number_);
		int page = 1+(number-1)*10;
		int amount = number*10;

		System.out.println(page);
		System.out.println(amount);

		System.out.println("여기까지실행됨");
		List<Memberinfo> memberlist = service.getmemberList(field, query, page,amount);

		String count = null;
		List<MemberCount> membercount = service.getmemberCount(field,query);
		if(!membercount.isEmpty())
			count = membercount.get(membercount.size() - 1).getNum();
		System.out.println("총 갯수 : " + count);

		model.addAttribute("memberlist", memberlist);
		model.addAttribute("count",count);

		return mv;

	}
}
