package kr.or.eutchapedia.movie.detail.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.or.eutchapedia.movie.detail.domain.CommentLikeVo;


@Repository
@Mapper
public interface CommentLikeMapper {
	public CommentLikeVo likeCheck(Map<String, Object> commandMap);
	public int selectLikeCount(int commentIndex);
	public int pressLike(Map<String, Object> commandMap);
	public void updateLikeCount(int commentIndex);
	public void cancelLike(Map<String, Object> commandMap);
	public void cancelLikeCount(int commentIndex);
	public void updateLikeCheck(Map<String, Object> commandMap);
	
}
