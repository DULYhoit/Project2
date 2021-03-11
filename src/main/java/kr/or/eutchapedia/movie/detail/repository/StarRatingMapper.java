package kr.or.eutchapedia.movie.detail.repository;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.or.eutchapedia.movie.detail.domain.StarRatingVo;

@Repository
@Mapper
public interface StarRatingMapper {
	public int checkRatedStars(StarRatingVo starRatingVo);
	public int getStarIndex(StarRatingVo starRatingVo);
	public int rateStars(StarRatingVo starRatingVo);
	public int cancelRatedStars(StarRatingVo starRatingVo);
	
}
