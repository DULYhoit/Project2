package kr.or.eutchapedia.board.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eutchapedia.board.notice.domain.Criteria;
import kr.or.eutchapedia.board.notice.domain.MemberCheckVo;
import kr.or.eutchapedia.board.notice.domain.NoticeVo;
import kr.or.eutchapedia.board.notice.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public void insertNotice(NoticeVo board) throws Exception {
		noticeMapper.insertNotice(board);
	}

	@Override
	public void updateNotice(NoticeVo board) throws Exception {
		noticeMapper.updateNotice(board);
	}

	@Override
	public void deleteNotice(String noticeNo) throws Exception {
		noticeMapper.deleteNotice(noticeNo);
	}

	@Override
	public List<NoticeVo> boardList(Criteria cri) throws Exception {
		return noticeMapper.boardList(cri);
	}

	@Override
	public NoticeVo boardDetail(long noticeNo) throws Exception {
		return noticeMapper.boardDetail(noticeNo);
	}
	@Override
	public int totalCnt(Criteria cri) throws Exception {
		return noticeMapper.totalCnt(cri);
	}

	@Override
	public MemberCheckVo getMember(String member) {
		MemberCheckVo getmember = noticeMapper.getMember(member);
		return getmember;
	}





}
