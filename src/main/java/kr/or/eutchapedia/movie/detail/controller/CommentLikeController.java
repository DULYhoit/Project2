package kr.or.eutchapedia.movie.detail.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.eutchapedia.movie.detail.domain.CommentLikeVo;
import kr.or.eutchapedia.movie.detail.service.CommentLikeDao;

@RestController
public class CommentLikeController {
	
	@Autowired
	CommentLikeDao dao;

	@RequestMapping(value = "/commentLike", method = RequestMethod.POST)
	public Map<String, Object> pressLike(@RequestParam Map<String, Object> commandMap, HttpSession session) {
		Map<String, Object> resultMap = new HashMap<>(); // 값 담아서 보낼 Map
		CommentLikeVo likeVo = new CommentLikeVo();
		 
		int resultCode = 0;
		int likeCheck = 0;
		int likeCount = 0;
		int commentIndex = Integer.parseInt( (String) commandMap.get("commentIndex"));
		
		String memberEmail = (String) session.getAttribute("memberEmail");
		commandMap.put("memberEmail", memberEmail); 
		 
		try {
			likeVo = dao.likeCheck(commandMap);
			
			if (likeVo == null) {
				dao.pressLike(commandMap);
				dao.updateLikeCount(commentIndex);
				resultCode = 1;
				likeCheck = 1;
			} else if(likeVo.getLikeCheck() == 0) {
				dao.updateLikeCheck(commandMap);
				dao.updateLikeCount(commentIndex);
				resultCode = 1;
				likeCheck = 1;
			} else if (likeVo.getLikeCheck() == 1) {
				dao.cancelLike(commandMap);
				dao.cancelLikeCount(commentIndex);
			}
			likeCount = dao.selectLikeCount(commentIndex);
			System.out.println(likeCount);
			resultMap.put("likeCheck", likeCheck);
			resultMap.put("likeCount", likeCount);
			
		} catch (Exception e) {
			e.printStackTrace();
			resultCode = -1;
		}
		resultMap.put("resultCode", resultCode);
		
		return resultMap;
	}
}
