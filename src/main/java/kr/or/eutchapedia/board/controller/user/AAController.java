package kr.or.eutchapedia.board.controller.user;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AAController {
	@RequestMapping("/index")	
	public String aaa() {
			
			return "hellooooooooooooooooo~";
		}
	@RequestMapping("/aabb")	
	public String bbb() {
			
			return "@@@@@@@@@";
		}
}
