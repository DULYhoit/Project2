package kr.or.eutchapedia.aboutus.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class AboutUsController {
	
	@RequestMapping(value = "/aboutus")
	public ModelAndView aboutus() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("user/aboutus/about_us");
		
		return mv;
	}
}
