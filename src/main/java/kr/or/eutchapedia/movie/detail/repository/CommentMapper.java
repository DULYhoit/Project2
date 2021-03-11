package kr.or.eutchapedia.movie.detail.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.or.eutchapedia.movie.detail.domain.CommentLikeVo;
import kr.or.eutchapedia.movie.detail.domain.CommentListVo;
import kr.or.eutchapedia.movie.detail.domain.CommentPage;
import kr.or.eutchapedia.movie.detail.domain.CommentVo;

@Repository
@Mapper
public interface CommentMapper {
	public int totalListSize(CommentPage page);
	public List<CommentListVo> selectCommentList(CommentPage page);
	public String selectMovieTitle(String movieDocId);
	public int insertComment(CommentVo commentVo);
	public int updateComment(CommentVo commentVo);
	public int deleteComment(int commentIndex);
	public List<CommentLikeVo> selectLikeData(Map<String, Object> map);
} 