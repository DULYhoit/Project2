package kr.or.eutchapedia.movie.detail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eutchapedia.movie.detail.domain.StarRatingVo;
import kr.or.eutchapedia.movie.detail.repository.StarRatingMapper;

@Service
@Transactional
public class StarRatingDao {
	
	@Autowired
	StarRatingMapper mapper;
	
	public int checkRatedStars(StarRatingVo starRatingVo) {
		int result = 0;
		
		try {
			result = mapper.checkRatedStars(starRatingVo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int getStarIndex(StarRatingVo starRatingVo) {
		int starIndex = 0;
		
		try {
			starIndex = mapper.getStarIndex(starRatingVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return starIndex;
	}
	
	public int rateStars(StarRatingVo starRatingVo) {
		int result = 0;
		
		try {
			mapper.rateStars(starRatingVo);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int cancelRatedStars(StarRatingVo starRatingVo) {
		int result = 0;
		
		try {
			mapper.cancelRatedStars(starRatingVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
