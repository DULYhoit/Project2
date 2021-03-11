package kr.or.eutchapedia.movie.detail.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eutchapedia.movie.detail.domain.CommentLikeVo;
import kr.or.eutchapedia.movie.detail.domain.CommentListVo;
import kr.or.eutchapedia.movie.detail.domain.CommentPage;
import kr.or.eutchapedia.movie.detail.domain.CommentVo;
import kr.or.eutchapedia.movie.detail.repository.CommentMapper;

@Service
@Transactional
public class CommentDao {

	@Autowired
	CommentMapper mapper;

	// 코멘트 기본 select
	public Map<String, Object> selectCommentList(CommentPage page) {

		Map<String, Object> commentListMap = new HashMap<>();
		List<CommentListVo> commentList = new ArrayList<>();

		try {
			int totalListSize = mapper.totalListSize(page);
			
			page.setTotalListSize(totalListSize);
			if (page.getNowPage() == 0) {
				page.setNowPage(1);
			}
			
			page.pageCompute();
			commentList = mapper.selectCommentList(page);
			for (CommentListVo vo : commentList) {
				if (vo.getPhoto() == null) {
					vo.setPhoto("/img/movie/profile.svg");
				}
			}
			
			commentListMap.put("page", page);
			commentListMap.put("commentList", commentList);
			commentListMap.put("commentCount", totalListSize);
			commentListMap.put("movieDocId", page.getMovieDocId());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return commentListMap;
	}

	// 신고 모달을 위한 영화 제목 받아오기 
	public String selectMovieTitle(String movieDocId) {
		String title = "";
		
		try {
			title = mapper.selectMovieTitle(movieDocId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return title;
	}
	
	public int insertComment(CommentVo commentVo) {
		int result = 0;
		
		try {
			mapper.insertComment(commentVo);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updateComment(CommentVo commentVo) {
		int result = 0;
		
		try {
			mapper.updateComment(commentVo);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteComment(int commentIndex) {
		int result = 0;
		
		try {
			mapper.deleteComment(commentIndex);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
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

}
