package kr.or.eutchapedia.movie.detail.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eutchapedia.movie.collection.domain.CollectionVo;
import kr.or.eutchapedia.movie.detail.domain.CommentLikeVo;
import kr.or.eutchapedia.movie.detail.domain.CommentVo;
import kr.or.eutchapedia.movie.detail.domain.MovieInfoVo;
import kr.or.eutchapedia.movie.detail.domain.StaffFilmoVo;
import kr.or.eutchapedia.movie.detail.domain.StaffInfoVo;
import kr.or.eutchapedia.movie.detail.domain.StarRatingVo;
import kr.or.eutchapedia.movie.detail.repository.MovieDetailMapper;

@Service
@Transactional
public class MovieDetailDao {

	@Autowired
	MovieDetailMapper mapper;

	// 영화 정보 반환 
	public MovieInfoVo selectMovieInfo(String movieDocId) {

		MovieInfoVo movieInfoVo = new MovieInfoVo();

		try {
			movieInfoVo = mapper.selectMovieInfo(movieDocId);

			String prodYear = movieInfoVo.getProdYear().substring(0, 4);
			movieInfoVo.setProdYear(prodYear);

		} catch (Exception e) {                                                                                                                                                                                                                                                                                                                                                                                                                                          
			e.printStackTrace();
		}

		return movieInfoVo;

	}

	// 스태프 List 반환 
	public List<StaffInfoVo> selectStaffList(String movieDocId) {

		List<StaffInfoVo> staffList = new ArrayList<>();

		try {
			staffList = mapper.selectStaffList(movieDocId);

			for (StaffInfoVo s : staffList) {
				if (s.getStaffRole().equals("null")) {
					s.setStaffRole("");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return staffList;
	}

	// staff filmo 반환, 동명이인 문제 해결 완료 
	public List<StaffFilmoVo> selectStaffFilmo(String staffId) {

		List<StaffFilmoVo> staffFilmoList = new ArrayList<>();

		try {
			staffFilmoList = mapper.selectStaffFilmo(staffId);

			for (StaffFilmoVo s : staffFilmoList) {
				String prodYear = s.getProdYear().substring(0, 4);
				s.setProdYear(prodYear);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return staffFilmoList;
	}

	// 영화 클릭 시 조회수 update
	public void updateHitCount(String movieDocId) {

		try {
			mapper.updateHitCount(movieDocId);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public Map<String, Object> selectStarAvg(String movieDocId) {

		Map<String, Object> starAvgMap = new HashMap<>();

		try {
			starAvgMap = mapper.selectStarAvg(movieDocId);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return starAvgMap;
	}

	// 별점 데이터 반환 
	public List<Map<String, Object>> selectStarData(String movieDocId) {
		List<Map<String, Object>> starDataList = new ArrayList<>();

		try {
			starDataList = mapper.selectStarData(movieDocId);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return starDataList;
	}

	// 코멘트 상위 3개 반환
	public List<Map<String, Object>> selectComments(String movieDocId) {
		List<Map<String, Object>> commentList = new ArrayList<>();

		try {
			commentList = mapper.selectComments(movieDocId);

			for (Map<String, Object> map : commentList) {
				if (map.get("PHOTO") == null) {
					map.put("PHOTO", "/img/movie/profile.svg");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return commentList;
	}

	public int selectWannaWatch(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.selectWannaWatch(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public StarRatingVo checkRatedStars(Map<String, Object> map) {
		StarRatingVo starRatingVo = new StarRatingVo();

		try {
			starRatingVo = mapper.checkRatedStars(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return starRatingVo;

	}

	public CommentVo checkCommentData(Map<String, Object> map) {
		CommentVo commentVo = new CommentVo();

		try {
			commentVo = mapper.checkCommentData(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return commentVo;
	}

	public List<CollectionVo> selectCollectionInfo(Integer pickIndex) {
		List<CollectionVo> collectionList = new ArrayList<>();
		
		try {
			collectionList = mapper.selectCollectionInfo(pickIndex);
			for (CollectionVo vo : collectionList) {
				vo.setProdYear(vo.getProdYear().substring(0, 4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return collectionList;
	}
	
	public List<Integer> selectCollectionIndex(String movieDocId) {
		List<Integer> collectionIndexList = new ArrayList<>();
		
		try {
			collectionIndexList = mapper.selectCollectionIndex(movieDocId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return collectionIndexList;
	}
	
	public List<CommentLikeVo> selectLikeData(Map<String, Object> map) {
		List<CommentLikeVo> likeDataList = new ArrayList<>();
		
		try {
			likeDataList = mapper.selectLikeData(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return likeDataList;
	}
	
	public String selectMemberNickname(String memberEmail) {
		String memberNickname = "";
		
		try {
			memberNickname = mapper.selectMemberNickname(memberEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberNickname;
 	}

}
