package kr.or.eutchapedia.movie.detail.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eutchapedia.movie.detail.domain.CommentLikeVo;
import kr.or.eutchapedia.movie.detail.repository.CommentLikeMapper;

@Service
@Transactional
public class CommentLikeDao {
	
	@Autowired
	CommentLikeMapper mapper;
	
	// 해당 사용자가 좋아요 누른 적 있는지 확인 
	public CommentLikeVo likeCheck(Map<String, Object> commandMap) {
		CommentLikeVo likeVo = new CommentLikeVo();
		
		try {
			likeVo = mapper.likeCheck(commandMap);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return likeVo;
	}
	
	// like count select
	public int selectLikeCount(int commentIndex) {
		int result = 0;
		
		try {
			result = mapper.selectLikeCount(commentIndex);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 최초 좋아요 
	public int pressLike(Map<String, Object> commandMap) {
		int result = 0;
		
		try {
			result = mapper.pressLike(commandMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public void updateLikeCount(int commentIndex) {
		try {
			mapper.updateLikeCount(commentIndex);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 좋아요 취소 
	public void cancelLike(Map<String, Object> commandMap) {
		try {
			mapper.cancelLike(commandMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 좋아요 취소 시 코멘트 좋아요 숫자 내리기 
	public void cancelLikeCount(int commentIndex) {
		try {
			mapper.cancelLikeCount(commentIndex);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 좋아요 눌렀던 적 있는 회원이 다시 좋아요 누르면 
	public void updateLikeCheck(Map<String, Object> commandMap) {
		try {
			mapper.updateLikeCheck(commandMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
 