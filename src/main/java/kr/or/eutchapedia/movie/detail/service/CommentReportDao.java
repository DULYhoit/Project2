package kr.or.eutchapedia.movie.detail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eutchapedia.movie.detail.domain.CommentReportVo;
import kr.or.eutchapedia.movie.detail.repository.CommentReportMapper;

@Service
@Transactional
public class CommentReportDao {

	@Autowired
	CommentReportMapper mapper;
	
	// 신고하기 
	public int reportComment(CommentReportVo commentReportVo) {
		int result = 0;
		
		try {
			result = mapper.reportComment(commentReportVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 신고 횟수 올리기
	public void updateReportCount(int commentIndex) {
		
		try {
			mapper.updateReportCount(commentIndex);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
