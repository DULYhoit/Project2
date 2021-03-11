package kr.or.eutchapedia.movie.detail.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.eutchapedia.movie.detail.domain.StarRatingVo;
import kr.or.eutchapedia.movie.detail.service.StarRatingDao;

@RestController
public class StarRatingController {
	
	@Autowired
	StarRatingDao starRatingDao;
	
	@RequestMapping(value = "/starRatingControl", method = RequestMethod.POST)
	public Map<String, Object> starRatingControl(@RequestParam Map<String, Object> map, HttpSession session) {
		Map<String, Object> resultMap = new HashMap<>();
		StarRatingVo starRatingVo = new StarRatingVo();
		
		String memberEmail = (String) session.getAttribute("memberEmail");
		String movieDocId = (String) map.get("movieDocId");
		double starRating = Double.valueOf((String) map.get("starRating"));
		
		starRatingVo.setMemberEmail(memberEmail);
		starRatingVo.setMovieDocId(movieDocId);
		starRatingVo.setStarRating(starRating);
		
		int result = 0;
		int selectResult = starRatingDao.checkRatedStars(starRatingVo);
		int starIndex = 0;
		
		if (selectResult == 0) {  // 별점 남긴 적 없음 
			result = starRatingDao.rateStars(starRatingVo); // 별점 남기기 
			starIndex = starRatingDao.getStarIndex(starRatingVo); // 남긴 별점의 인덱스 가져오기
		} else if (selectResult == 1) {
			result = starRatingDao.cancelRatedStars(starRatingVo); // 별점 삭제 
		}
		
		resultMap.put("result", result);
		resultMap.put("starIndex", starIndex);
		
		return resultMap;
	}
}
