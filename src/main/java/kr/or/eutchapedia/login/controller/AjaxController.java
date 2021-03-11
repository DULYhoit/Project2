package kr.or.eutchapedia.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.eutchapedia.login.service.MemberService;

@RestController
public class AjaxController {

	@Autowired
	MemberService memberService;

	//이메일 중복 체크
	@RequestMapping(value="/emailchk", method=RequestMethod.POST)
	@ResponseBody
	public int emailchk( String memberEmail) throws Exception {
		int count=0;
		
		count = memberService.emailchk(memberEmail);
		
		System.out.println(count);
		return count;
	}

	// 닉네임 중복 체크
	@RequestMapping(value="/nicknamechk", method=RequestMethod.POST)
	@ResponseBody
	public int nicknamechk(String memberNickname) throws Exception {
		int count = 0;

		count =  memberService.nicknamechk(memberNickname);
		
		System.out.println(count);
		return count;
	}

}
