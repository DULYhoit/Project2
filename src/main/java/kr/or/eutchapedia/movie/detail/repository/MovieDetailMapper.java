package kr.or.eutchapedia.movie.detail.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.or.eutchapedia.movie.collection.domain.CollectionVo;
import kr.or.eutchapedia.movie.detail.domain.CommentLikeVo;
import kr.or.eutchapedia.movie.detail.domain.CommentVo;
import kr.or.eutchapedia.movie.detail.domain.MovieInfoVo;
import kr.or.eutchapedia.movie.detail.domain.StaffFilmoVo;
import kr.or.eutchapedia.movie.detail.domain.StaffInfoVo;
import kr.or.eutchapedia.movie.detail.domain.StarRatingVo;

@Repository
@Mapper
public interface MovieDetailMapper {
	public MovieInfoVo selectMovieInfo(String movieDocId);
	public List<StaffInfoVo> selectStaffList(String movieDocId);
	public List<StaffFilmoVo> selectStaffFilmo(String staffId);
	public void updateHitCount(String movieDocId);
	public Map<String, Object> selectStarAvg(String movieDocId);
	public List<Map<String, Object>> selectStarData(String movieDocId);
	public List<Map<String, Object>> selectComments(String movieDocId);
	public int selectWannaWatch(Map<String, Object> map);
	public StarRatingVo checkRatedStars(Map<String, Object> map);
	public CommentVo checkCommentData(Map<String, Object> map); 
	public List<CollectionVo> selectCollectionInfo(Integer pickIndex);
	public List<Integer> selectCollectionIndex(String movieDocId);
	public List<CommentLikeVo> selectLikeData(Map<String, Object> map);
	public String selectMemberNickname(String memberEmail);
} 
