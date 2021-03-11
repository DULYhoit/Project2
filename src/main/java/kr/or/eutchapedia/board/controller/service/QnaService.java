package kr.or.eutchapedia.board.controller.service;

import java.util.List;

import kr.or.eutchapedia.board.entity.QnaVO;
import kr.or.eutchapedia.board.entity.QnaView;

public interface QnaService {

	public List<QnaView> selectBoardList(QnaVO vo, String memberEmail) throws Exception;
	//글 등록 
	public int insertBoard(QnaVO vo)throws Exception ;

	public void updateBoard(QnaVO vo)throws Exception ;

	void deleteBoard(QnaVO vo) throws Exception;
	
	public QnaVO selectBoardByCode(QnaVO vo)throws Exception ;

	QnaVO detail(int qnaNo);

	void reply(QnaVO vo,String aContent, String qnaNo);

	//수정
	 void update(QnaVO vo);
	
}
