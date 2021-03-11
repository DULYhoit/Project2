package kr.or.eutchapedia.mypage.controller;

import java.io.File;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import kr.or.eutchapedia.mypage.entity.MemberVo;
import kr.or.eutchapedia.mypage.salt.Utils;
import kr.or.eutchapedia.mypage.service.MypageService;

@RequestMapping("/mypage")
@RestController
public class MypageEditController {
	
	@Autowired
	MypageService service;
	
	@Autowired
	ServletContext ctx;
	
		
	@RequestMapping("/edit")
	public ModelAndView mypageeditprofile(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		if((String) session.getAttribute("memberEmail") == null) {
			mv.setViewName("/user/mypage/inaccessible");
		}
		else {
		String memberemail = (String) session.getAttribute("memberEmail");
		MemberVo member = service.getMemberInfo(memberemail);
		
		mv.addObject("member", member);
		mv.setViewName("/user/mypage/mypage_editprofile(ver3)");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/edit.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView mypageeditprofileDo(MemberVo vo, MultipartFile profileimg, HttpServletRequest request ) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		FileUtils file = new FileUtils(); //uuid 이용해서 파일 리네임 생성해보자....
		String newfilename ="";
		String photo = vo.getMemberPhoto(); 
		
		
		System.out.println("포토는:"+photo);
		
		long size = profileimg.getSize();
		String fileName = profileimg.getOriginalFilename();
			
			if(fileName != "") { //이미지 변경없이 수정누르면 널이 아닌 공백으로 들어온다...
				newfilename = file.uploadFileRename(fileName) + fileName;
					
				System.out.printf("fimeName:%s, fileSize:%d\n",newfilename,size);
				String webPath = "/static/upload";
				String realPath = ctx.getRealPath(webPath);
				System.out.printf("realPath : %s\n", realPath);
				//upload파일이 있는지 없는지 확인
				File savePath = new File(realPath);
			if(!savePath.exists())
				savePath.mkdirs(); //없으면 만들어라
			 
			realPath += File.separator + newfilename;
			File saveFile = new File(realPath);
			profileimg.transferTo(saveFile);
			
			System.out.println(newfilename);
		
			}
			else {
				newfilename = photo;
			}
			
		String pwd = vo.getMemberPwd();
		String pwd2 = vo.getMemberPwdChange();

			//패스워드변경
			if(!pwd2.equals("")) {
				Utils utils = new Utils();
				vo.setMemberPwdSalt(utils.getSalt());
				vo.setMemberPwd(utils.getEncrypt(vo.getMemberPwdChange(), vo.getMemberPwdSalt()));
			}
			//패스워드미변경
			else { 
				vo.setMemberPwd(pwd);
			}

		
		vo.setMemberPhoto(newfilename);
		service.editprofile(vo);
		
		String nickname = vo.getMemberNickname();
		System.out.println(nickname);
		mv.addObject("nickname",nickname);
		mv.setViewName("/user/mypage/mypage_edit_complete");
		return mv;
	}
	
	@RequestMapping("/editsocial")
	public ModelAndView mypageeditprofilesocial() {
		ModelAndView mv = new ModelAndView("/user/mypage/mypage_editprofile_social");
		
		return mv;
	}

	
}




