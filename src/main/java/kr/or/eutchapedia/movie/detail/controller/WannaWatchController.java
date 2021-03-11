package kr.or.eutchapedia.movie.detail.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.eutchapedia.movie.detail.domain.WannaWatchVo;
import kr.or.eutchapedia.movie.detail.service.WannaWatchDao;

@RestController
public class WannaWatchController {
	
	@Autowired
	WannaWatchDao wannaWatchDao;
	
	@RequestMapping(value = "/wannaWatchControl", method = RequestMethod.POST)
	public Map<String, Object> wannaWatchControl(@RequestParam Map<String, Object> map, HttpSession session) {
		Map<String, Object> resultMap = new HashMap<>();
		
		String memberEmail = (String) session.getAttribute("memberEmail");
		String movieDocId = (String) map.get("movieDocId");
		
		WannaWatchVo wannaWatchVo = new WannaWatchVo();
		wannaWatchVo.setMemberEmail(memberEmail);
		wannaWatchVo.setMovieDocId(movieDocId);
		
		int result = 0;
		int selectResult = wannaWatchDao.selectWannaWatch(wannaWatchVo);
		
		if (selectResult == 0) {
			result = wannaWatchDao.addToWannaWatch(wannaWatchVo);
			
		} else if (selectResult == 1) {
			result = wannaWatchDao.removeWannaWatch(wannaWatchVo);
			
		}
		
		resultMap.put("result", result);
		
		return resultMap;
	}
}
