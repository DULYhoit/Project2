package kr.or.eutchapedia.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eutchapedia.mypage.dao.MyCommMapper;
import kr.or.eutchapedia.mypage.entity.CommentVo;
import kr.or.eutchapedia.mypage.entity.MyQnaVo;

@Service
public class MyCommServiceImpl implements MyCommService{
	@Autowired
	private MyCommMapper myCommMapper;

	@Override
	public List<CommentVo> selectComm(String memberEmail) {
		return myCommMapper.selectComm(memberEmail);
	}
	@Override
	public List<MyQnaVo> selectQna(String memberEmail) {
		return myCommMapper.selectQna(memberEmail);
	}
	@Override
	public void deleteQna(String qnaNo) {
		myCommMapper.deleteQna(qnaNo);
	}

}
