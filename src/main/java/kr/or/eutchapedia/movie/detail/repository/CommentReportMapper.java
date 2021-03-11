package kr.or.eutchapedia.movie.detail.repository;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.or.eutchapedia.movie.detail.domain.CommentReportVo;

@Mapper
@Repository
public interface CommentReportMapper {
	public int reportComment(CommentReportVo commentReportVo);
	public void updateReportCount(int commentIndex);
}
