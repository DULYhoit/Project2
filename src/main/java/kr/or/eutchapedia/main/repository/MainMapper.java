package kr.or.eutchapedia.main.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.or.eutchapedia.main.entity.CommentVo;
import kr.or.eutchapedia.main.entity.MovieInfoVo;


	@Repository
	@Mapper
	public interface MainMapper {

		public MovieInfoVo selectMovieInfo(String movieDocId);
		public List<MovieInfoVo> selectWatchaList(); //왓챠 순위
		public List<MovieInfoVo> selectNetflixList(); //넷플릭스 순위
		public List<MovieInfoVo> selectSearchList();	//조회수 순위 
		public List<MovieInfoVo> selectReviewList();	//인기 리뷰 순위 
		public Map<String, Object> selectStarAvg(String movieDocId);
		public List<Map<String, Object>> selectStarData(String movieDocId);
		

	}