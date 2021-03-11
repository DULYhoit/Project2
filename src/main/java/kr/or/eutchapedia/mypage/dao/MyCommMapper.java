package kr.or.eutchapedia.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.eutchapedia.mypage.entity.CommentVo;
import kr.or.eutchapedia.mypage.entity.MyQnaVo;

@Mapper
public interface MyCommMapper {
	List<CommentVo> selectComm(String memberEmail);
	List<MyQnaVo> selectQna(String memberEmail);
	void deleteQna(String qnaNo);

}
