package kr.or.eutchapedia.mypage.service;

import java.util.List;

import kr.or.eutchapedia.mypage.entity.CommentVo;
import kr.or.eutchapedia.mypage.entity.MyQnaVo;

public interface MyCommService {
	List<MyQnaVo> selectQna(String memberEmail);
	List<CommentVo> selectComm(String memberEmail);
	void deleteQna(String qnaNo);
}
