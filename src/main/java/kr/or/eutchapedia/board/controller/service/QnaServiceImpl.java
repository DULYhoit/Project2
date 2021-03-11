package kr.or.eutchapedia.board.controller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eutchapedia.board.dao.QnaDAO;
import kr.or.eutchapedia.board.entity.Faq;
import kr.or.eutchapedia.board.entity.QnaVO;
import kr.or.eutchapedia.board.entity.QnaView;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDao;
	
	@Override
	public List<QnaView> selectBoardList(QnaVO vo, String memberEmail) throws Exception {
		List<QnaView> list = null;
        list = qnaDao.selectBoardList(vo, memberEmail);
        return list;
	}

	@Override
	public int insertBoard(QnaVO vo) throws Exception {
		 return qnaDao.insertBoard(vo);		
	}


	@Override
	public void updateBoard(QnaVO vo) throws Exception {
		 qnaDao.updateBoard(vo);		
		
	}
	
	@Override
    public void deleteBoard(QnaVO vo) throws Exception {
		qnaDao.deleteBoard(vo);
    }

	@Override
	public QnaVO selectBoardByCode(QnaVO vo) throws Exception {
		QnaVO resultVO = qnaDao.selectBoardByCode(vo);
		return resultVO; 
	}

	@Override
	public QnaVO detail(int qnaNo) {
		// TODO Auto-generated method stub
		return qnaDao.detail(qnaNo);
	}

	@Override
	public void reply(QnaVO vo,String aContent, String qnaNo) {
		// TODO Auto-generated method stub
		qnaDao.reply(vo,aContent,qnaNo);
	}
	
	
	//수정
	@Override
	public void update(QnaVO vo) {
		// TODO Auto-generated method stub
		qnaDao.update(vo);
	}

}