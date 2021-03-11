package kr.or.eutchapedia.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eutchapedia.main.entity.CommentVo;
import kr.or.eutchapedia.main.entity.MovieInfoVo;
import kr.or.eutchapedia.main.repository.MainMapper;


@Service
@Transactional
public class MainMovieDao {
	@Autowired
	MainMapper mapper;


	/*
	 * public Map<String, Object> selectStarAvg(String movieDocId) {
	 * 
	 * Map<String, Object> starAvgMap = new HashMap<>();
	 * 
	 * try { starAvgMap = mapper.selectStarAvg(movieDocId);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return starAvgMap; }
	 * 
	 * // 별점 데이터 반환 public List<Map<String, Object>> selectStarData(String
	 * movieDocId) { List<Map<String, Object>> starDataList = new ArrayList<>();
	 * 
	 * try { starDataList = mapper.selectStarData(movieDocId);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return starDataList; }
	 * 
	 */
		//왓챠 순위 

		public List<MovieInfoVo> selectWatchaList() {
			
			List<MovieInfoVo> watchaList = mapper.selectWatchaList();
		
			
			return watchaList;
		}
		
		
		//넷플릭스 순위 

		public List<MovieInfoVo> selectNetflixList() {
			
			List<MovieInfoVo> netflixList = mapper.selectNetflixList();
		
			
			return netflixList;
		}
		
		
		//검색 인기 순위 

		public List<MovieInfoVo> selectSearchList() {
			
			List<MovieInfoVo> searchList = mapper.selectSearchList();
		
			
			return searchList;
		}
		
		//리뷰 인기 순위 

		public List<MovieInfoVo> selectReviewList() {
			
			List<MovieInfoVo> reviewList = mapper.selectReviewList();
		
			
			return reviewList;
		}
		
		
}
