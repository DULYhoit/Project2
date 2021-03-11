package kr.or.eutchapedia.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.eutchapedia.login.service.MemberService;
import kr.or.eutchapedia.login.vo.MemberVo;
import kr.or.eutchapedia.login.vo.MemberVoTemp;

@Controller

public class FindPasswordController {

	@Autowired
	private MemberService memberService;


	@Autowired
	private JavaMailSender javaMailSender;

	public void sendEmail(String setfrom, String tomail, String title, String content) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(setfrom);
		message.setTo(tomail);
		message.setSubject(title);
		message.setText(content);
		javaMailSender.send(message);
	}

	@GetMapping("/findpassword")
	public String findpasswordGet() {
		return "/user/member/find_password1";
	}

	@PostMapping("/findpassword")
	public String findpassword(HttpServletRequest request, String memberEmail, HttpServletResponse response_email, Model model) {


		//랜덤한 난수 (인증번호)를 생성해서 이메일로 보내고 그 인증번호를 입력하면 비밀번호를 변경할 수 있는 페이지로 이동시킴
		System.out.println(memberEmail);

		Random r = new Random();
		int dice = r.nextInt(89999)+10000;
		
		model.addAttribute("dice", dice);
		model.addAttribute("memberEmail", memberEmail);
		
		String setfrom = "eutchapedia@gmail.com";
		String tomail = memberEmail;   //받는 사람의 이메일
		String title = "[EUTCHAPEDIA]비밀번호 찾기 인증 이메일입니다.";    //제목
		String content =

				System.getProperty("line.separator")+

				System.getProperty("line.separator")+

				"안녕하세요 EUTCHAPEDIA 인증 메일입니다."

                +System.getProperty("line.separator")+

                System.getProperty("line.separator")+

                "인증 번호는 " +dice+ " 입니다. "

                +System.getProperty("line.separator")+

                System.getProperty("line.separator")+

                "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

		try {

			sendEmail(setfrom,tomail,title,content );

		} catch (Exception e) {
			System.out.println(e);
		}


		////        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		////        mv.setViewName("user/member/find_password1");     //뷰의이름
		////        //mv.addObject("dice", dice);
		////        //mv.addObject("memberEmail", memberEmail);
		////        
		////        System.out.println("mv : " +mv);
		//
		////        response_email.setContentType("text/html; charset=UTF-8");
		////        PrintWriter out_email = response_email.getWriter();
		////        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		////        out_email.flush();
		//        
		//return mv;
		return "/user/member/find_password2";
		
		
	}
	
	@GetMapping("/findpassword2")
	public String findpassword2Get() {
		return "/user/member/find_password2";
	}
	

	//인증번호 입력 페이지
	@PostMapping("/findpassword2")
	public ModelAndView findpassword2(String number, int dice, String memberEmail, HttpServletResponse response_equals ) throws IOException {
		
		System.out.println("number : " + number);
		System.out.println("dice : " + dice);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/findpassword3");
		mv.addObject("memberEmail", memberEmail);
		
		if(number.equals(Integer.toString(dice)))  {
			
			//인증번호 일치할 경우 비밀번호 변경 창 이동
			
			mv.setViewName("user/member/find_password3");
			mv.addObject("memberEmail", memberEmail);
			
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
            out_equals.flush();
            
            return mv;
            
            //비밀번호 틀렸을 때
		} else {
			
			ModelAndView mv2 = new ModelAndView();
			
			mv2.setViewName("user/member/find_password2");
			
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하지 않습니다. 인증번호를 다시 입력해 주세요.'); history.go(-1);</script>");
            out_equals.flush();
            
            return mv2;
		}
				
	}

	//비밀번호 변경 페이지
	@RequestMapping(value = "/findpassword3", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView findpassword3(MemberVo memberVo, HttpSession session, String memberEmail) {
		
		ModelAndView mv = new ModelAndView();

		String pwd = memberVo.getMemberPwd();
			
		if(!pwd.equals("") || pwd!=null) {
			Utils utils = new Utils(); 
			memberVo.setMemberPwdSalt(utils.getSalt());
			memberVo.setMemberPwd(utils.getEncrypt(memberVo.getMemberPwd(),memberVo.getMemberPwdSalt()));
			memberVo.setMemberEmail(memberEmail);
			
			//System.out.println("memberpwd: " + memberVo.getMemberPwd()); 
			//System.out.println("memberpwdSalt: " + memberVo.getMemberPwdSalt()); 
			System.out.println("memberemail:" + memberVo.getMemberEmail());
			
			System.out.println("서비스 전");
			String msg = memberService.updatepwd(memberVo);
			System.out.println("서비스 완");
			System.out.println(msg);
			
			mv.addObject("memberEmail", memberEmail);
			mv.setViewName("user/member/find_password_complete");
		}
		
		return mv;
	}


	@RequestMapping(value = "/findpasswordcomplete")
	public ModelAndView findpasswordcomplete(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/user/member/find_password_complete");
		return mv;
	}
}
